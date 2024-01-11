part of 'top_up_bloc.dart';

sealed class TopUpState extends Equatable {
  const TopUpState();

  @override
  List<Object> get props => [];
}

final class TopUpInitial extends TopUpState {}

final class TopUpLoading extends TopUpState {}

final class TopUpSucces extends TopUpState {
  final String redirectUrl;

  const TopUpSucces(this.redirectUrl);

  @override
  List<Object> get props => [redirectUrl];
}

final class TopUpFailed extends TopUpState {
  final String error;

  const TopUpFailed(this.error);

  @override
  List<Object> get props => [error];
}
