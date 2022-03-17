import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

import '../../../auth.dart';

class GetUserUseCase implements UseCase<UserEntity, NoParams> {
  final AuthRepository repository;

  GetUserUseCase(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(NoParams params) async {
    return await repository.getCurrentUser();
  }
}
