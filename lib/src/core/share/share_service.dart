import 'dart:typed_data';

/// Share platform enum
enum SharePlatform {
  kakao,
  instagram,
  copyLink,
}

/// Share service interface
/// Handles sharing images to external apps and saving to gallery
abstract class ShareService {
  /// Save image to device gallery
  ///
  /// [imageBytes] - PNG image bytes
  /// Returns success or failure
  Future<bool> saveToGallery(Uint8List imageBytes);

  /// Share image to external app
  ///
  /// [imageBytes] - PNG image bytes
  /// [platform] - Target platform (kakao, instagram, etc.)
  /// Returns success or failure
  Future<bool> shareToApp(Uint8List imageBytes, SharePlatform platform);

  /// Share image with default system share sheet
  ///
  /// [imageBytes] - PNG image bytes
  /// Returns success or failure
  Future<bool> shareWithSystem(Uint8List imageBytes);
}
