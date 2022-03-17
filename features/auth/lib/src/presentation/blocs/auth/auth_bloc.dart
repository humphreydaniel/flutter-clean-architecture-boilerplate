import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:core/core.dart';

import '../../../../auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final GetUserUseCase userUseCase;
  final GetLogOutUseCase logOutUseCase;

  AuthBloc({
    @required this.userUseCase,
    @required this.logOutUseCase,
  })  : assert(userUseCase != null && logOutUseCase != null),
        super(AuthState.unKnow());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is AuthLoginEvent) {
      if (event?.user != null && event.user?.id != null) {
        yield AuthState.authenticated(event.user);
      }
    } else if (event is AuthInitializeEvent) {
      yield* _mapInitializeToState();
    } else if (event is AuthLogoutEvent) {
      yield* _mapLogOutToState();
    }
  }

  Stream<AuthState> _mapInitializeToState() async* {
    UserEntity user;

    final userResult = await userUseCase(NoParams());
    userResult.fold((l) => null, (r) {
      user = r;
    });

    if (user != null) {
      yield AuthState.authenticated(user);
    } else {
      yield AuthState.unAuthenticated();
    }
  }

  Stream<AuthState> _mapLogOutToState() async* {
    yield* (await logOutUseCase(NoParams())).fold((l) => null, (r) async* {
      yield AuthState.unAuthenticated();
    });
  }
}
