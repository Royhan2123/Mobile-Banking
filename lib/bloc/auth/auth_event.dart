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
  final UserModels user;
  const AuthUpdateUser(this.user, this.data);

  @override
  List<Object> get props => [data, user];
}

class AuthUpdatePin extends AuthEvent {
  final String oldPin;
  final String newPin;

  const AuthUpdatePin(this.oldPin, this.newPin);

  @override
  List<Object> get props => [oldPin, newPin];
}

class AuthLogout extends AuthEvent {}

class AuthUpdateBalance extends AuthEvent {
  final int amount;

  const AuthUpdateBalance(this.amount);

  @override
  List<Object> get props => [amount];
}
