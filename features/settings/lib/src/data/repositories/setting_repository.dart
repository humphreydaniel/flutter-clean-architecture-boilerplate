import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../settings.dart';

class SettingRepositoryImpl implements SettingRepository {
  /// [SettingLocalDataSource]
  final SettingLocalDataSource localDataSource;

  SettingRepositoryImpl({@required this.localDataSource})
      : assert(localDataSource != null);

  @override
  Future<Either<Failure, bool>> getOnBoardStatus() async {
    try {
      final result = await localDataSource.getOnBoardStatus();
      if (result != null) {
        return Right(result);
      }
      return Left(CacheFailure());
    } on NotFoundCacheException catch (_) {
      return Left(CacheFailure());
    } on CacheException catch (_) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> setDoneOnBoard() async {
    try {
      final result = await localDataSource.setDoneOnBoard();
      if (result != null) {
        return Right(result);
      }
      return Left(CacheFailure());
    } on CacheException catch (_) {
      return Left(CacheFailure());
    }
  }
}
