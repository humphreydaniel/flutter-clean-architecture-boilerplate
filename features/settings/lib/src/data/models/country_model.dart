import 'package:dependencies/dependencies.dart';

import '../../../settings.dart';

class CountryModel extends Equatable {
  final String code;
  final String name;
  final String dialCode;
  final String flag;

  CountryModel({
    this.code,
    this.name,
    this.dialCode,
    this.flag,
  });

  @override
  List<Object> get props => [code, name, dialCode, flag];

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      code: json['code'],
      dialCode: json['dialCode'],
      flag: json['flag'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'dialCode': dialCode,
      'flag': flag,
      'name': name,
    };
  }

  Country toEntity() {
    return Country(
      name: name,
      dialCode: dialCode,
      code: code,
      flag: flag,
    );
  }

  @override
  bool get stringify => true;
}
