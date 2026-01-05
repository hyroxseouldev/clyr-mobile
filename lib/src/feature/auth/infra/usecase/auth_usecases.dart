import 'package:clyr_mobile/src/core/exception/exception.dart';
import 'package:clyr_mobile/src/core/typedef/typedef.dart';
import 'package:clyr_mobile/src/core/usecase/usecase.dart';
import 'package:clyr_mobile/src/feature/auth/data/user_repository.dart';
import 'package:clyr_mobile/src/feature/auth/infra/entity/user_profile_entity.dart';
import 'package:clyr_mobile/src/feature/auth/infra/usecase/user_profile_usecase.dart';

// Params 정의
typedef LoginParams = ({String email, String password});
typedef SignupParams = ({String email, String password, String fullName});
typedef LogoutParams = void;

// UseCase 들
class LoginUseCase implements Usecase<LoginParams, void> {
  final UserRepository _repository;
  LoginUseCase(this._repository);

  @override
  FutureEither<AuthException, void> call(LoginParams input) {
    return _repository.login((email: input.email, password: input.password));
  }
}

class SignupUseCase implements Usecase<SignupParams, void> {
  final UserRepository _repository;
  SignupUseCase(this._repository);

  @override
  FutureEither<AuthException, void> call(SignupParams input) {
    return _repository.signup((
      email: input.email,
      password: input.password,
      fullName: input.fullName,
    ));
  }
}

class LogoutUseCase implements Usecase<LogoutParams, void> {
  final UserRepository _repository;
  LogoutUseCase(this._repository);

  @override
  FutureEither<AuthException, void> call(LogoutParams input) {
    return _repository.logout();
  }
}

// 모든 UseCase를 담는 컨테이너
class AuthUseCases {
  final LoginUseCase login;
  final SignupUseCase signup;
  final LogoutUseCase logout;
  final GetUserProfileUseCase getUserProfile;
  final UpdateUserProfileUseCase updateUserProfile;

  AuthUseCases({
    required this.login,
    required this.signup,
    required this.logout,
    required this.getUserProfile,
    required this.updateUserProfile,
  });

  factory AuthUseCases.fromRepository(UserRepository repository) {
    return AuthUseCases(
      login: LoginUseCase(repository),
      signup: SignupUseCase(repository),
      logout: LogoutUseCase(repository),
      getUserProfile: GetUserProfileUseCase(repository),
      updateUserProfile: UpdateUserProfileUseCase(repository),
    );
  }
}
