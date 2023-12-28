import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_ebanking/models/signup_model.dart';
import 'package:mobile_ebanking/services/auth_services.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is AuthCheckEmail) {
        try {
          emit(
            AuthLoading(),
          );
          final response = await AuthServices().checkEmail(event.email);
          if (response == false) {
            emit(
              AuthCheckEmailSucces(),
            );
          } else {
            emit(
              const AuthFailed("Email Anda Sudah Di Gunakan"),
            );
          }
        } catch (e) {
          emit(
            AuthFailed(
              e.toString(),
            ),
          );
        }
      }
    });
  }
}
