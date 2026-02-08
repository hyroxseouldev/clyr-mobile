import 'package:clyr_mobile/src/core/util/type_defs.dart';
import 'package:clyr_mobile/src/core/usecase/usecase.dart';
import 'package:clyr_mobile/src/feature/auth/infra/repository/user_repository.dart';

/// Check if user has completed onboarding
class CheckOnboardingUseCase implements Usecase<void, bool> {
  final UserRepository _repository;

  CheckOnboardingUseCase(this._repository);

  @override
  FutureEither<bool> call(void input) {
    return _repository.checkOnboardingStatus();
  }
}

/// Complete onboarding with user data
class CompleteOnboardingUseCase
    implements Usecase<Map<String, dynamic>, void> {
  final UserRepository _repository;

  CompleteOnboardingUseCase(this._repository);

  @override
  FutureEither<void> call(Map<String, dynamic> data) {
    return _repository.completeOnboarding(data);
  }
}
