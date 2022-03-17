import 'package:flutter/foundation.dart';

import '../../preferences.dart';

export 'dark_theme.dart';
export 'light_theme.dart';

/// List all theme type available in app
enum AppTheme {
  ///
  greenLight,

  ///
  greenDark,
}

/// Allow to convert from [String] to enum [AppTheme]
/// And convert from enum to String
class AppThemeConverter {
  /// Converting enum [AppTheme] to String value,
  ///
  /// For example:
  ///
  /// ```dart
  /// var theme = AppTheme.greenDark;
  /// AppThemeConverter.convertToString(theme);
  /// ```
  /// result: **greenDark**
  ///
  static String convertToString(AppTheme theme) => describeEnum(theme);

  /// Converting from String to Enum
  static AppTheme fromString(String theme) {
    switch (theme) {
      case 'greenLight':
        return AppTheme.greenLight;
      case 'greenDark':
        return AppTheme.greenDark;

      default:
        return null;
    }
  }
}

// ignore: avoid_classes_with_only_static_members
/// All Data theme
class AppThemeData {
  /// Getting data [ThemeData] with type `Map<AppTheme, ThemeData>`
  static final data = {
    AppTheme.greenLight: LightTheme.data,
    AppTheme.greenDark: DarkTheme.data,
  };
}
