import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../settings.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  final GetLanguageUseCase getLanguageUseCase;
  final SetLanguageUseCase setLanguageUseCase;

  LanguageBloc({
    @required this.getLanguageUseCase,
    @required this.setLanguageUseCase,
  })  : assert(getLanguageUseCase != null && setLanguageUseCase != null),
        super(LanguageState(SettingConfig.defaultCountry));

  @override
  Stream<LanguageState> mapEventToState(
    LanguageEvent event,
  ) async* {
    if (event is ChangeLanguageEvent) {
      yield* _mapChangeLanguageToState(event);
    } else if (event is InitializeLanguageEvent) {
      yield* _mapInitializeLanguageToState(event);
    }
  }

  Stream<LanguageState> _mapChangeLanguageToState(
      ChangeLanguageEvent event) async* {
    await setLanguageUseCase(
      CountryModel(
        code: event.country.code,
        name: event.country.name,
        flag: event.country.flag,
        dialCode: event.country.dialCode,
      ),
    );
    add(InitializeLanguageEvent());
  }

  Stream<LanguageState> _mapInitializeLanguageToState(
      InitializeLanguageEvent event) async* {
    try {
      final result = await _getSavedCountry();
      if (result != null) {
        yield LanguageState(result);
      }
    } catch (_) {}
  }

  Future<Country> _getSavedCountry() async {
    final result = await getLanguageUseCase(NoParams());
    return result.fold(
      (l) => null,
      (r) => r,
    );
  }
}
