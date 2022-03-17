import 'package:dependencies/dependencies.dart';

import 'data.dart';

class AuthDataModel extends Equatable {
  final UserModel user;
  final String token;

  AuthDataModel({
    this.user,
    this.token,
  });

  factory AuthDataModel.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;

    return AuthDataModel(
      token: json['token'],
      user: json['guest'] != null ? UserModel.fromJson(json['guest']) : null,
    );
  }

  @override
  List<Object> get props => [user, token];

  @override
  bool get stringify => true;
}
