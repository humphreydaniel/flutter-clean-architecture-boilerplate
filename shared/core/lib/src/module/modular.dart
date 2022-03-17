import 'package:dependencies/dependencies.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

import '../../core.dart';

class Modular {
  static GetIt _sl;
  static List<BaseModule> _modules = [];

  const Modular._();

  static Future init(List<BaseModule> modules) async {
    _sl = GetIt.I;
    _modules = modules;

    for (var item in modules) {
      await item.inject(_sl);
    }
  }

  static Route<dynamic> routes(RouteSettings settings) {
    // List all routes module
    final _routeModules = <String, Route>{};

    for (var item in _modules) {
      _routeModules.addAll(item.routes(settings));
    }

    print('Navigation to ${settings.name}');
    return _routeModules['${settings.name}'] ??
        CupertinoPageRoute(builder: (_) => Container());
  }
}
