import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:typed_data';

part 'share_image_entity.freezed.dart';

/// Share image style enum
enum ShareImageStyle {
  /// Simple design with gradient background (1080x1080)
  simple,

  /// Detailed design with all stats (1080x1920)
  detailed,

  /// Transparent background with workout data only (1080x1080)
  transparent,
}

/// Share image entity for generated workout images
@freezed
abstract class ShareImageEntity with _$ShareImageEntity {
  // ignore: non_abstract_class_inherits_abstract_member
  const factory ShareImageEntity({
    /// Generated image bytes (PNG format)
    required Uint8List imageBytes,

    /// Image style variant
    required ShareImageStyle style,
  }) = _ShareImageEntity;

  const ShareImageEntity._();
}
