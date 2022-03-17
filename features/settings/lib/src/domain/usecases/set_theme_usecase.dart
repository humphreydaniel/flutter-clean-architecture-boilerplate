import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:preferences/preferences.dart';

import '../repositories/theme_repository.dart';

class SetThemeUseCase implements UseCase<bool, AppTheme> {
  final ThemeRepository repository;

  SetThemeUseCase(this.repository);
  @override
  Future<Either<Failure, bool>> call(AppTheme params) async {
    return await repository.setTheme(params);
  }
}
