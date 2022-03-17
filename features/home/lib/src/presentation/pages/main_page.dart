import 'package:auth/auth.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:l10n/l10n.dart';
import 'package:preferences/preferences.dart';
import 'package:profile/profile.dart';

import '../../../home.dart';
import '../presentation.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  BottomNavBloc _bloc;

  @override
  void initState() {
    _bloc = BlocProvider.of<BottomNavBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBloc, int>(
      builder: (context, state) {
        return BlocBuilder<AuthBloc, AuthState>(
          builder: (context, authState) {
            if (authState.status == AuthenticationStatus.authenticated) {
              return Scaffold(
                body: _buildBody(state),
                bottomNavigationBar: _buildBottomNav(state),
              );
            }
            return AuthPage();
          },
        );
      },
    );
  }

  Widget _buildBody(int index) {
    return BlocBuilder<BottomNavBloc, int>(
      builder: (context, state) {
        switch (state) {
          case 0:
            return HomePage();
            break;
          case 1:
            return WillPopScope(
              onWillPop: () async {
                _bloc.add(ChangeBottomNavEvent(index: 0));
                return false;
              },
              child: Center(child: Text('Order Page')),
            );
            break;
          case 2:
            return WillPopScope(
              onWillPop: () async {
                _bloc.add(ChangeBottomNavEvent(index: 0));
                return false;
              },
              child: ProfilePage(),
            );
            break;
          default:
            return SizedBox();
        }
      },
    );
  }

  Widget _buildBottomNav(int currentIndex) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      onTap: (v) {
        _bloc.add(ChangeBottomNavEvent(index: v));
      },
      iconSize: Dimens.dp20,
      selectedFontSize: Dimens.dp10,
      unselectedFontSize: Dimens.dp10,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          activeIcon: Icon(Icons.home),
          label: S.current.home,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.article_outlined),
          activeIcon: Icon(Icons.article),
          label: S.current.order,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          activeIcon: Icon(Icons.person),
          label: S.current.profile,
        ),
      ],
    );
  }
}
