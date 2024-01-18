part of 'operator_card_bloc.dart';

sealed class OperatorCardState extends Equatable {
  const OperatorCardState();
  
  @override
  List<Object> get props => [];
}

final class OperatorCardInitial extends OperatorCardState {}
