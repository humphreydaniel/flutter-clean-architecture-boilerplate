import 'package:auth/auth.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';

import 'sections/sections.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              GetIt.I<AuthBloc>().add(AuthLogoutEvent());
            },
          ),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return ListView(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(Dimens.dp16),
      children: [
        ProfileSection(),
        Divider(
          height: Dimens.dp32,
          thickness: Dimens.dp8,
        ),
        SettingSection(),
      ],
    );
  }
}
