import 'package:dependencies/dependencies.dart';

//import 'package:l10n/l10n.dart';

import '../../core.dart';

// ignore: avoid_classes_with_only_static_members
/// Basic utils to handle network
class NetworkUtils {
  static final List<int> _supportedErrorStatusCode = [400, 402, 404, 422];

  /// Returning exception base from error Http Client DIO
  static ServerException dioErrorToException(DioError err) {
    if (err?.type == DioErrorType.CONNECT_TIMEOUT ||
        err?.type == DioErrorType.RECEIVE_TIMEOUT ||
        err?.type == DioErrorType.SEND_TIMEOUT) {
      return TimeoutApiException();
    } else if (err?.type == DioErrorType.RESPONSE) {
      if (err?.response?.statusCode == 401) {
        return UnAuthenticatedAPiException();
      } else if (err?.response?.statusCode == 403) {
        return UnAuthorizeApiException();
      } else if ((err?.response?.statusCode ?? 0) >= 500) {
        return InternalServerException();
      } else if (_supportedErrorStatusCode
          .contains(err?.response?.statusCode ?? 0)) {
        return DefaultApiException(
          code: err?.response?.statusCode,
          message: err?.response?.data['meta']['message'],
        );
      }
      return TimeoutApiException();
    } else {
      if (err?.response == null) {
        return TimeoutApiException();
      }
      if ((err?.response?.data ?? {})['meta']['message'] != null) {
        return DefaultApiException(
          code: err?.response?.statusCode,
          message: err?.response?.data['meta']['message'],
        );
      }
      return DefaultApiException(
        code: err?.response?.statusCode,
        message: err?.response?.statusMessage,
      );
    }
  }

  /// From [ServerException] to [ServerFailure]
  static Failure serverExceptionToFailure(ServerException exception) {
    if (exception is DefaultApiException) {
      return DefaultServerFailure(
        code: exception?.code,
        message: exception?.message,
      );
    } else if (exception is InternalServerException) {
      return InternalServerFailure(
        message: 'Oops, looks like our servers are a little busy.'
            ' Please try again soon',
      );
    } else if (exception is TimeoutApiException) {
      return TimeOutApiFailure(message: 'Network Error : No Data Received.');
    }
    return null;
  }
}
