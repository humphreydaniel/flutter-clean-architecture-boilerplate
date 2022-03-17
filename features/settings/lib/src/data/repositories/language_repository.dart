import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../settings.dart';

class LanguageRepositoryImpl implements LanguageRepository {
  final SettingLocalDataSource localDataSource;

  LanguageRepositoryImpl({@required this.localDataSource});

  @override
  Future<Either<Failure, Country>> getLanguage() async {
    try {
      final result = await localDataSource.getCacheLanguage();
      if (result != null) {
        return Right(result.toEntity());
      }
      return Left(CacheFailure());
    } on NotFoundCacheException catch (_) {
      return Left(CacheFailure(message: 'Saved Language Is Empty'));
    } on CacheException catch (_) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> setLanguage(CountryModel country) async {
    try {
      final result = await localDataSource.setCacheLanguage(country);
      if (result == true) {
        return Right(result);
      }
      return Left(CacheFailure());
    } on CacheException catch (e) {
      return Left(CacheFailure(
        code: e?.code,
        message: e?.message,
      ));
    }
  }
}
