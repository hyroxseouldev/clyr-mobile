import 'dart:io';
import 'dart:math';

import 'package:supabase_flutter/supabase_flutter.dart';

/// 스토리지 서비스
///
/// Supabase Storage에서 이미지 업로드/삭제/URL 조회
class StorageService {
  final SupabaseStorageClient _storage;

  StorageService({required SupabaseStorageClient storage}) : _storage = storage;

  /// 이미지 업로드
  ///
  /// [bucket] 버킷 이름 (예: 'images', 'profiles')
  /// [file] 업로드할 파일
  /// [path] 저장 경로 (예: 'user123/avatar.jpg')
  /// [upsert] 덮어쓰기 여부
  ///
  /// 반환: 업로드된 이미지의 공개 URL
  Future<String> uploadImage({
    required String bucket,
    required File file,
    required String path,
    bool upsert = false,
  }) async {
    try {
      final fileExtension = path.split('.').last.toLowerCase();

      // 파일 업로드
      await _storage
          .from(bucket)
          .upload(
            path,
            file,
            fileOptions: FileOptions(
              upsert: upsert,
              contentType: _getMimeType(fileExtension),
            ),
          );

      // 공개 URL 반환
      return getPublicUrl(bucket: bucket, path: path);
    } catch (e) {
      throw StorageException(
        code: 'upload_failed',
        message: '이미지 업로드 실패: ${e.toString()}',
      );
    }
  }

  /// 이미지 삭제
  ///
  /// [bucket] 버킷 이름
  /// [paths] 삭제할 파일 경로 목록
  Future<void> deleteImages({
    required String bucket,
    required List<String> paths,
  }) async {
    try {
      await _storage.from(bucket).remove(paths);
    } catch (e) {
      throw StorageException(
        code: 'delete_failed',
        message: '이미지 삭제 실패: ${e.toString()}',
      );
    }
  }

  /// 공개 URL 가져오기
  ///
  /// [bucket] 버킷 이름
  /// [path] 파일 경로
  String getPublicUrl({required String bucket, required String path}) {
    return _storage.from(bucket).getPublicUrl(path);
  }

  /// 서명된 URL 가져오기 (만료 있는 URL)
  ///
  /// [bucket] 버킷 이름
  /// [path] 파일 경로
  /// [expiresIn] 만료 시간 (기본 1시간)
  Future<String> getSignedUrl({
    required String bucket,
    required String path,
    Duration expiresIn = const Duration(hours: 1),
  }) async {
    try {
      final response = await _storage
          .from(bucket)
          .createSignedUrl(path, expiresIn.inSeconds);
      return response;
    } catch (e) {
      throw StorageException(
        code: 'url_generation_failed',
        message: 'URL 생성 실패: ${e.toString()}',
      );
    }
  }

  /// 파일 존재 여부 확인
  Future<bool> fileExists({
    required String bucket,
    required String path,
  }) async {
    try {
      await _storage.from(bucket).download(path);
      return true;
    } catch (e) {
      return false;
    }
  }

  /// 랜덤 파일명 생성
  ///
  /// [extension] 파일 확장자 (예: 'jpg', 'png')
  /// [prefix] 파일명 접두사 (선택사항)
  String generateRandomPath({required String extension, String? prefix}) {
    final random = Random.secure();
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final randomString = random.nextInt(100000).toString().padLeft(5, '0');
    final fileName = '$timestamp-$randomString.$extension';

    if (prefix != null) {
      return '$prefix/$fileName';
    }
    return fileName;
  }

  /// MIME 타입 가져오기
  String _getMimeType(String extension) {
    return switch (extension.toLowerCase()) {
      'jpg' || 'jpeg' => 'image/jpeg',
      'png' => 'image/png',
      'gif' => 'image/gif',
      'webp' => 'image/webp',
      'svg' => 'image/svg+xml',
      _ => 'image/jpeg',
    };
  }
}

/// 스토리지 예외
class StorageException implements Exception {
  final String code;
  final String message;

  StorageException({required this.code, required this.message});

  @override
  String toString() => message;
}
