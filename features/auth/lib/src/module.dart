import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../auth.dart';

class AuthModule implements BaseModule {
  @override
  void inject(GetIt getIt) {
    // External
    getIt.registerLazySingleton(() => FirebaseAuth.instance);
    getIt.registerLazySingleton(() => GoogleSignIn());

    // Data
    getIt.registerLazySingleton<AuthLocalDataSource>(
        () => AuthLocalDataSourceImpl(getIt()));
    getIt.registerLazySingleton<AuthApiDataSource>(
        () => AuthApiDataSourceImpl(getIt()));
    getIt.registerLazySingleton<AuthFirebaseDataSource>(
        () => AuthFirebaseDataSourceImpl(
              firebaseAuth: getIt(),
              googleSignIn: getIt(),
            ));
    getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
          apiDataSource: getIt(),
          firebaseDataSource: getIt(),
          localDataSource: getIt(),
        ));

    // Domain
    getIt.registerLazySingleton(() => GetLogOutUseCase(getIt()));
    getIt.registerLazySingleton(() => GetUserUseCase(getIt()));
    getIt.registerLazySingleton(() => LoginWithEmailUseCase(getIt()));
    getIt.registerLazySingleton(() => LoginWithGoogleUseCase(getIt()));
    getIt.registerLazySingleton(() => RegisterWithEmailUseCase(getIt()));
    getIt.registerLazySingleton(() => GetResetPasswordUseCase(getIt()));

    // Presentation
    getIt.registerLazySingleton(() => AuthBloc(
          logOutUseCase: getIt(),
          userUseCase: getIt(),
        ));
    getIt.registerFactory(() => LoginBloc(
          loginWithEmailUseCase: getIt(),
          loginWithGoogleUseCase: getIt(),
        ));
    getIt.registerFactory(() => RegisterBloc(
          registerWithEmailUseCase: getIt(),
        ));
    getIt.registerFactory(() => ResetPasswordBloc(getIt()));
  }

  @override
  Map<String, Route> routes(RouteSettings settings) {
    return {
      '/login': CupertinoPageRoute(
        builder: (_) => LoginEmailPage(),
        settings: settings,
      ),
      '/register': CupertinoPageRoute(
        builder: (_) => RegisterEmailPage(),
        settings: settings,
      ),
      '/reset-password': CupertinoPageRoute(
        builder: (_) => ResetPasswordPage(),
        settings: settings,
      ),
    };
  }
}
