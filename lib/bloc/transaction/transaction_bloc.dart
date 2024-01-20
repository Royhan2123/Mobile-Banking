import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_ebanking/models/transaction_models.dart';
import 'package:mobile_ebanking/services/transaction_services.dart';

part 'transaction_event.dart';
part 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  TransactionBloc() : super(TransactionInitial()) {
    on<TransactionEvent>((event, emit) async {
      if (event is TransactionGet) {
        try {
          emit(
            TransactionLoading(),
          );
          final transactionModels =
              await TransactionServices().getTransaction();
          print(transactionModels);
          emit(
            TransactionSucces(transactionModels),
          );
        } catch (e) {
          print(e);
          emit(
            TransactionFailed(
              e.toString(),
            ),
          );
        }
      }
    });
  }
}
