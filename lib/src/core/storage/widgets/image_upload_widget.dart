import 'dart:io';

import 'package:clyr_mobile/src/core/storage/storage_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

/// 이미지 업로드 위젯
///
/// 사용법:
/// ```dart
/// ImageUploadWidget(
///   bucket: StorageBuckets.profiles,
///   path: 'user123/avatar',
///   initialImageUrl: 'https://...',
///   onImageUrlChanged: (url) => print(url),
/// )
/// ```
class ImageUploadWidget extends HookConsumerWidget {
  /// 버킷 이름
  final String bucket;

  /// 저장 경로 (null이면 랜덤 생성)
  final String? path;

  /// 초기 이미지 URL
  final String? initialImageUrl;

  /// 업로드 완료 콜백
  final ValueChanged<String>? onImageUrlChanged;

  /// 위젯 크기
  final double? width;

  /// 위젯 높이
  final double? height;

  /// 이미지 적합 방식
  final BoxFit fit;

  /// 플레이스홀더 아이콘
  final IconData? placeholderIcon;

  /// 플레이스홀더 텍스트
  final String? placeholderText;

  /// 동그란 모양 여부
  final bool isCircle;

  const ImageUploadWidget({
    super.key,
    required this.bucket,
    this.path,
    this.initialImageUrl,
    this.onImageUrlChanged,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.placeholderIcon,
    this.placeholderText,
    this.isCircle = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageUrl = useState<String?>(initialImageUrl);
    final isUploading = useState(false);
    final storageService = ref.watch(storageServiceProvider);

    // 이미지 선택
    Future<void> pickImage() async {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1920,
        maxHeight: 1920,
        imageQuality: 85,
      );

      if (pickedFile == null) return;

      isUploading.value = true;

      try {
        final file = File(pickedFile.path);
        final uploadPath =
            path ??
            storageService.generateRandomPath(
              extension: pickedFile.path.split('.').last,
            );

        final uploadedUrl = await storageService.uploadImage(
          bucket: bucket,
          file: file,
          path: uploadPath,
          upsert: true,
        );

        imageUrl.value = uploadedUrl;
        onImageUrlChanged?.call(uploadedUrl);
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('이미지 업로드 실패: $e')));
        }
      } finally {
        isUploading.value = false;
      }
    }

    // 카메라로 촬영
    Future<void> takePhoto() async {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(
        source: ImageSource.camera,
        maxWidth: 1920,
        maxHeight: 1920,
        imageQuality: 85,
      );

      if (pickedFile == null) return;

      isUploading.value = true;

      try {
        final file = File(pickedFile.path);
        final uploadPath =
            path ??
            storageService.generateRandomPath(
              extension: pickedFile.path.split('.').last,
            );

        final uploadedUrl = await storageService.uploadImage(
          bucket: bucket,
          file: file,
          path: uploadPath,
          upsert: true,
        );

        imageUrl.value = uploadedUrl;
        onImageUrlChanged?.call(uploadedUrl);
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('이미지 업로드 실패: $e')));
        }
      } finally {
        isUploading.value = false;
      }
    }

    // 이미지 삭제
    Future<void> removeImage() async {
      imageUrl.value = null;
      onImageUrlChanged?.call('');
    }

    // 이미지 선택 옵션 다이얼로그
    void showImageSourceDialog() {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('이미지 선택'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('갤러리에서 선택'),
                onTap: () {
                  Navigator.pop(context);
                  pickImage();
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('카메라로 촬영'),
                onTap: () {
                  Navigator.pop(context);
                  takePhoto();
                },
              ),
              if (imageUrl.value != null)
                ListTile(
                  leading: const Icon(Icons.delete, color: Colors.red),
                  title: const Text('이미지 삭제'),
                  onTap: () {
                    Navigator.pop(context);
                    removeImage();
                  },
                ),
            ],
          ),
        ),
      );
    }

    final effectiveWidth = width ?? 120.0;
    final effectiveHeight = height ?? 120.0;

    Widget buildContent() {
      // 로딩 중
      if (isUploading.value) {
        return Container(
          width: effectiveWidth,
          height: effectiveHeight,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: isCircle ? null : BorderRadius.circular(12),
            shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
          ),
          child: const Center(child: CircularProgressIndicator()),
        );
      }

      // 이미지 있음
      if (imageUrl.value != null) {
        return GestureDetector(
          onTap: showImageSourceDialog,
          child: Stack(
            children: [
              Container(
                width: effectiveWidth,
                height: effectiveHeight,
                decoration: BoxDecoration(
                  borderRadius: isCircle ? null : BorderRadius.circular(12),
                  shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    imageUrl.value!,
                    width: effectiveWidth,
                    height: effectiveHeight,
                    fit: fit,
                    errorBuilder: (context, error, stackTrace) {
                      return _buildPlaceholder(context);
                    },
                  ),
                ),
              ),
              // 오버레이 아이콘
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: isCircle ? null : BorderRadius.circular(12),
                    shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
                    color: Colors.black.withValues(alpha: 0.3),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: effectiveWidth * 0.3,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }

      // 이미지 없음
      return GestureDetector(
        onTap: showImageSourceDialog,
        child: Container(
          width: effectiveWidth,
          height: effectiveHeight,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: isCircle ? null : BorderRadius.circular(12),
            shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
            border: Border.all(
              color: Colors.grey.shade400,
              width: 2,
              style: BorderStyle.solid,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                placeholderIcon ?? Icons.add_photo_alternate,
                size: effectiveWidth * 0.4,
                color: Colors.grey.shade500,
              ),
              if (placeholderText != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    placeholderText!,
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                    textAlign: TextAlign.center,
                  ),
                ),
            ],
          ),
        ),
      );
    }

    return buildContent();
  }

  Widget _buildPlaceholder(BuildContext context) {
    final effectiveWidth = width ?? 120.0;
    final effectiveHeight = height ?? 120.0;

    return Container(
      width: effectiveWidth,
      height: effectiveHeight,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: isCircle ? null : BorderRadius.circular(12),
        shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
      ),
      child: Icon(
        placeholderIcon ?? Icons.broken_image,
        size: effectiveWidth * 0.4,
        color: Colors.grey.shade400,
      ),
    );
  }
}
