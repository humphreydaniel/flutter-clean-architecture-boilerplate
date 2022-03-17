part of 'onboard_bloc.dart';

abstract class OnBoardEvent extends Equatable {
  const OnBoardEvent();
}

class InitializeOnBoardEvent extends OnBoardEvent {
  @override
  List<Object> get props => [];
}

class MarkDoneOnBoardEvent extends OnBoardEvent {
  @override
  List<Object> get props => [];
}
