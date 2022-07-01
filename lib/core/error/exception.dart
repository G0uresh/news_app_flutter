class AppException implements Exception {
  final String error;
  final String? message;

  AppException({
    required this.error,
    this.message,
  });
}

class NetworkConnectionException extends AppException {
  NetworkConnectionException()
      : super(
    error: 'Network connection lost.',
    message: 'Network connection lost',
  );
}