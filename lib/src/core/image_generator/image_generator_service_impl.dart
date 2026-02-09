import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:clyr_mobile/src/core/health/entity/health_workout_data.dart';
import 'package:clyr_mobile/src/core/image_generator/image_generator_service.dart';
import 'package:clyr_mobile/src/core/share/entity/share_image_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// Image generator service implementation
/// Uses RenderRepaintBoundary to capture widgets as images
class ImageGeneratorServiceImpl implements ImageGeneratorService {
  @override
  Future<Uint8List> generateShareImage({
    required HealthWorkoutData workout,
    required ShareImageStyle style,
  }) async {
    // For now, create a simple placeholder image
    // In production, this would render the actual widget
    return _createPlaceholderImage(workout, style);
  }

  /// Create a placeholder image with workout data
  Future<Uint8List> _createPlaceholderImage(
    HealthWorkoutData workout,
    ShareImageStyle style,
  ) async {
    // Determine size based on style
    final width = 1080;
    final height = style == ShareImageStyle.detailed ? 1920 : 1080;

    // Create a picture recorder
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);

    // Draw background based on style
    if (style == ShareImageStyle.transparent) {
      // Transparent background - no fill
    } else if (style == ShareImageStyle.simple) {
      // Gradient background
      final gradient = ui.Gradient.linear(
        const Offset(0, 0),
        Offset(width.toDouble(), height.toDouble()),
        [
          const Color(0xFF42A5F5), // Blue
          const Color(0xFF7E57C2), // Purple
        ],
      );
      final paint = Paint()..shader = gradient;
      canvas.drawRect(
        Rect.fromLTWH(0, 0, width.toDouble(), height.toDouble()),
        paint,
      );
    } else {
      // Detailed design - dark gradient
      final gradient = ui.Gradient.linear(
        const Offset(0, 0),
        Offset(0, height.toDouble()),
        [
          const Color(0xFF1A237E), // Indigo
          const Color(0xFF1565C0), // Blue
        ],
      );
      final paint = Paint()..shader = gradient;
      canvas.drawRect(
        Rect.fromLTWH(0, 0, width.toDouble(), height.toDouble()),
        paint,
      );
    }

    // Draw text content
    final textStyle = ui.TextStyle(
      color: const Color(0xFFFFFFFF),
      fontSize: 48,
      fontWeight: FontWeight.bold,
    );
    final paragraphStyle = ui.ParagraphStyle(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    // Draw workout type
    final paragraphBuilder = ui.ParagraphBuilder(paragraphStyle)
      ..pushStyle(textStyle)
      ..addText(workout.workoutType.displayName)
      ..pop();

    final paragraph = paragraphBuilder.build()
      ..layout(ui.ParagraphConstraints(width: width.toDouble()));

    canvas.drawParagraph(
      paragraph,
      Offset(
        (width - paragraph.width) / 2,
        height / 2 - paragraph.height / 2,
      ),
    );

    // Draw stats below
    final statsStyle = ui.TextStyle(
      color: const Color(0xFFFFFFFF).withValues(alpha: 0.9),
      fontSize: 32,
    );
    final statsBuilder = ui.ParagraphBuilder(paragraphStyle)
      ..pushStyle(statsStyle)
      ..addText(_formatDuration(workout.duration))
      ..pop();

    final statsParagraph = statsBuilder.build()
      ..layout(ui.ParagraphConstraints(width: width.toDouble()));

    canvas.drawParagraph(
      statsParagraph,
      Offset(
        (width - statsParagraph.width) / 2,
        height / 2 + 50,
      ),
    );

    // Convert to image
    final picture = recorder.endRecording();
    final image = await picture.toImage(width, height);

    // Convert to bytes
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    if (byteData == null) {
      throw Exception('Failed to convert image to bytes');
    }

    return byteData.buffer.asUint8List();
  }

  /// Format duration to readable string
  String _formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);

    if (hours > 0) {
      return '${hours}h ${minutes}m ${seconds}s';
    } else if (minutes > 0) {
      return '${minutes}m ${seconds}s';
    } else {
      return '${seconds}s';
    }
  }
}
