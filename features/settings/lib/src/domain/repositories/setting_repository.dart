import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';

abstract class SettingRepository {
  /// Mark as done onBoard
  Future<Either<Failure, bool>> setDoneOnBoard();

  /// Get status after or before onBoard
  Future<Either<Failure, bool>> getOnBoardStatus();
}
