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
    if (style == ShareImageStyle.transparent) {
      return _createTransparentImage(workout);
    }
    return _createStyledImage(workout, style);
  }

  Future<Uint8List> _createTransparentImage(HealthWorkoutData workout) async {
    final textStyle = ui.TextStyle(
      color: const Color(0xFFFFFFFF),
      fontSize: 48,
      fontWeight: FontWeight.bold,
    );
    final paragraphStyle = ui.ParagraphStyle(
      textAlign: TextAlign.left,
      textDirection: TextDirection.ltr,
    );

    final statsStyle = ui.TextStyle(
      color: const Color(0xFFFFFFFF).withValues(alpha: 0.9),
      fontSize: 32,
    );

    final paragraphBuilder = ui.ParagraphBuilder(paragraphStyle)
      ..pushStyle(textStyle)
      ..addText(workout.workoutType.displayName)
      ..pop();

    final paragraph = paragraphBuilder.build();
    paragraph.layout(const ui.ParagraphConstraints(width: 1080));

    final statsBuilder = ui.ParagraphBuilder(paragraphStyle)
      ..pushStyle(statsStyle)
      ..addText(_formatDuration(workout.duration))
      ..pop();

    final statsParagraph = statsBuilder.build();
    statsParagraph.layout(const ui.ParagraphConstraints(width: 1080));

    final width = paragraph.width.toInt();
    final height = (paragraph.height + statsParagraph.height + 20).toInt();

    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);

    canvas.drawParagraph(paragraph, Offset.zero);
    canvas.drawParagraph(statsParagraph, Offset(0, paragraph.height + 20));

    final picture = recorder.endRecording();
    final image = await picture.toImage(width, height);

    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    if (byteData == null) {
      throw Exception('Failed to convert image to bytes');
    }

    return byteData.buffer.asUint8List();
  }

  Future<Uint8List> _createStyledImage(
    HealthWorkoutData workout,
    ShareImageStyle style,
  ) async {
    final width = 1080;
    final height = style == ShareImageStyle.detailed ? 1920 : 1080;

    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);

    if (style == ShareImageStyle.simple) {
      final gradient = ui.Gradient.linear(
        const Offset(0, 0),
        Offset(width.toDouble(), height.toDouble()),
        [const Color(0xFF42A5F5), const Color(0xFF7E57C2)],
      );
      final paint = Paint()..shader = gradient;
      canvas.drawRect(
        Rect.fromLTWH(0, 0, width.toDouble(), height.toDouble()),
        paint,
      );
    } else {
      final gradient = ui.Gradient.linear(
        const Offset(0, 0),
        Offset(0, height.toDouble()),
        [const Color(0xFF1A237E), const Color(0xFF1565C0)],
      );
      final paint = Paint()..shader = gradient;
      canvas.drawRect(
        Rect.fromLTWH(0, 0, width.toDouble(), height.toDouble()),
        paint,
      );
    }

    final textStyle = ui.TextStyle(
      color: const Color(0xFFFFFFFF),
      fontSize: 48,
      fontWeight: FontWeight.bold,
    );
    final paragraphStyle = ui.ParagraphStyle(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    final paragraphBuilder = ui.ParagraphBuilder(paragraphStyle)
      ..pushStyle(textStyle)
      ..addText(workout.workoutType.displayName)
      ..pop();

    final paragraph = paragraphBuilder.build()
      ..layout(ui.ParagraphConstraints(width: width.toDouble()));

    canvas.drawParagraph(
      paragraph,
      Offset((width - paragraph.width) / 2, height / 2 - paragraph.height / 2),
    );

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
      Offset((width - statsParagraph.width) / 2, height / 2 + 50),
    );

    final picture = recorder.endRecording();
    final image = await picture.toImage(width, height);

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
