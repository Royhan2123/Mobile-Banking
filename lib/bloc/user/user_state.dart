part of 'user_bloc.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

final class UserInitial extends UserState {}

final class UserLoading extends UserState {}

final class UserSucces extends UserState {
  final List<UserModels> user;

  const UserSucces(this.user);

  @override
  List<Object> get props => [user];
}

final class UserFailed extends UserState {
  final String error;

  const UserFailed(this.error);

  @override
  List<Object> get props => [error];
}
