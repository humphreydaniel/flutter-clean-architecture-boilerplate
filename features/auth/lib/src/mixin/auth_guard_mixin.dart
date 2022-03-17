import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import '../../auth.dart';

mixin AuthGuardMixin<T extends StatefulWidget> on State<T> {
  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final state = GetIt.I<AuthBloc>().state;
      if (state.status != AuthenticationStatus.authenticated) {
        Future.microtask(() async {
          final result = await Navigator.pushNamed(context, '/login');
          if (result == null || result != true) {
            onUnAuthentication();
          } else {
            onAuthenticated();
          }
        });
      } else {
        onAuthenticated();
      }
    });

    super.didChangeDependencies();
  }

  @protected
  void onUnAuthentication() {}

  @protected
  void onAuthenticated() {}
}
