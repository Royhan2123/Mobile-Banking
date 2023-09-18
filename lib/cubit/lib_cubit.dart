import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'lib_state.dart';

class LibCubit extends Cubit<LibState> {
  LibCubit() : super(LibInitial());
}
