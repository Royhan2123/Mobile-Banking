import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_ebanking/models/data_plan_form_model.dart';
import 'package:mobile_ebanking/services/transaction_services.dart';

part 'data_plan_event.dart';
part 'data_plan_state.dart';

class DataPlanBloc extends Bloc<DataPlanEvent, DataPlanState> {
  DataPlanBloc() : super(DataPlanInitial()) {
    on<DataPlanEvent>((event, emit) async {
      if (event is DataPlanPost) {
        try {
          emit(
            DataPlanLoading(),
          );
          await TransactionServices().dataPlan(event.data);
          emit(
            DataPlanSucces(),
          );
        } catch (e) {
          emit(
            DataPlanFailed(
              e.toString(),
            ),
          );
        }
      }
    });
  }
}
