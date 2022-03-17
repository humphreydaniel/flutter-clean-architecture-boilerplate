import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../settings.dart';

part 'onboard_event.dart';
part 'onboard_state.dart';

class OnBoardBloc extends Bloc<OnBoardEvent, OnBoardState> {
  final GetOnBoardStatusUseCase getOnBoardStatusUseCase;
  final SetDoneOnBoardUseCase setDoneOnBoardUseCase;
  OnBoardBloc({
    @required this.getOnBoardStatusUseCase,
    @required this.setDoneOnBoardUseCase,
  })  : assert(
          getOnBoardStatusUseCase != null && setDoneOnBoardUseCase != null,
        ),
        super(OnBoardInitial());

  @override
  Stream<OnBoardState> mapEventToState(
    OnBoardEvent event,
  ) async* {
    if (event is InitializeOnBoardEvent) {
      yield* _mapInitializeToState();
    } else if (event is MarkDoneOnBoardEvent) {
      yield* _mapMarkDoneToState();
    }
  }

  Stream<OnBoardState> _mapInitializeToState() async* {
    try {
      final result = await getOnBoardStatusUseCase(NoParams());
      yield* result.fold((l) async* {
        yield BeforeOnBoardState();
      }, (r) async* {
        if (r == true) {
          yield AfterOnBoardState();
        } else {
          yield BeforeOnBoardState();
        }
      });
    } catch (_) {
      yield BeforeOnBoardState();
    }
  }

  Stream<OnBoardState> _mapMarkDoneToState() async* {
    try {
      final result = await setDoneOnBoardUseCase(NoParams());

      yield* result.fold(
        (l) async* {
          yield BeforeOnBoardState();
        },
        (r) async* {
          yield AfterOnBoardState();
        },
      );
    } catch (_) {}
  }
}
