import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

import '../../../settings.dart';

class SetDoneOnBoardUseCase implements UseCase<bool, NoParams> {
  final SettingRepository repository;

  SetDoneOnBoardUseCase(this.repository);

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return await repository.setDoneOnBoard();
  }
}
