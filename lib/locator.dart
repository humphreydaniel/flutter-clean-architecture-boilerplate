import 'package:auth/auth.dart';
import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/foundation.dart';

import 'flavors.dart';
import 'module.dart';

Future<void> setup() async {
  await _injectConfig();
  await _injectCore();

  await Modular.init(appModules);
}

Future<void> _injectConfig() async {
  GlobalConfiguration globalConfig;

  final _envName = describeEnum(F.appFlavor).toLowerCase();
  final _configPath = 'assets/cfg/$_envName\_env.json';

  globalConfig = await GlobalConfiguration.setup(_configPath);

  GetIt.I.registerLazySingleton<GlobalConfiguration>(() => globalConfig);
}

Future<void> _injectCore() async {
  await Firebase.initializeApp();
  Bloc.observer = AppBlocObserver();
  CacheManager _cacheManager = await CacheManagerImpl.getInstance(
    encryptKey: GetIt.I<GlobalConfiguration>().getValue('encrypt'),
  );
  GetIt.I.registerLazySingleton<CacheManager>(() => _cacheManager);
  GetIt.I.registerLazySingleton(() => Dio(
        BaseOptions(
          baseUrl: GetIt.I<GlobalConfiguration>().getValue('base_url'),
        ),
      ));
  GetIt.I<Dio>().interceptors.addAll([
    DioLogInterceptor(
      responseBody: true,
      requestBody: true,
    ),
    AuthHttpInterceptor(cacheManager: GetIt.I()),
    DioFirebasePerformanceInterceptor(),
  ]);
}
