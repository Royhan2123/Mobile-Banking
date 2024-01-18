import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_ebanking/models/operator_card_models.dart';
import 'package:mobile_ebanking/services/operator_card_services.dart';

part 'operator_card_event.dart';
part 'operator_card_state.dart';

class OperatorCardBloc extends Bloc<OperatorCardEvent, OperatorCardState> {
  OperatorCardBloc() : super(OperatorCardInitial()) {
    on<OperatorCardEvent>((event, emit) async {
      if (event is OperatorCardGet) {
        try {
          emit(
            OperatorCardLoading(),
          );

          final operatorCards = await OperatorCardServices().getOperatorCard();

          emit(
            OperatorCardSucces(operatorCards),
          );
        } catch (e) {
          emit(
            OperatorCardFailed(
              e.toString(),
            ),
          );
        }
      }
    });
  }
}
