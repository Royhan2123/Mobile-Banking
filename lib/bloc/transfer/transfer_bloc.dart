import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_ebanking/models/transfer_form_model.dart';
import 'package:mobile_ebanking/services/transaction_services.dart';

part 'transfer_event.dart';
part 'transfer_state.dart';

class TransferBloc extends Bloc<TransferEvent, TransferState> {
  TransferBloc() : super(TransferInitial()) {
    on<TransferEvent>((event, emit) async {
      if (event is TransferPost) {
        try {
          emit(
            TransferLoading(),
          );
          await TransactionServices().trasnfer(event.data);
          emit(
            TransferSucces(),
          );
        } catch (e) {
          emit(
            TransferFailed(
              e.toString(),
            ),
          );
        }
      }
    });
  }
}
