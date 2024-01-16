// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_ebanking/models/signin_model.dart';
import 'package:mobile_ebanking/models/signup_model.dart';
import 'package:mobile_ebanking/models/users_edit_form_model.dart';
import 'package:mobile_ebanking/models/users_model.dart';
import 'package:mobile_ebanking/services/auth_services.dart';
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
            emit(AuthLoading());

            await AuthServices().updateUser(event.data);

            final updatedUser = event.user.copyWith(
              name: event.data.name,
              userName: event.data.username,
              email: event.data.email,
            );

            emit(AuthSucces(updatedUser));
          } catch (e) {
            emit(AuthFailed(e.toString()));
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
        
        if (event is AuthLogout) {
          try {
            emit(
              AuthLoading(),
            );
            await AuthServices().logout();
            await AuthServices().clearLocalStorage();
            emit(
              AuthInitial(),
            );
          } catch (e) {
            print("ERROR LOGOUT $e");
            emit(
              AuthFailed('Failed to logout: $e'),
            );
          }
        }
        
        if (event is AuthUpdateBalance) {
          if (state is AuthSucces) {
            final currentUser = (state as AuthSucces).user;
            final updateUser = currentUser.copyWith(
              balance: currentUser.balance! + event.amount,
            );
            emit(
              AuthSucces(updateUser),
            );
          }
        }
      },
    );
  }
}
