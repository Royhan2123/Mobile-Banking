part of 'top_up_bloc.dart';

sealed class TopUpEvent extends Equatable {
  const TopUpEvent();

  @override
  List<Object> get props => [];
}

class TopUpPost extends TopUpEvent {
  final TopupFormModel data;
  const TopUpPost(this.data);

  @override
  List<Object> get props => [data];
}
