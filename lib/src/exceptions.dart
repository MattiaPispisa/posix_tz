/// Posix timezone initialization exception
class PosixTzInitException implements Exception {
  /// constructor
  const PosixTzInitException(this.message);

  /// exception message
  final String message;

  @override
  String toString() => message;
}

/// Posix timezone not found
class PosixTzNotFound implements Exception {
  /// constructor
  const PosixTzNotFound(this.message);

  /// exception message
  final String message;

  @override
  String toString() => message;
}
