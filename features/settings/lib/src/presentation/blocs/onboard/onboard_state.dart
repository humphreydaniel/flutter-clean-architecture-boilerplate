part of 'onboard_bloc.dart';

abstract class OnBoardState extends Equatable {
  const OnBoardState();
}

class OnBoardInitial extends OnBoardState {
  @override
  List<Object> get props => [];
}

class AfterOnBoardState extends OnBoardState {
  @override
  List<Object> get props => [];
}

class BeforeOnBoardState extends OnBoardState {
  @override
  List<Object> get props => [];
}
