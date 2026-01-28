import 'package:clyr_mobile/src/feature/auth/infra/entity/onboarding_entity.dart';
import 'package:clyr_mobile/src/feature/auth/infra/usecase/auth_usecases_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'onboarding_controller.g.dart';

@riverpod
class OnboardingController extends _$OnboardingController {
  @override
  FutureOr<void> build() {}

  Future<void> completeOnboarding({
    required Gender gender,
    required ExerciseType exerciseType,
    required ExperienceLevel experience,
  }) async {
    state = const AsyncLoading();

    final onboardingEntity = OnboardingEntity(
      gender: gender,
      exerciseType: exerciseType,
      experience: experience,
    );

    final usecase = ref.read(completeOnboardingUseCaseProvider);
    final result = await usecase(onboardingEntity.toJson());

    state = result.fold(
      (l) => AsyncError(l, StackTrace.current),
      (r) => const AsyncData(null),
    );
  }
}

@riverpod
Future<bool> checkOnboardingStatus(Ref ref) async {
  final usecase = ref.watch(checkOnboardingUseCaseProvider);
  final result = await usecase(null);

  return result.fold(
    (l) => throw l,
    (r) => r,
  );
}
