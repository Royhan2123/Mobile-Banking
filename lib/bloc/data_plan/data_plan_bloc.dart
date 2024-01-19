import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'data_plan_event.dart';
part 'data_plan_state.dart';

class DataPlanBloc extends Bloc<DataPlanEvent, DataPlanState> {
  DataPlanBloc() : super(DataPlanInitial()) {
    on<DataPlanEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
