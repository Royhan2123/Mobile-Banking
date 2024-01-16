import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_ebanking/models/users_model.dart';
import 'package:mobile_ebanking/services/user_services.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<UserEvent>((event, emit) async {
      if (event is UserGetByUsername) {
        try {
          emit(
            UserLoading(),
          );
          final user = await UserServices().getUsersByUsername(event.username);
          emit(
            UserSucces(user),
          );
        } catch (e) {
          emit(
            UserFailed(
              e.toString(),
            ),
          );
        }
      }

      if (event is UserGetRecent) {
        try {
          emit(
            UserLoading(),
          );
          final user = await UserServices().getRecentUsers();
          emit(
            UserSucces(user),
          );
        } catch (e) {
          emit(
            UserFailed(
              e.toString(),
            ),
          );
        }
      }
    });
  }
}
