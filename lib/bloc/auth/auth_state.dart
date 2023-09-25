part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthFailed extends AuthState {
  final String e;

  const AuthFailed(this.e);
  @override
  List<Object> get props => [e];
}

final class AuthSucces extends AuthState {
  final UserModels user;
  const AuthSucces(this.user);
  @override
  List<Object> get props => [user];
}

final class AuthCheckEmailSucces extends AuthState {}
