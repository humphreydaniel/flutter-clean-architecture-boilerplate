import 'package:auth/auth.dart';
import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:home/home.dart';
import 'package:l10n/l10n.dart';
import 'package:settings/settings.dart';

import 'flavors.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              GetIt.I<ThemeBloc>()..add(InitializeThemeEvent()),
        ),
        BlocProvider(
          create: (context) =>
              GetIt.I<LanguageBloc>()..add(InitializeLanguageEvent()),
        ),
        BlocProvider(
          create: (context) => GetIt.I<AuthBloc>()..add(AuthInitializeEvent()),
        ),
        BlocProvider(
          create: (context) => GetIt.I<BottomNavBloc>(),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return BlocBuilder<LanguageBloc, LanguageState>(
            builder: (context, langState) {
              return MaterialApp(
                title: F.title,
                theme: state.theme,
                debugShowCheckedModeBanner: false,
                localizationsDelegates: [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                locale: Locale(
                  langState?.country?.code,
                  langState?.country?.code,
                ),
                supportedLocales: S.delegate.supportedLocales,
                onGenerateRoute: Modular.routes,
                home: SplashPage(),
              );
            },
          );
        },
      ),
    );
  }
}
