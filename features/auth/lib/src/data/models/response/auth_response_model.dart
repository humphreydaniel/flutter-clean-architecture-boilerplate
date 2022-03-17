import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';

import '../../../../auth.dart';

class AuthResponseModel extends Equatable {
  final AuthDataModel data;
  final MetaData meta;

  AuthResponseModel({
    this.data,
    this.meta,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;

    return AuthResponseModel(
      data: json['data'] != null ? AuthDataModel.fromJson(json['data']) : null,
      meta: json['meta'] != null ? MetaData.fromJson(json['meta']) : null,
    );
  }

  @override
  List<Object> get props => [data, meta];

  @override
  bool get stringify => true;
}
