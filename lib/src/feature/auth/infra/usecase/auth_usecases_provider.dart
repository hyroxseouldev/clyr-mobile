import 'package:clyr_mobile/src/feature/auth/infra/repository/user_repository.dart';
import 'package:clyr_mobile/src/feature/auth/infra/usecase/auth_usecases.dart';
import 'package:clyr_mobile/src/feature/auth/infra/usecase/onboarding_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_usecases_provider.g.dart';

@riverpod
AuthUseCases authUseCases(Ref ref) {
  final repository = ref.read(userRepositoryProvider);
  return AuthUseCases.fromRepository(repository);
}

@riverpod
CheckOnboardingUseCase checkOnboardingUseCase(Ref ref) {
  return CheckOnboardingUseCase(ref.watch(userRepositoryProvider));
}

@riverpod
CompleteOnboardingUseCase completeOnboardingUseCase(Ref ref) {
  return CompleteOnboardingUseCase(ref.watch(userRepositoryProvider));
}
