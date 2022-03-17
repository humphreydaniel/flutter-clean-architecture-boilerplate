import 'dart:convert';

import 'package:core/core.dart';

import '../../../auth.dart';
import '../../config/module_config.dart';

abstract class AuthLocalDataSource {
  Future<String> getToken();

  Future<bool> setToken(String token);

  Future<bool> removeToken();

  Future<UserModel> getUser();

  Future<bool> setUser(UserModel user);

  Future<bool> removeUser();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final CacheManager cacheManager;

  AuthLocalDataSourceImpl(this.cacheManager);

  @override
  Future<String> getToken() async {
    final result = await cacheManager.read(AuthConfig.tokenCacheKey);

    return result;
  }

  @override
  Future<UserModel> getUser() async {
    final result = await cacheManager.read(AuthConfig.userCacheKey);

    if (result != null) {
      return UserModel.fromJson(json.decode(result));
    }

    return null;
  }

  @override
  Future<bool> setToken(String token) async {
    await cacheManager.write(AuthConfig.tokenCacheKey, token);

    return true;
  }

  @override
  Future<bool> setUser(UserModel user) async {
    await cacheManager.write(
        AuthConfig.userCacheKey, json.encode(user?.toJson()));

    return true;
  }

  @override
  Future<bool> removeToken() async {
    await cacheManager.delete(AuthConfig.tokenCacheKey);

    return true;
  }

  @override
  Future<bool> removeUser() async {
    await cacheManager.delete(AuthConfig.userCacheKey);

    return true;
  }
}
