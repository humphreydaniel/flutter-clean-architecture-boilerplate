import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';

import '../../../auth.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> loginWithEmail(LoginEmailBody body);

  Future<Either<Failure, UserEntity>> registerWithEmail(RegisterEmailBody body);

  Future<Either<Failure, UserEntity>> loginWithGoogle();

  Future<Either<Failure, bool>> resetPassword(String email);

  Future<Either<Failure, UserEntity>> getCurrentUser();

  Future<Either<Failure, bool>> logOut();
}
