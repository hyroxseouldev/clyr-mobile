import 'package:flutter/foundation.dart';
import 'package:clyr_mobile/src/core/share/entity/share_image_entity.dart';
import 'package:clyr_mobile/src/core/share/share_service.dart';
import 'package:clyr_mobile/src/feature/home/data/repository/workout_share_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'workout_share_controller.g.dart';

/// Workout share controller
/// Manages action states (download, share) for workout sharing
@riverpod
class WorkoutShareController extends _$WorkoutShareController {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  /// Download image to gallery
  Future<void> downloadImage(ShareImageEntity image) async {
    debugPrint(
      '📥 [WorkoutShareController] downloadImage called - style: ${image.style}',
    );

    // Prevent duplicate actions
    if (state.isLoading) {
      debugPrint(
        '⏳ [WorkoutShareController] Already loading, ignoring duplicate action',
      );
      return;
    }

    state = const AsyncValue.loading();

    final result = await ref
        .read(workoutShareRepositoryProvider)
        .downloadToGallery(image.imageBytes);

    result.fold(
      (error) {
        debugPrint('❌ [WorkoutShareController] Download failed: $error');
        state = AsyncValue.error(error, StackTrace.current);
      },
      (_) {
        debugPrint('✅ [WorkoutShareController] Download succeeded');
        state = const AsyncValue.data(null);
      },
    );
  }

  /// Share to KakaoTalk
  Future<void> shareToKakao(ShareImageEntity image) async {
    if (state.isLoading) return;

    state = const AsyncValue.loading();

    final result = await ref
        .read(workoutShareRepositoryProvider)
        .shareToSNS(image.imageBytes, SharePlatform.kakao);

    result.fold(
      (error) => state = AsyncValue.error(error, StackTrace.current),
      (_) => state = const AsyncValue.data(null),
    );
  }

  /// Share to Instagram
  Future<void> shareToInstagram(ShareImageEntity image) async {
    if (state.isLoading) return;

    state = const AsyncValue.loading();

    final result = await ref
        .read(workoutShareRepositoryProvider)
        .shareToSNS(image.imageBytes, SharePlatform.instagram);

    result.fold(
      (error) => state = AsyncValue.error(error, StackTrace.current),
      (_) => state = const AsyncValue.data(null),
    );
  }

  /// Share with system sheet
  Future<void> shareWithSystem(ShareImageEntity image) async {
    if (state.isLoading) return;

    state = const AsyncValue.loading();

    final result = await ref
        .read(workoutShareRepositoryProvider)
        .shareWithSystem(image.imageBytes);

    result.fold(
      (error) => state = AsyncValue.error(error, StackTrace.current),
      (_) => state = const AsyncValue.data(null),
    );
  }
}
