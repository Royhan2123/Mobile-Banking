part of 'transaction_bloc.dart';

sealed class TransactionState extends Equatable {
  const TransactionState();

  @override
  List<Object> get props => [];
}

final class TransactionInitial extends TransactionState {}

final class TransactionLoading extends TransactionState {}

final class TransactionSucces extends TransactionState {
  final List<TransactionModels> transactionModels;

  const TransactionSucces(this.transactionModels);

  @override
  List<Object> get props => [transactionModels];
}

final class TransactionFailed extends TransactionState {
  final String error;

  const TransactionFailed(this.error);

  @override
  List<Object> get props => [error];
}
