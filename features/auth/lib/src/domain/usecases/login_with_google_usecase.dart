import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

import '../../../auth.dart';

class LoginWithGoogleUseCase implements UseCase<UserEntity, NoParams> {
  final AuthRepository repository;

  LoginWithGoogleUseCase(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(NoParams params) async {
    return await repository.loginWithGoogle();
  }
}
