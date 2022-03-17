import 'dart:io';

import 'package:component/component.dart';
import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:l10n/generated/l10n.dart';
import 'package:preferences/preferences.dart';

class UpgradeAppPage extends StatelessWidget {
  final bool mustUpgrade;
  final VoidCallback onSkip;

  const UpgradeAppPage({
    Key key,
    @required this.mustUpgrade,
    this.onSkip,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBack,
      child: Scaffold(
        body: _buildBody(context),
        bottomNavigationBar: _buildBottomNav(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      width: Dimens.width(context),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IllustrationMessage(
            imagePath: AssetsPath.newAppVersionIllustration,
            customWidget: SizedBox(
              width: Dimens.width(context) * 0.8,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TitleText(
                    S.current.latest_version_available,
                    align: TextAlign.center,
                  ),
                  SizedBox(height: Dimens.dp8),
                  RegularText(
                    S.current.message_for_app_updates,
                    align: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNav(BuildContext context) {
    if (mustUpgrade) {
      return Container(
        height: 64,
        padding:
            EdgeInsets.symmetric(vertical: Dimens.dp8, horizontal: Dimens.dp16),
        child: ElevatedButton(
          child: Text('Update now'),
          onPressed: _navigateToStore,
        ),
      );
    } else {
      return Container(
        height: 64,
        padding:
            EdgeInsets.symmetric(vertical: Dimens.dp8, horizontal: Dimens.dp16),
        child: Row(
          children: [
            Expanded(
              child: FlatButton(
                child: Text(S.current.later),
                textColor: Theme.of(context).primaryColor,
                onPressed: () {
                  Navigator.of(context).pop();
                  if (onSkip != null) {
                    onSkip();
                  }
                },
              ),
            ),
            SizedBox(width: Dimens.dp16),
            Expanded(
              child: ElevatedButton(
                onPressed: _navigateToStore,
                child: Text('Update'),
              ),
            ),
          ],
        ),
      );
    }
  }

  void _navigateToStore() async {
    final _playStoreUrl =
        GetIt.I<GlobalConfiguration>().getValue('play_store_app');
    final _appStoreUrl =
        GetIt.I<GlobalConfiguration>().getValue('app_store_app');
    if (Platform.isAndroid) {
      if (await canLaunch(_playStoreUrl)) {
        await launch(_playStoreUrl);
      } else {
        throw 'Could not launch $_playStoreUrl';
      }
    } else if (Platform.isIOS) {
      if (await canLaunch(_appStoreUrl)) {
        await launch(_appStoreUrl);
      } else {
        throw 'Could not launch $_appStoreUrl';
      }
    }
  }

  Future<bool> _onBack() async {
    if (mustUpgrade) {
      if (Platform.isAndroid) {
        SystemNavigator.pop();
      } else {
        exit(0);
      }
    }
    return true;
  }
}
