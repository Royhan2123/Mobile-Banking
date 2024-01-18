part of 'operator_card_bloc.dart';

sealed class OperatorCardState extends Equatable {
  const OperatorCardState();

  @override
  List<Object> get props => [];
}

final class OperatorCardInitial extends OperatorCardState {}

final class OperatorCardLoading extends OperatorCardState {}

final class OperatorCardSucces extends OperatorCardState {
  final List<OperatorCardModels> operatorCards;

  const OperatorCardSucces(this.operatorCards);

  @override
  List<Object> get props => [operatorCards];
}

final class OperatorCardFailed extends OperatorCardState {
  final String error;

  const OperatorCardFailed(this.error);

  @override
  List<Object> get props => [error];
}
