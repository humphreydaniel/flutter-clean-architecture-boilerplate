import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../auth.dart';

class RegisterWithEmailUseCase
    implements UseCase<UserEntity, RegisterEmailParams> {
  final AuthRepository repository;

  RegisterWithEmailUseCase(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(RegisterEmailParams params) async {
    return await repository.registerWithEmail(params.data);
  }
}

class RegisterEmailParams {
  final RegisterEmailBody data;
  RegisterEmailParams({
    @required this.data,
  }) : assert(data != null);
}
