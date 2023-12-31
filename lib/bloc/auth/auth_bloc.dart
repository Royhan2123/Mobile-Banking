import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_ebanking/models/signin_model.dart';
import 'package:mobile_ebanking/models/signup_model.dart';
import 'package:mobile_ebanking/models/users_edit_form_model.dart';
import 'package:mobile_ebanking/models/users_model.dart';
import 'package:mobile_ebanking/services/auth_services.dart';
import 'package:mobile_ebanking/services/user_services.dart';
import 'package:mobile_ebanking/services/wallet_services.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>(
      (event, emit) async {
        if (event is AuthCheckEmail) {
          try {
            emit(AuthLoading());

            final res = await AuthServices().checkEmail(event.email);
            if (res == false) {
              emit(AuthCheckEmailSucces());
            } else {
              emit(const AuthFailed('email sudah dipakai'));
            }
          } catch (e) {
            emit(AuthFailed(e.toString()));
          }
        }

        if (event is AuthRegister) {
          try {
            emit(AuthLoading());

            final res = await AuthServices().register(event.user);

            emit(AuthSucces(res));
          } catch (e) {
            emit(AuthFailed(e.toString()));
          }
        }

        if (event is AuthLogin) {
          try {
            emit(AuthLoading());

            final res = await AuthServices().login(event.user);

            emit(AuthSucces(res));
          } catch (e) {
            emit(AuthFailed(e.toString()));
          }
        }

        if (event is AuthGetCurrentUser) {
          try {
            emit(AuthLoading());

            final SignInModels res =
                await AuthServices().getCredentialFromLocal();

            final UserModels user = await AuthServices().login(res);

            emit(AuthSucces(user));
          } catch (e) {
            emit(AuthFailed(e.toString()));
          }
        }
        if (event is AuthUpdateUser) {
          try {
            if (state is AuthSucces) {
              final updateUser = (state as AuthSucces).user.copyWith(
                    userName: event.data.username,
                    name: event.data.name,
                    email: event.data.email,
                    password: event.data.password,
                  );
              emit(
                AuthLoading(),
              );
              await UserServices().updateUser(event.data);

              emit(
                AuthSucces(updateUser),
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
        if (event is AuthUpdatePin) {
          try {
            if (state is AuthSucces) {
              final updateUser = (state as AuthSucces).user.copyWith(
                    pin: event.newPin,
                  );
              emit(
                AuthLoading(),
              );
              await WalletSercives().updatePin(event.oldPin, event.newPin);
              emit(
                AuthSucces(updateUser),
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
      },
    );
  }
}
