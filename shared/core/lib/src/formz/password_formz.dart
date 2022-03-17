import 'package:dependencies/dependencies.dart';

enum PasswordValidationError { invalid }

class PasswordFormZ extends FormzInput<String, PasswordValidationError> {
  final bool withValidator;
  const PasswordFormZ.pure({this.withValidator = false}) : super.pure('');
  const PasswordFormZ.dirty(
    String value, {
    this.withValidator = false,
  }) : super.dirty(value);

  @override
  PasswordValidationError validator(String value) {
    if (withValidator ?? false) {
      return value.length > 7 ? null : PasswordValidationError.invalid;
    }
    return value != null ? null : PasswordValidationError.invalid;
  }
}
