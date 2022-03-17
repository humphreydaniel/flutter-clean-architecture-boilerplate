import 'failures.dart';

/// Get error data from cache
class CacheFailure extends Failure {
  final String message;
  final int code;

  ///
  CacheFailure({
    this.message,
    this.code,
  }) : super(
          code: code,
          message: message,
        );
}
