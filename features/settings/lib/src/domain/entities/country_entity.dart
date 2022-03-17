import 'package:dependencies/dependencies.dart';

class Country extends Equatable {
  final String code;
  final String name;
  final String dialCode;
  final String flag;

  Country({
    this.code,
    this.name,
    this.dialCode,
    this.flag,
  });

  @override
  List<Object> get props => [code, name, dialCode, flag];

  @override
  bool get stringify => true;
}
