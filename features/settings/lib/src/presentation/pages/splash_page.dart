import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:home/home.dart';

import '../../../settings.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return VersionAppPage(
      child: BlocProvider(
        create: (_) => GetIt.I<OnBoardBloc>()..add(InitializeOnBoardEvent()),
        child: BlocBuilder<OnBoardBloc, OnBoardState>(
          builder: (context, state) {
            // if (state is AfterOnBoardState) {
            return MainPage();
            // }
            // else if (state is BeforeOnBoardState) {
            //   return SelectLanguagePage();
            // }
            // else {
            // return _buildSplashContent();
            // }
          },
        ),
      ),
    );
  }

  // TODO: implement
  // Widget _buildSplashContent() {
  //   return Scaffold(
  //     body: Center(
  //         // child: Image.asset(
  //         //   AssetsPath.logo,
  //         //   width: Dimens.height(context) / 3.8,
  //         //   height: Dimens.height(context) / 3.8,
  //         // ),
  //         ),
  //   );
  // }
}
