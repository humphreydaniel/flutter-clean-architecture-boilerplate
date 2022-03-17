import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

import '../../../auth.dart';

class GetResetPasswordUseCase implements UseCase<bool, String> {
  final AuthRepository repository;

  GetResetPasswordUseCase(this.repository);
  @override
  Future<Either<Failure, bool>> call(String params) async {
    return await repository.resetPassword(params);
  }
}
