part of 'payment_method_bloc.dart';

sealed class PaymentMethodState extends Equatable {
  const PaymentMethodState();

  @override
  List<Object> get props => [];
}

final class PaymentMethodInitial extends PaymentMethodState {}

final class PaymentMethodLoading extends PaymentMethodState {}

final class PaymentMethodFailed extends PaymentMethodState {
  final String error;

  const PaymentMethodFailed(this.error);

  @override
  List<Object> get props => [error];
}

final class PaymentMethodSucces extends PaymentMethodState {
  final List<PaymenMethodModel> paymentMethod;

  const PaymentMethodSucces(this.paymentMethod);

  @override
  List<Object> get props => [paymentMethod];
}
