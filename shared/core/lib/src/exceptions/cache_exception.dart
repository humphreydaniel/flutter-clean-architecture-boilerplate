/// Handling error from a local data source, for example a SQLite, SharedPref,
/// etc...
///
class CacheException implements Exception {
  /// Error message when fail
  final String message;

  /// Error code
  final int code;

  ///
  CacheException({
    this.message,
    this.code,
  });
}

/// Handling cache when cache is null, or cache not found
class NotFoundCacheException extends CacheException {
  /// Error message when fail
  final String message;

  /// Error code
  final int code;

  ///
  NotFoundCacheException({
    this.message,
    this.code,
  });
}
