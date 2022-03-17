import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'bottom_nav_event.dart';

class BottomNavBloc extends Bloc<BottomNavEvent, int> {
  BottomNavBloc() : super(0);

  bool isService = false;

  @override
  Stream<int> mapEventToState(
    BottomNavEvent event,
  ) async* {
    if (event is ChangeBottomNavEvent) {
      isService = false;

      yield event.index;
    } else if (event is ChangeTabOrderBottomNavEvent) {
      isService = event.isService;

      yield state;
    }
  }
}
