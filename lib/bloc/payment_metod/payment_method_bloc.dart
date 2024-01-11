import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_ebanking/models/payment_method.dart';
import 'package:mobile_ebanking/services/payment_method_services.dart';

part 'payment_method_event.dart';
part 'payment_method_state.dart';

class PaymentMethodBloc extends Bloc<PaymentMethodEvent, PaymentMethodState> {
  PaymentMethodBloc() : super(PaymentMethodInitial()) {
    on<PaymentMethodEvent>((event, emit) async {
      if (event is PaymentMethodGet) {
        try {
          emit(
            PaymentMethodLoading(),
          );

          final paymentMethods =
              await PaymentMethodServices().getPaymentMethods();
          emit(
            PaymentMethodSucces(paymentMethods),
          );
        } catch (e) {
          emit(
            PaymentMethodFailed(
              e.toString(),
            ),
          );
        }
      }
    });
  }
}
