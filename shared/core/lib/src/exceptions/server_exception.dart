/// Error handling from a any process from API,
/// for example [TimeOutApiException]
/// [InternalServerException]
abstract class ServerException implements Exception {
  /// Getting message base from the catch
  final String message;

  /// Getting code error from the catch
  final int code;

  ///
  ServerException({
    this.message,
    this.code,
  });
}

/// Handling error base from basic error from response API, for example
/// Bad request,
class DefaultApiException extends ServerException {
  ///
  DefaultApiException({
    String message,
    int code,
  }) : super(
          code: code,
          message: message,
        );
}

/// Handling error base from timeout get a API, or network
class TimeoutApiException extends ServerException {
  ///
  TimeoutApiException({
    String message,
    int code,
  }) : super(
          code: code,
          message: message,
        );
}

/// Handling error from API, when server response error code 500 or higher,
/// This exceptions handle to detect when intenal server is fail
class InternalServerException extends ServerException {
  /// In field [message] to custom a message when server is fail
  /// And the [code] field error code, for example `500 (Internal Server Error)`
  InternalServerException({
    String message,
    int code,
  }) : super(
          message: message,
          code: code,
        );
}

/// Handling error from API, when user don't have access,
/// because user not have a token, or session auth(Login/Register)
class UnAuthenticatedAPiException extends ServerException {
  /// In field [message] to custom a message when user not have access
  /// And the [code] field error code
  UnAuthenticatedAPiException({
    String message,
    int code,
  }) : super(
          message: message,
          code: code,
        );
}

/// Handling error from API, when user don't have access,
/// because user not have access a endpoint API,
/// for example, user access to other user tracsaction,
/// Or access a data admin
class UnAuthorizeApiException extends ServerException {
  /// In field [message] to custom a message when fail
  /// And the [code] field error code
  UnAuthorizeApiException({
    String message,
    int code,
  }) : super(
          message: message,
          code: code,
        );
}
