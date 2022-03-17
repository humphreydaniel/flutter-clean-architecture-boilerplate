import '../../settings.dart';
import '../data/country_data.dart';

/// All config from [SettingModule]
class SettingConfig {
  SettingConfig._();

  /// KEY cache data saved theme
  static const String themeCacheKey = 'SELLER_THEME_KEY';

  /// KEY cache data save language
  static const String languageCacheKey = 'SELLER_LANGUAGE_KEY';

  static const String onBoardCacheKey = 'SELLER_ONBOARD_KEY';

  static Country defaultCountry = CountryData.supportedCountry.first;
}
