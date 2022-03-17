import 'package:core/core.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../auth.dart';
import '../config/module_config.dart';

/// Error handling when error in interceptor about authentication
class AuthHttpInterceptor extends InterceptorsWrapper {
  /// Repository to get data current token
  final CacheManager cacheManager;
  final VoidCallback onUnauth;

  ///
  AuthHttpInterceptor({@required this.cacheManager, this.onUnauth});

  @override
  Future onRequest(RequestOptions options) async {
    final token = await cacheManager.read(AuthConfig.tokenCacheKey);
    options.headers.addAll({'Authorization': 'Bearer $token'});
    return options;
  }

  @override
  Future onResponse(Response response) {
    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) async {
    if (err?.response?.statusCode == 401 || err?.response?.statusCode == 403) {
      GetIt.I<AuthBloc>()..add(AuthLogoutEvent())..add(AuthInitializeEvent());
    }
    return super.onError(err);
  }
}
