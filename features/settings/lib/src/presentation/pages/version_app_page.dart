import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import '../../../settings.dart';

class VersionAppPage extends StatefulWidget {
  final Widget child;
  const VersionAppPage({
    Key key,
    @required this.child,
  }) : super(key: key);
  @override
  _VersionAppPageState createState() => _VersionAppPageState();
}

class _VersionAppPageState extends State<VersionAppPage> {
  bool afterSkipUpdate = false;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<RemoteConfig>(
      future: GetIt.I<RemoteConfigService>().initialize(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          _checkAppVersion(snapshot.data);
        }
        return widget.child;
      },
    );
  }

  void _checkAppVersion(RemoteConfig remoteConfig) async {
    final result =
        await GetIt.I<RemoteConfigService>().checkAppVersion(remoteConfig);
    if (result == AppVersionType.expired) {
      Future.microtask(() => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => UpgradeAppPage(
                mustUpgrade: true,
              ),
            ),
          ));
    } else if (result == AppVersionType.haveUpdate && !afterSkipUpdate) {
      Future.microtask(() => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => UpgradeAppPage(
                mustUpgrade: false,
                onSkip: () {
                  setState(() {
                    afterSkipUpdate = true;
                  });
                },
              ),
            ),
          ));
    }
  }
}
