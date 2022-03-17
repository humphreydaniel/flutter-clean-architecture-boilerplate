import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

import '../../../settings.dart';

class GetOnBoardStatusUseCase implements UseCase<bool, NoParams> {
  final SettingRepository repository;

  GetOnBoardStatusUseCase(this.repository);

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return await repository.getOnBoardStatus();
  }
}
