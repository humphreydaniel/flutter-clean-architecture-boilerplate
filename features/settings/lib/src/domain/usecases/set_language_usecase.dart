import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

import '../../../settings.dart';

class SetLanguageUseCase implements UseCase<bool, CountryModel> {
  final LanguageRepository repository;

  SetLanguageUseCase(this.repository);

  @override
  Future<Either<Failure, bool>> call(CountryModel params) async {
    return await repository.setLanguage(params);
  }
}
