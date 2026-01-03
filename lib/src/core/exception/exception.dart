abstract class AppException implements Exception {
  final String message;
  AppException(this.message);
}

class AuthException extends AppException {
  AuthException(super.message);
}

class NetworkException extends AppException {
  NetworkException(super.message);
}
