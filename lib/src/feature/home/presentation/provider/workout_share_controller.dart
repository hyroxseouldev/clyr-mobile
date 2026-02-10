import 'package:clyr_mobile/src/core/health/entity/health_workout_data.dart';
import 'package:clyr_mobile/src/core/share/share_service.dart';
import 'package:clyr_mobile/src/feature/home/data/repository/workout_share_repository_provider.dart';
import 'package:clyr_mobile/src/feature/home/presentation/provider/workout_share_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'workout_share_controller.g.dart';

/// Workout share controller
/// Manages action states (download, share) for workout sharing
@riverpod
class WorkoutShareController extends _$WorkoutShareController {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  /// Download image to gallery
  Future<void> downloadImage(HealthWorkoutData workout, int index) async {
    // Prevent duplicate actions
    if (state.isLoading) return;

    state = const AsyncValue.loading();

    final images = ref.read(workoutShareProvider(workout));
    if (images.value == null || index < 0 || index >= images.value!.length) {
      state = AsyncValue.error('Invalid image index', StackTrace.current);
      return;
    }

    final result = await ref
        .read(workoutShareRepositoryProvider)
        .downloadToGallery(images.value![index].imageBytes);

    result.fold(
      (error) => state = AsyncValue.error(error, StackTrace.current),
      (_) => state = const AsyncValue.data(null),
    );
  }

  /// Share to KakaoTalk
  Future<void> shareToKakao(HealthWorkoutData workout, int index) async {
    if (state.isLoading) return;

    state = const AsyncValue.loading();

    final images = ref.read(workoutShareProvider(workout));
    if (images.value == null || index < 0 || index >= images.value!.length) {
      state = AsyncValue.error('Invalid image index', StackTrace.current);
      return;
    }

    final result = await ref
        .read(workoutShareRepositoryProvider)
        .shareToSNS(images.value![index].imageBytes, SharePlatform.kakao);

    result.fold(
      (error) => state = AsyncValue.error(error, StackTrace.current),
      (_) => state = const AsyncValue.data(null),
    );
  }

  /// Share to Instagram
  Future<void> shareToInstagram(HealthWorkoutData workout, int index) async {
    if (state.isLoading) return;

    state = const AsyncValue.loading();

    final images = ref.read(workoutShareProvider(workout));
    if (images.value == null || index < 0 || index >= images.value!.length) {
      state = AsyncValue.error('Invalid image index', StackTrace.current);
      return;
    }

    final result = await ref
        .read(workoutShareRepositoryProvider)
        .shareToSNS(images.value![index].imageBytes, SharePlatform.instagram);

    result.fold(
      (error) => state = AsyncValue.error(error, StackTrace.current),
      (_) => state = const AsyncValue.data(null),
    );
  }

  /// Share with system sheet
  Future<void> shareWithSystem(HealthWorkoutData workout, int index) async {
    if (state.isLoading) return;

    state = const AsyncValue.loading();

    final images = ref.read(workoutShareProvider(workout));
    if (images.value == null || index < 0 || index >= images.value!.length) {
      state = AsyncValue.error('Invalid image index', StackTrace.current);
      return;
    }

    final result = await ref
        .read(workoutShareRepositoryProvider)
        .shareWithSystem(images.value![index].imageBytes);

    result.fold(
      (error) => state = AsyncValue.error(error, StackTrace.current),
      (_) => state = const AsyncValue.data(null),
    );
  }
}
