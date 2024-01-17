part of 'transfer_bloc.dart';

sealed class TransferState extends Equatable {
  const TransferState();
  
  @override
  List<Object> get props => [];
}

final class TransferInitial extends TransferState {}
