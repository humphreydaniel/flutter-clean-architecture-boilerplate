import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../auth.dart';

class LoginWithEmailUseCase implements UseCase<UserEntity, LoginEmailParams> {
  final AuthRepository repository;

  LoginWithEmailUseCase(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(LoginEmailParams params) async {
    return await repository.loginWithEmail(params.data);
  }
}

class LoginEmailParams {
  final LoginEmailBody data;
  LoginEmailParams({
    @required this.data,
  }) : assert(data != null);
}
