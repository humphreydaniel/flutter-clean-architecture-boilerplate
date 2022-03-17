import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';

import '../../../auth.dart';

abstract class AuthApiDataSource {
  Future<AuthResponseModel> loginWithEmail(Map<String, dynamic> body);

  Future<AuthResponseModel> registerWithEmail(Map<String, dynamic> body);

  Future<AuthResponseModel> loginWithFirebase(String token);

  Future<bool> resetPassword(String email);
}

AuthResponseModel _mockResponseAuth = AuthResponseModel(
  data: AuthDataModel(
    token: 'TOKEN_EXAMPLE',
    user: UserModel(
      id: '1',
      address: 'example address',
      email: 'myemail@gmail.com',
      image: 'https://i.ibb.co/JBS6h9S/img-avatar-dummy.png',
      name: 'My Full Name',
      phoneNumber: '62849834983948',
    ),
  ),
);

class AuthApiDataSourceImpl implements AuthApiDataSource {
  final Dio dio;

  AuthApiDataSourceImpl(this.dio);

  @override
  Future<AuthResponseModel> loginWithEmail(Map<String, dynamic> body) async {
    try {
      // TODO: Implement Login With Email

      await Future.delayed(Duration(seconds: 4));
      return _mockResponseAuth;
    } on DioError catch (e) {
      throw NetworkUtils.dioErrorToException(e);
    }
  }

  @override
  Future<AuthResponseModel> loginWithFirebase(String token) async {
    try {
      // TODO: Implement Login With Firebase To Server

      await Future.delayed(Duration(seconds: 4));
      return _mockResponseAuth;
    } on DioError catch (e) {
      throw NetworkUtils.dioErrorToException(e);
    }
  }

  @override
  Future<AuthResponseModel> registerWithEmail(Map<String, dynamic> body) async {
    try {
      // TODO: Implement Register With Email

      await Future.delayed(Duration(seconds: 4));
      return _mockResponseAuth;
    } on DioError catch (e) {
      throw NetworkUtils.dioErrorToException(e);
    }
  }

  @override
  Future<bool> resetPassword(String email) async {
    try {
      // TODO: Implement Reset Password

      return true;
    } on DioError catch (e) {
      throw NetworkUtils.dioErrorToException(e);
    }
  }
}
