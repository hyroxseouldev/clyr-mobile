sealed class AppException implements Exception {
  final String code;
  final String? message;
  AppException({required this.code, this.message});
}

class AuthException extends AppException {
  AuthException({required super.code, super.message});
}

class NetworkException extends AppException {
  NetworkException({required super.code, super.message});
}

class OrderException extends AppException {
  OrderException({required super.code, super.message});
}

class WorkoutException extends AppException {
  WorkoutException({required super.code, super.message});
}

extension AppExceptionX on AppException {
  // 사용자에게 보여줄 메시지를 정의
  String get displayMessage {
    return switch (code) {
      'NETWORK_ERROR' => '네트워크 연결이 원활하지 않습니다.',
      'user-not-found' => '존재하지 않는 계정입니다.',
      'wrong-password' => '비밀번호가 일치하지 않습니다.',
      'invalid-email' => '올바른 이메일 형식이 아닙니다.',
      _ => message ?? '알 수 없는 오류가 발생했습니다.',
    };
  }
}
