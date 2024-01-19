part of 'data_plan_bloc.dart';

sealed class DataPlanState extends Equatable {
  const DataPlanState();
  
  @override
  List<Object> get props => [];
}

final class DataPlanInitial extends DataPlanState {}
