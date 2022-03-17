import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';

import '../../../../auth.dart';

part 'reset_password_event.dart';
part 'reset_password_state.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  final GetResetPasswordUseCase resetPasswordUseCase;
  ResetPasswordBloc(this.resetPasswordUseCase) : super(ResetPasswordInitial());

  @override
  Stream<ResetPasswordState> mapEventToState(
    ResetPasswordEvent event,
  ) async* {
    if (event is GetResetPasswordEvent) {
      try {
        yield ResetPasswordLoading();
        final result = await resetPasswordUseCase(event.email);

        yield* result.fold((l) async* {
          yield ResetPasswordFailure(l);
        }, (r) async* {
          yield ResetPasswordSuccess();
        });
        // ignore: avoid_catches_without_on_clauses
      } catch (e) {
        yield ResetPasswordFailure(null);
      }
    }
  }
}
