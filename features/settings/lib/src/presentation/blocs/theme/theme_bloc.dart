import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:preferences/preferences.dart';

import '../../../../settings.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final GetThemeUseCase getThemeUseCase;
  final SetThemeUseCase setThemeUseCase;
  ThemeBloc({
    @required this.getThemeUseCase,
    @required this.setThemeUseCase,
  })  : assert(getThemeUseCase != null && setThemeUseCase != null),
        super(ThemeState(
          theme: AppThemeData.data[AppTheme.greenLight],
        ));

  @override
  Stream<ThemeState> mapEventToState(
    ThemeEvent event,
  ) async* {
    if (event is InitializeThemeEvent) {
      final result = await getThemeUseCase(NoParams());
      yield* result.fold((l) async* {}, (r) async* {
        if (r != null && AppThemeData.data[r] != null) {
          yield ThemeState(theme: AppThemeData.data[r]);
        } else {
          yield ThemeState(theme: AppThemeData.data[AppTheme.greenLight]);
        }
      });
    } else if (event is ChangeThemeEvent) {
      final result = await setThemeUseCase(event.theme);
      if (result?.isRight() ?? false) {
        add(InitializeThemeEvent());
      }
    }
  }
}
