import 'package:clyr_mobile/src/core/health/entity/health_workout_data.dart';
import 'package:clyr_mobile/src/core/share/entity/share_image_entity.dart';
import 'package:clyr_mobile/src/core/share/share_service.dart';
import 'package:clyr_mobile/src/feature/home/data/repository/workout_share_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'workout_share_provider.g.dart';

/// Workout share provider
/// Manages state for workout sharing feature
@riverpod
class WorkoutShare extends _$WorkoutShare {
  @override
  Future<List<ShareImageEntity>> build(HealthWorkoutData workout) async {
    // Generate all 3 image versions on initialization
    final result = await ref.read(workoutShareRepositoryProvider).generateShareImages(workout);
    return result.fold(
      (error) => throw error,
      (images) => images,
    );
  }

  /// Download image to gallery
  Future<void> downloadImage(int index) async {
    final images = state.value;
    if (images == null || index < 0 || index >= images.length) {
      return;
    }

    state = const AsyncValue.loading();
    final result = await ref.read(workoutShareRepositoryProvider).downloadToGallery(
      images[index].imageBytes,
    );

    result.fold(
      (error) => state = AsyncValue.error(error, StackTrace.current),
      (_) => state = AsyncValue.data(images),
    );
  }

  /// Share to KakaoTalk
  Future<void> shareToKakao(int index) async {
    final images = state.value;
    if (images == null || index < 0 || index >= images.length) {
      return;
    }

    state = const AsyncValue.loading();
    final result = await ref.read(workoutShareRepositoryProvider).shareToSNS(
      images[index].imageBytes,
      SharePlatform.kakao,
    );

    result.fold(
      (error) => state = AsyncValue.error(error, StackTrace.current),
      (_) => state = AsyncValue.data(images),
    );
  }

  /// Share to Instagram
  Future<void> shareToInstagram(int index) async {
    final images = state.value;
    if (images == null || index < 0 || index >= images.length) {
      return;
    }

    state = const AsyncValue.loading();
    final result = await ref.read(workoutShareRepositoryProvider).shareToSNS(
      images[index].imageBytes,
      SharePlatform.instagram,
    );

    result.fold(
      (error) => state = AsyncValue.error(error, StackTrace.current),
      (_) => state = AsyncValue.data(images),
    );
  }

  /// Share with system sheet
  Future<void> shareWithSystem(int index) async {
    final images = state.value;
    if (images == null || index < 0 || index >= images.length) {
      return;
    }

    state = const AsyncValue.loading();
    final result = await ref.read(workoutShareRepositoryProvider).shareWithSystem(
      images[index].imageBytes,
    );

    result.fold(
      (error) => state = AsyncValue.error(error, StackTrace.current),
      (_) => state = AsyncValue.data(images),
    );
  }
}
