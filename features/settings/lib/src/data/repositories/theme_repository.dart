import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:preferences/preferences.dart';

import '../../domain/domain.dart';
import '../data.dart';

/// Implementation class ThemeRepository
class ThemeRepositoryImpl extends ThemeRepository {
  /// [SettingLocalDataSource]
  final SettingLocalDataSource localDataSource;

  /// Params [localDataSource] is required and must not 'null'
  ThemeRepositoryImpl({
    @required this.localDataSource,
  }) : assert(localDataSource != null);

  @override
  Future<Either<Failure, AppTheme>> getTheme() async {
    try {
      final _result = await localDataSource.getCacheTheme();
      return Right(AppThemeConverter.fromString(_result));
    } on CacheException catch (_) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> setTheme(AppTheme theme) async {
    try {
      final result = await localDataSource
          .setCacheTheme(AppThemeConverter.convertToString(theme));
      return Right(result);
    } on CacheException catch (_) {
      return Left(CacheFailure());
    }
  }
}
