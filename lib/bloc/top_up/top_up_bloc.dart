import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_ebanking/models/topup_form_model.dart';
import 'package:mobile_ebanking/services/transaction_services.dart';

part 'top_up_event.dart';
part 'top_up_state.dart';

class TopUpBloc extends Bloc<TopUpEvent, TopUpState> {
  TopUpBloc() : super(TopUpInitial()) {
    on<TopUpEvent>((event, emit) async {
      if (event is TopUpPost) {
        try {
          emit(
            TopUpLoading(),
          );

          final redirectUrl = await TransactionServices().topUp(event.data);

          emit(
            TopUpSucces(redirectUrl),
          );
        } catch (e) {
          emit(
            TopUpFailed(
              e.toString(),
            ),
          );
        }
      }
    });
  }
}
