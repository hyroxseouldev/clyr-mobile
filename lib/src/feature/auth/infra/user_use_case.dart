// 입력을 클래스 대신 레코드 별칭으로 정의
import 'package:clyr_mobile/src/core/exception/exception.dart';
import 'package:clyr_mobile/src/feature/auth/data/user_repository.dart';
import 'package:clyr_mobile/src/core/typedef/typedef.dart';

typedef LoginParams = ({String email, String password});

// 유즈케이스 인터페이스는 그대로 유지
abstract class Usecase<I, O> {
  FutureEither<AppException, O> call(I input);
}

// 구현체
class LoginUseCase implements Usecase<LoginParams, void> {
  final UserRepository _repository;
  LoginUseCase(this._repository);

  @override
  FutureEither<AppException, void> call(LoginParams input) {
    // input.email, input.password로 바로 접근
    return _repository.login(input.email, input.password);
  }
}
