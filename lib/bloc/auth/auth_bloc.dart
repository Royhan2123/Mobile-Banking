import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_ebanking/models/signin_model.dart';
import 'package:mobile_ebanking/models/signup_model.dart';
import 'package:mobile_ebanking/models/users_model.dart';
import 'package:mobile_ebanking/services/auth_services.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>(
      (event, emit) async {
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

        if (event is AuthRegister) {
          try {
            emit(
              AuthLoading(),
            );
            final user = await AuthServices().register(event.data);
            emit(
              AuthSucces(user),
            );
          } catch (e) {
            emit(
              AuthFailed(
                e.toString(),
              ),
            );
          }
        }

        if (event is AuthLogin) {
          try {
            emit(
              AuthLoading(),
            );
            final user = await AuthServices().login(event.data);
            emit(
              AuthSucces(user),
            );
          } catch (e) {
            emit(
              AuthFailed(
                e.toString(),
              ),
            );
          }
        }
        if (event is AuthGetCurrentUser) {
          try {
            emit(
              AuthLoading(),
            );
            final SignInModels data = await AuthServices().getCredentialFromLocal();
            
            final UserModels user = await AuthServices().login(data);
            emit(
              AuthSucces(user),
            );
          } catch (e) {
            emit(
              AuthFailed(
                e.toString(),
              ),
            );
          }
        }
      },
    );
  }
}
