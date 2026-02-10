import 'dart:io';
import 'package:clyr_mobile/src/core/share/share_service.dart';
import 'package:flutter/foundation.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';

/// Share service implementation
/// Uses share_plus for sharing and image_gallery_saver for saving images
class ShareServiceImpl implements ShareService {
  @override
  Future<bool> saveToGallery(Uint8List imageBytes) async {
    try {
      debugPrint('📥 [ShareService] Saving PNG image to gallery...');

      // IMPORTANT: ImageGallerySaver.saveImage() converts to JPEG!
      // We must save as a file first, then use saveFile()

      // 1. Save PNG to temporary directory
      final tempDir = await getTemporaryDirectory();
      final fileName =
          'clyr_workout_${DateTime.now().millisecondsSinceEpoch}.png';
      final filePath = '${tempDir.path}/$fileName';
      final file = File(filePath);
      await file.writeAsBytes(imageBytes);

      debugPrint('📝 [ShareService] PNG file created at: $filePath');

      // 2. Save the PNG file to gallery (preserves PNG format)
      final result = await ImageGallerySaver.saveFile(
        filePath,
        name: fileName,
        isReturnPathOfIOS: true,
      );

      // 3. Clean up temp file
      try {
        await file.delete();
      } catch (_) {
        debugPrint('⚠️ [ShareService] Could not delete temp file');
      }

      final isSuccess = result['isSuccess'] as bool? ?? false;
      if (isSuccess) {
        debugPrint('✅ [ShareService] PNG image saved to gallery');
        debugPrint('📍 [ShareService] Path: ${result['filePath']}');
      } else {
        debugPrint(
          '❌ [ShareService] Failed to save image: ${result['errorMessage'] ?? 'Unknown error'}',
        );
      }

      return isSuccess;
    } catch (e) {
      debugPrint('❌ [ShareService] Error saving to gallery: $e');
      return false;
    }
  }

  @override
  Future<bool> shareToApp(Uint8List imageBytes, SharePlatform platform) async {
    try {
      debugPrint('📤 [ShareService] Sharing to $platform...');

      // Save to temporary file for sharing
      final tempDir = Directory.systemTemp;
      final fileName =
          'clyr_workout_${DateTime.now().millisecondsSinceEpoch}.png';
      final file = File('${tempDir.path}/$fileName');
      await file.writeAsBytes(imageBytes);

      final XFile xFile = XFile(file.path);

      // Share to specific platform - use system share for now
      final result = await Share.shareXFiles([xFile], subject: '나의 운동 기록');

      // Clean up temp file
      try {
        await file.delete();
      } catch (_) {}

      return result.status == ShareResultStatus.success;
    } catch (e) {
      debugPrint('❌ [ShareService] Error sharing to app: $e');
      return false;
    }
  }

  @override
  Future<bool> shareWithSystem(Uint8List imageBytes) async {
    try {
      debugPrint('📤 [ShareService] Sharing with system sheet...');

      // Save to temporary file for sharing
      final tempDir = Directory.systemTemp;
      final fileName =
          'clyr_workout_${DateTime.now().millisecondsSinceEpoch}.png';
      final file = File('${tempDir.path}/$fileName');
      await file.writeAsBytes(imageBytes);

      final XFile xFile = XFile(file.path);

      // Share with system share sheet
      final result = await Share.shareXFiles([xFile], subject: '나의 운동 기록');

      // Clean up temp file
      try {
        await file.delete();
      } catch (_) {}

      debugPrint('✅ [ShareService] Share result: ${result.status}');
      return result.status == ShareResultStatus.success;
    } catch (e) {
      debugPrint('❌ [ShareService] Error sharing with system: $e');
      return false;
    }
  }
}

/// Helper class for platform-specific sharing (deprecated, using Share class directly now)
class ShareHelper {
  /// Share to KakaoTalk
  /// Note: Requires kakao_talk_share package or custom implementation
  static Future<bool> shareWithKakao(XFile xFile) async {
    // For now, use system share - user can select KakaoTalk
    final result = await Share.shareXFiles([xFile]);
    return result.status == ShareResultStatus.success;
  }

  /// Share to Instagram
  /// Note: Requires instagram_share package or custom deep link
  static Future<bool> shareWithInstagram(XFile xFile) async {
    // For now, use system share - user can select Instagram
    final result = await Share.shareXFiles([xFile]);
    return result.status == ShareResultStatus.success;
  }
}
