import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../auth.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthApiDataSource apiDataSource;
  final AuthLocalDataSource localDataSource;
  final AuthFirebaseDataSource firebaseDataSource;

  AuthRepositoryImpl({
    @required this.apiDataSource,
    @required this.localDataSource,
    @required this.firebaseDataSource,
  }) : assert(apiDataSource != null &&
            localDataSource != null &&
            firebaseDataSource != null);

  @override
  Future<Either<Failure, UserEntity>> loginWithEmail(
      LoginEmailBody body) async {
    try {
      final result = await apiDataSource.loginWithEmail(body?.toJson());
      _saveCacheData(result?.data);
      return Right(result?.data?.user?.toEntity());
    } on ServerException catch (e) {
      return Left(NetworkUtils.serverExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginWithGoogle() async {
    try {
      await firebaseDataSource.loginWithGoogle();
      final token = await firebaseDataSource.getUserToken();

      final result = await apiDataSource.loginWithFirebase(token?.token);
      _saveCacheData(result?.data);
      return Right(result?.data?.user?.toEntity());
    } on ServerException catch (e) {
      return Left(NetworkUtils.serverExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> registerWithEmail(
      RegisterEmailBody body) async {
    try {
      final result = await apiDataSource.registerWithEmail(body?.toJson());
      _saveCacheData(result?.data);
      return Right(result.data?.user?.toEntity());
    } on ServerException catch (e) {
      return Left(NetworkUtils.serverExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, bool>> resetPassword(String email) async {
    try {
      final result = await apiDataSource.resetPassword(email);
      return Right(result);
    } on ServerException catch (e) {
      return Left(NetworkUtils.serverExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, bool>> logOut() async {
    try {
      Future.wait([
        firebaseDataSource.logOut(),
        localDataSource.removeToken(),
        localDataSource.removeUser(),
      ]);

      return Right(true);
      // ignore: avoid_catches_without_on_clauses
    } catch (_) {
      return Right(false);
    }
  }

  void _saveCacheData(AuthDataModel data) {
    localDataSource.setToken(data?.token);
    localDataSource.setUser(data?.user);
  }

  @override
  Future<Either<Failure, UserEntity>> getCurrentUser() async {
    try {
      final result = await localDataSource.getUser();
      return Right(result?.toEntity());
    } on CacheException catch (_) {
      return Right(null);
    }
  }
}
