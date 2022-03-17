import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../settings.dart';

class SettingsModule implements BaseModule {
  @override
  Future<void> inject(GetIt getIt) async {
    // External
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

    final remoteConfig = await RemoteConfig.instance;
    getIt.registerLazySingleton<RemoteConfig>(() => remoteConfig);

    // Service
    getIt.registerLazySingleton(() => PushNotificationService());
    getIt<PushNotificationService>().initialize();

    var remoteConfigService = await RemoteConfigService.getInstance();
    getIt.registerLazySingleton<RemoteConfigService>(() => remoteConfigService);

    //  Data
    getIt.registerLazySingleton<SettingLocalDataSource>(
      () => SettingLocalDataSourceImpl(
        cacheManager: getIt(),
      ),
    );
    getIt.registerLazySingleton<ThemeRepository>(
      () => ThemeRepositoryImpl(
        localDataSource: getIt(),
      ),
    );
    getIt.registerLazySingleton<LanguageRepository>(
      () => LanguageRepositoryImpl(
        localDataSource: getIt(),
      ),
    );
    getIt.registerLazySingleton<SettingRepository>(
      () => SettingRepositoryImpl(localDataSource: getIt()),
    );

    //  Domain
    getIt.registerLazySingleton(() => GetLanguageUseCase(getIt()));
    getIt.registerLazySingleton(() => SetLanguageUseCase(getIt()));
    getIt.registerLazySingleton(() => GetThemeUseCase(getIt()));
    getIt.registerLazySingleton(() => SetThemeUseCase(getIt()));
    getIt.registerLazySingleton(() => GetOnBoardStatusUseCase(getIt()));
    getIt.registerLazySingleton(() => SetDoneOnBoardUseCase(getIt()));

    //  Presentation
    getIt.registerLazySingleton(() => LanguageBloc(
          getLanguageUseCase: getIt(),
          setLanguageUseCase: getIt(),
        ));
    getIt.registerLazySingleton(() => ThemeBloc(
          getThemeUseCase: getIt(),
          setThemeUseCase: getIt(),
        ));
    getIt.registerLazySingleton(() => OnBoardBloc(
          getOnBoardStatusUseCase: getIt(),
          setDoneOnBoardUseCase: getIt(),
        ));
  }

  @override
  Map<String, Route> routes(RouteSettings settings) {
    return {
      '/': CupertinoPageRoute(
        builder: (_) => SplashPage(),
        settings: settings,
      ),
      // '/on-boarding': CupertinoPageRoute(
      //   builder: (_) => OnBoardingPage(),
      //   settings: settings,
      // ),
      // '/select-lang': CupertinoPageRoute(
      //   builder: (_) => SelectLanguagePage(),
      //   settings: settings,
      // ),
      '/setting/language': CupertinoPageRoute(
        builder: (_) => SettingLanguagePage(),
        settings: settings,
      ),
    };
  }
}
