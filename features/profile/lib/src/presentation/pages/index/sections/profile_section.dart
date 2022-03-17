import 'package:auth/auth.dart';
import 'package:component/atom/atom.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';

class ProfileSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(state.user?.image),
              radius: Dimens.dp30,
            ),
            SizedBox(width: Dimens.dp16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleText(state.user?.name ?? ''),
                  SizedBox(height: Dimens.dp8),
                  RegularText(state.user?.email ?? ''),
                  SizedBox(height: Dimens.dp4),
                  RegularText(state.user?.phoneNumber ?? ''),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
