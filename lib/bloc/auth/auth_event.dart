part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthCheckEmail extends AuthEvent {
  final String email;

  const AuthCheckEmail(this.email);
  @override
  List<Object> get props => [email];
}

class AuthRegister extends AuthEvent {
  final SignUpModels user;

  const AuthRegister(this.user);
  @override
  List<Object> get props => [user];
}

class AuthLogin extends AuthEvent {
  final SignInModels user;

  const AuthLogin(this.user);
  @override
  List<Object> get props => [user];
}

class AuthGetCurrentUser extends AuthEvent {}

class AuthUpdateUser extends AuthEvent {
  final UserEditFormModel data;
  const AuthUpdateUser(this.data);

  @override
  List<Object> get props => [data];
}

class AuthUpdatePin extends AuthEvent {
  final String oldPin;
  final String newPin;

  const AuthUpdatePin(this.oldPin, this.newPin);

  @override
  List<Object> get props => [oldPin, newPin];
}
