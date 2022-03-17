import 'failures.dart';

/// Getting error from Internal Server Error
class InternalServerFailure extends Failure {
  /// Getting error from Internal Server Error
  InternalServerFailure({
    String message,
    int code,
  }) : super(code: code, message: message);
}

/// Getting error from default error
class DefaultServerFailure extends Failure {
  /// Getting error from default response error
  DefaultServerFailure({
    String message,
    int code,
  }) : super(code: code, message: message);
}

/// Getting error from Timeout get API
class TimeOutApiFailure extends Failure {
  /// Getting error from Timeout get API
  TimeOutApiFailure({
    String message,
    int code,
  }) : super(code: code, message: message);
}

/// Getting error from API, when user unAuthenticated
class UnAuthenticatedApiFailure extends Failure {
  /// Getting error from API, when user unAuthenticated
  UnAuthenticatedApiFailure({
    String message,
    int code,
  }) : super(code: code, message: message);
}

/// Getting error from API, when user don't have a access
class UnAuthorizeApiFailure extends Failure {
  /// Getting error from API, when user don't have a access
  UnAuthorizeApiFailure({
    String message,
    int code,
  }) : super(code: code, message: message);
}
