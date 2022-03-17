import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:preferences/preferences.dart';

import '../repositories/theme_repository.dart';

class GetThemeUseCase implements UseCase<AppTheme, NoParams> {
  final ThemeRepository repository;

  GetThemeUseCase(this.repository);
  @override
  Future<Either<Failure, AppTheme>> call(NoParams params) async {
    return await repository.getTheme();
  }
}
