import 'package:clyr_mobile/src/core/health/entity/health_workout_data.dart';
import 'package:clyr_mobile/src/core/share/entity/share_image_entity.dart';
import 'dart:typed_data';

/// Image generator service interface
/// Converts HealthWorkoutData to shareable images
abstract class ImageGeneratorService {
  /// Generate a shareable image from workout data
  ///
  /// [workout] - The workout data to convert
  /// [style] - The image style variant (simple, detailed, transparent)
  ///
  /// Returns PNG image bytes
  Future<Uint8List> generateShareImage({
    required HealthWorkoutData workout,
    required ShareImageStyle style,
  });
}
