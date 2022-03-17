import 'dart:async';

import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:meta/meta.dart';

import '../../../../auth.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterWithEmailUseCase registerWithEmailUseCase;

  RegisterBloc({
    @required this.registerWithEmailUseCase,
  })  : assert(registerWithEmailUseCase != null),
        super(const RegisterState());

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if (event is RegisterEmailChanged) {
      yield _mapEmailChangedToState(event, state);
    } else if (event is RegisterPasswordChanged) {
      yield _mapPasswordChangedToState(event, state);
    } else if (event is RegisterSubmitted) {
      yield* _mapRegisterSubmittedToState(event, state);
    } else if (event is RegisterNameChanged) {
      yield _mapNameChangedToState(event, state);
    } else if (event is RegisterPhoneChanged) {
      yield _mapPhoneChangedToState(event, state);
    }
  }

  RegisterState _mapNameChangedToState(
    RegisterNameChanged event,
    RegisterState state,
  ) {
    final name = NameFormZ.dirty(event.name);

    return state.copyWith(
      name: name,
      status: Formz.validate([name, state.email, state.password, state.phone]),
    );
  }

  RegisterState _mapEmailChangedToState(
    RegisterEmailChanged event,
    RegisterState state,
  ) {
    final email = EmailFormZ.dirty(event.email);

    return state.copyWith(
      email: email,
      status: Formz.validate([state.name, email, state.password, state.phone]),
    );
  }

  RegisterState _mapPasswordChangedToState(
    RegisterPasswordChanged event,
    RegisterState state,
  ) {
    final password = PasswordFormZ.dirty(event.password, withValidator: true);

    return state.copyWith(
      password: password,
      status: Formz.validate([state.name, state.email, password, state.phone]),
    );
  }

  RegisterState _mapPhoneChangedToState(
    RegisterPhoneChanged event,
    RegisterState state,
  ) {
    final phone = PhoneFormZ.dirty(event.phone);

    return state.copyWith(
      phone: phone,
      status: Formz.validate([state.name, state.email, state.password, phone]),
    );
  }

  Stream<RegisterState> _mapRegisterSubmittedToState(
    RegisterSubmitted event,
    RegisterState state,
  ) async* {
    if (state.status.isValidated) {
      yield state.copyWith(status: FormzStatus.submissionInProgress);
      try {
        final result = await registerWithEmailUseCase(
          RegisterEmailParams(
            data: RegisterEmailBody(
              name: state.name.value,
              email: state.email.value,
              password: state.password.value,
              phoneNumber: state.phone.value,
            ),
          ),
        );

        yield* result.fold((l) async* {
          yield state.copyWith(
            status: FormzStatus.submissionFailure,
            failure: l,
          );
        }, (r) async* {
          yield state.copyWith(status: FormzStatus.submissionSuccess, user: r);
        });
      } on Exception catch (_) {
        yield state.copyWith(status: FormzStatus.submissionFailure);
      }
    }
  }
}
