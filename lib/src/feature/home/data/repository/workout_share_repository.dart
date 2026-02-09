import 'package:clyr_mobile/src/core/error/exception.dart';
import 'package:clyr_mobile/src/core/health/entity/health_workout_data.dart';
import 'package:clyr_mobile/src/core/image_generator/image_generator_service.dart';
import 'package:clyr_mobile/src/core/share/entity/share_image_entity.dart';
import 'package:clyr_mobile/src/core/share/share_service.dart';
import 'package:clyr_mobile/src/core/util/type_defs.dart';
import 'package:fpdart/fpdart.dart';
import 'package:flutter/foundation.dart';

/// Workout share repository
/// Orchestrates image generation and sharing operations
class WorkoutShareRepository {
  final ImageGeneratorService _imageGenerator;
  final ShareService _shareService;

  WorkoutShareRepository({
    required ImageGeneratorService imageGenerator,
    required ShareService shareService,
  })  : _imageGenerator = imageGenerator,
        _shareService = shareService;

  /// Generate all 3 share image versions
  FutureEither<List<ShareImageEntity>> generateShareImages(
    HealthWorkoutData workout,
  ) async {
    debugPrint('📊 [WorkoutShareRepository] Generating share images...');

    try {
      final images = <ShareImageEntity>[];

      // Generate all 3 styles
      for (final style in ShareImageStyle.values) {
        debugPrint('📊 [WorkoutShareRepository] Generating ${style.name} image...');
        final imageBytes = await _imageGenerator.generateShareImage(
          workout: workout,
          style: style,
        );
        images.add(ShareImageEntity(
          imageBytes: imageBytes,
          style: style,
        ));
      }

      debugPrint('✅ [WorkoutShareRepository] Generated ${images.length} images');
      return right(images);
    } catch (e) {
      debugPrint('❌ [WorkoutShareRepository] Error generating images: $e');
      return left(AppException.workout('Failed to generate share images: $e'));
    }
  }

  /// Download image to device gallery
  FutureEither<void> downloadToGallery(
    Uint8List imageBytes,
  ) async {
    debugPrint('📥 [WorkoutShareRepository] Downloading to gallery...');

    final success = await _shareService.saveToGallery(imageBytes);

    if (success) {
      debugPrint('✅ [WorkoutShareRepository] Image saved to gallery');
      return right(null);
    } else {
      debugPrint('❌ [WorkoutShareRepository] Failed to save image');
      return left(AppException.database('Failed to save image to gallery'));
    }
  }

  /// Share image to SNS
  FutureEither<void> shareToSNS(
    Uint8List imageBytes,
    SharePlatform platform,
  ) async {
    debugPrint('📤 [WorkoutShareRepository] Sharing to $platform...');

    final success = await _shareService.shareToApp(imageBytes, platform);

    if (success) {
      debugPrint('✅ [WorkoutShareRepository] Shared successfully');
      return right(null);
    } else {
      debugPrint('❌ [WorkoutShareRepository] Share failed');
      return left(AppException.workout('Failed to share to $platform'));
    }
  }

  /// Share image with system sheet
  FutureEither<void> shareWithSystem(
    Uint8List imageBytes,
  ) async {
    debugPrint('📤 [WorkoutShareRepository] Sharing with system sheet...');

    final success = await _shareService.shareWithSystem(imageBytes);

    if (success) {
      debugPrint('✅ [WorkoutShareRepository] Shared successfully');
      return right(null);
    } else {
      debugPrint('❌ [WorkoutShareRepository] Share failed');
      return left(AppException.workout('Failed to share image'));
    }
  }
}
