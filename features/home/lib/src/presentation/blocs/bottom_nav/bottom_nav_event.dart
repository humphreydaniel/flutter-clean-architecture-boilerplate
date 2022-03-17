part of 'bottom_nav_bloc.dart';

abstract class BottomNavEvent extends Equatable {}

class ChangeBottomNavEvent extends BottomNavEvent {
  final int index;
  ChangeBottomNavEvent({
    @required this.index,
  }) : assert(index >= 0 && index <= 4);

  @override
  List<Object> get props => [index];

  @override
  bool get stringify => true;
}

class ChangeTabOrderBottomNavEvent extends BottomNavEvent {
  final bool isService;

  ChangeTabOrderBottomNavEvent({this.isService = false});

  @override
  List<Object> get props => [isService];
}
