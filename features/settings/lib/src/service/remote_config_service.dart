import 'package:dependencies/dependencies.dart';

enum AppVersionType { expired, haveUpdate, upToDate }

class RemoteConfigService {
  final RemoteConfig _remoteConfig;

  static RemoteConfigService _instance;
  static Future<RemoteConfigService> getInstance() async {
    if (_instance == null) {
      _instance = RemoteConfigService(
        remoteConfig: await GetIt.I<RemoteConfig>(),
      );
    }

    return _instance;
  }

  RemoteConfigService({RemoteConfig remoteConfig})
      : _remoteConfig = remoteConfig;

  Future<RemoteConfig> initialize() async {
    try {
      final remote = await getInstance();
      await remote._remoteConfig.setDefaults({
        'minimum_app_version': '1',
        'latest_app_version': '1',
      });
      await _fetchAndActivate(remote._remoteConfig);
    } on FetchThrottledException catch (e) {
      print('Remote config fetch throttled: $e');
    } catch (e) {
      print('Unable to fetch remote config. Cached or default values will be '
          'used');
    }

    return _remoteConfig;
  }

  Future _fetchAndActivate(RemoteConfig _remoteConfig) async {
    await _remoteConfig.fetch(expiration: const Duration(hours: 5));
    await _remoteConfig.activateFetched();
  }

  Future<AppVersionType> checkAppVersion(RemoteConfig _remoteConfig) async {
    final packageInfo = await PackageInfo.fromPlatform();
    final currentVersion = int.tryParse(packageInfo.buildNumber);
    final latestVersion =
        int.tryParse(_remoteConfig.getString('latest_app_version'));
    final minimumVersion =
        int.tryParse(_remoteConfig.getString('minimum_app_version'));

    print('''
    .......................................................
    .  CURRENT VERSION : $currentVersion                  .
    .  LATEST VERSION  : $latestVersion                 .
    .  MINIMUM VERSION : $minimumVersion                  .
    .......................................................
    ''');

    if (currentVersion != null &&
        latestVersion != null &&
        minimumVersion != null) {
      if (currentVersion < minimumVersion) {
        return AppVersionType.expired;
      } else if (currentVersion < latestVersion) {
        return AppVersionType.haveUpdate;
      }
    }
    return AppVersionType.upToDate;
  }
}
