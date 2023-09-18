import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_ebanking/services/auth_services.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is AuthCheckEmail) {
        try {
          emit(AuthLoading());
          final res = await AuthServices().checkEmail(event.email);

          if (res == false) {
            emit(AuthCheckEmailSucces());
          } else {
            emit(const AuthFailed("Email Anda SUdah Terpaki"));
          }
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }
    });
  }
}
