import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../home.dart';

class HomeModule implements BaseModule {
  @override
  void inject(GetIt getIt) {
    // Presentation
    getIt.registerLazySingleton(() => BottomNavBloc());
  }

  @override
  Map<String, Route> routes(RouteSettings settings) {
    return {};
  }
}
