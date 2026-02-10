import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:clyr_mobile/src/core/health/entity/health_workout_data.dart';
import 'package:clyr_mobile/src/core/image_generator/image_generator_service.dart';
import 'package:clyr_mobile/src/core/share/entity/share_image_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image/image.dart' as img;

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
    // Image dimensions
    const int width = 300;
    const int height = 400;

    // Create a transparent image using the image package
    final image = img.Image(width: width, height: height, numChannels: 4);

    // Fill with transparent pixels (RGBA: 0, 0, 0, 0)
    img.fill(image, color: img.ColorRgba8(0, 0, 0, 0));

    // Now we need to draw text on this transparent image
    // Unfortunately, the image package doesn't have great text rendering
    // So we'll use dart:ui to render text, then composite it

    // 1. Create text using dart:ui
    final textStyle = ui.TextStyle(
      color: const Color(0xFFFFFFFF),
      fontSize: 48,
      fontWeight: FontWeight.bold,
    );

    final paragraphStyle = ui.ParagraphStyle(
      textAlign: TextAlign.left,
      textDirection: TextDirection.ltr,
    );

    // Build workout type paragraph
    final paragraphBuilder = ui.ParagraphBuilder(paragraphStyle)
      ..pushStyle(textStyle)
      ..addText(workout.workoutType.displayName);

    final paragraph = paragraphBuilder.build();
    paragraph.layout(ui.ParagraphConstraints(width: width.toDouble()));

    // Stats text style
    final statsStyle = ui.TextStyle(
      color: const Color(0xFFFFFFFF).withValues(alpha: 0.9),
      fontSize: 32,
    );

    // Build stats paragraph
    final statsBuilder = ui.ParagraphBuilder(paragraphStyle)
      ..pushStyle(statsStyle)
      ..addText(_formatDuration(workout.duration));

    final statsParagraph = statsBuilder.build();
    statsParagraph.layout(ui.ParagraphConstraints(width: width.toDouble()));

    // 2. Render text to a separate image with transparent background
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);

    // Draw text on canvas (no background)
    canvas.drawParagraph(paragraph, const Offset(20, 20));
    canvas.drawParagraph(
      statsParagraph,
      Offset(20, 20 + paragraph.height + 20),
    );

    final picture = recorder.endRecording();
    final textImage = await picture.toImage(width, height);

    // 3. Convert to raw RGBA bytes
    final byteData = await textImage.toByteData(
      format: ui.ImageByteFormat.rawRgba,
    );
    if (byteData == null) {
      throw Exception('Failed to convert text image to bytes');
    }

    // 4. Copy the RGBA data to our transparent image
    final pixels = byteData.buffer.asUint8List();
    for (int y = 0; y < height; y++) {
      for (int x = 0; x < width; x++) {
        final offset = (y * width + x) * 4;
        final r = pixels[offset];
        final g = pixels[offset + 1];
        final b = pixels[offset + 2];
        final a = pixels[offset + 3];

        // Only set pixel if it has some alpha (i.e., it's text)
        if (a > 0) {
          image.setPixelRgba(x, y, r, g, b, a);
        }
      }
    }

    // 5. Encode as PNG with alpha channel
    final pngBytes = img.encodePng(image);

    debugPrint('🖼️ [ImageGenerator] Transparent PNG created:');
    debugPrint('   - Size: ${pngBytes.length} bytes');
    debugPrint('   - Dimensions: ${width}x$height');
    debugPrint('   - Channels: 4 (RGBA)');

    return Uint8List.fromList(pngBytes);
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
