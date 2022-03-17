import 'dart:convert';

import 'package:core/core.dart';
import 'package:meta/meta.dart';

import '../../../settings.dart';

/// Interface
abstract class SettingLocalDataSource {
  /// Save cache to DB
  /// Param [theme] is base from enum [AppTheme]
  ///
  /// For example when you save theme greenDark
  ///
  /// ```dart
  /// setCacheTheme(AppThemeConverter.convertToString(AppTheme.greenDark))
  /// ```
  Future<bool> setCacheTheme(String theme);

  /// Get saved cache from DB
  ///
  /// Return is [String] when data is not empty or null
  ///
  /// Return [String] from [AppTheme] enum convert to String
  ///
  /// Then you must convert again to enum
  Future<String> getCacheTheme();

  /// Set default local language
  /// in param [country] must not be null
  Future<bool> setCacheLanguage(CountryModel country);

  Future<CountryModel> getCacheLanguage();

  Future<bool> setDoneOnBoard();

  Future<bool> getOnBoardStatus();
}

/// Implementing class [SettingLocalDataSource]
class SettingLocalDataSourceImpl extends SettingLocalDataSource {
  /// [CacheManager] when use implementation class
  ///
  /// Use should use [CacheManagerImpl] class
  ///
  /// Then when use [get_it], this more example:
  ///
  /// ```dart
  /// SettingLocalDataSourceImpl(
  ///   cacheManager: getIt<CacheManager>()
  /// )
  /// ```
  final CacheManager cacheManager;

  /// Param [cacheManager] is required,
  ///
  /// And param [cacheManager] can't be null
  SettingLocalDataSourceImpl({
    @required this.cacheManager,
  }) : assert(cacheManager != null);

  @override
  Future<String> getCacheTheme() async {
    final _result = await cacheManager.read(SettingConfig.themeCacheKey);
    if (_result != null) {
      return _result;
    }
    throw NotFoundCacheException();
  }

  @override
  Future<bool> setCacheTheme(String theme) async {
    try {
      await cacheManager.write(SettingConfig.themeCacheKey, theme);
      return true;
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<bool> setCacheLanguage(CountryModel country) async {
    try {
      await cacheManager.write(
          SettingConfig.languageCacheKey, json.encode(country.toJson()));
      return true;
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<CountryModel> getCacheLanguage() async {
    try {
      final _result = await cacheManager.read(SettingConfig.languageCacheKey);
      if (_result != null) {
        return CountryModel.fromJson(json.decode(_result));
      }
      throw NotFoundCacheException();
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<bool> getOnBoardStatus() async {
    try {
      final _result = await cacheManager.read(SettingConfig.onBoardCacheKey);
      if (_result != null) {
        return _result ?? false;
      }
      throw NotFoundCacheException();
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<bool> setDoneOnBoard() async {
    try {
      await cacheManager.write(SettingConfig.onBoardCacheKey, true);
      return true;
    } catch (e) {
      throw CacheException();
    }
  }
}
