part of 'lib_cubit.dart';

sealed class LibState extends Equatable {
  const LibState();

  @override
  List<Object> get props => [];
}

final class LibInitial extends LibState {}
