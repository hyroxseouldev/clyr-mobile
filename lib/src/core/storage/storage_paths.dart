/// 스토리지 버킷 및 경로 관리
///
/// Supabase Storage의 버킷 이름과 파일 경로 체계를 관리
library;

/// 스토리지 버킷 이름
///
/// Supabase Console에서 생성한 버킷 이름과 일치해야 함
class StorageBuckets {
  /// 공개 에셋 버킷 (프로필 이미지 등)
  static const String publicAssets = 'public-assets';

  /// 프로필 이미지 버킷
  static const String profiles = 'profiles';

  /// 워크아웃 이미지 버킷
  static const String workouts = 'workouts';

  /// 프로그램 이미지 버킷
  static const String programs = 'programs';

  /// 일반 이미지 버킷
  static const String images = 'images';
}

/// 스토리지 경로 관리
///
/// 파일 저장 경로 패턴을 정의하고 경로를 생성하는 헬퍼 클래스
class StoragePaths {
  // 프로필 관련 경로
  static const String _profileAvatars = 'avatars';
  static const String _profileBanners = 'banners';
  static const String _userProfile = 'user/profile';

  // 워크아웃 관련 경로
  static const String _workoutThumbnails = 'thumbnails';
  static const String _workoutSessions = 'sessions';

  // 프로그램 관련 경로
  static const String _programThumbnails = 'thumbnails';
  static const String _programBanners = 'banners';

  /// 사용자 프로필 이미지 경로 생성
  ///
  /// [userId] 사용자 ID
  /// [fileName] 파일 이름 (선택사항, null이면 랜덤 생성)
  ///
  /// 예시: `user/profile/user123.jpg`
  static String userProfile(String userId, [String? fileName]) {
    if (fileName != null) {
      return '$_userProfile/$userId/$fileName';
    }
    return '$_userProfile/$userId';
  }

  /// 프로필 아바타 경로 생성
  ///
  /// [userId] 사용자 ID
  /// [fileName] 파일 이름 (선택사항, null이면 랜덤 생성)
  ///
  /// 예시: `avatars/user123.jpg` 또는 `avatars/user123/custom.jpg`
  static String profileAvatar(String userId, [String? fileName]) {
    if (fileName != null) {
      return '$_profileAvatars/$userId/$fileName';
    }
    return '$_profileAvatars/$userId';
  }

  /// 프로필 배너 경로 생성
  ///
  /// [userId] 사용자 ID
  static String profileBanner(String userId) {
    return '$_profileBanners/$userId';
  }

  /// 워크아웃 썸네일 경로 생성
  ///
  /// [programId] 프로그램 ID
  /// [weekId] 주차 ID
  /// [dayNumber] 요일 번호
  static String workoutThumbnail({
    required String programId,
    required String weekId,
    required int dayNumber,
  }) {
    return '$_workoutThumbnails/$programId/$weekId/day-$dayNumber';
  }

  /// 워크아웃 세션 이미지 경로 생성
  ///
  /// [workoutId] 워크아웃 ID
  /// [sessionId] 세션 ID
  static String workoutSessionImage({
    required String workoutId,
    required String sessionId,
  }) {
    return '$_workoutSessions/$workoutId/$sessionId';
  }

  /// 프로그램 썸네일 경로 생성
  ///
  /// [programId] 프로그램 ID
  static String programThumbnail(String programId) {
    return '$_programThumbnails/$programId';
  }

  /// 프로그램 배너 경로 생성
  ///
  /// [programId] 프로그램 ID
  static String programBanner(String programId) {
    return '$_programBanners/$programId';
  }

  /// 사용자별 커스텀 경로 생성
  ///
  /// [userId] 사용자 ID
  /// [folder] 폴더 이름
  /// [fileName] 파일 이름
  ///
  /// 예시: `user123/uploads/custom.jpg`
  static String userPath({
    required String userId,
    required String folder,
    required String fileName,
  }) {
    return '$userId/$folder/$fileName';
  }

  /// 타임스탬프 기반 랜덤 파일명 생성
  ///
  /// [extension] 파일 확장자 (예: 'jpg', 'png')
  static String generateFileName(String extension) {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final random = (timestamp % 10000).toString().padLeft(4, '0');
    return '$timestamp-$random.$extension';
  }
}

/// 스토리지 경로 빌더
///
/// 체인 방식으로 경로를 구성할 때 사용
class StoragePathBuilder {
  final List<String> _segments = [];
  String? _fileName;
  String? _extension;

  /// 폴더 추가
  StoragePathBuilder folder(String name) {
    _segments.add(name);
    return this;
  }

  /// 사용자 ID 폴더 추가
  StoragePathBuilder userFolder(String userId) {
    _segments.add(userId);
    return this;
  }

  /// 파일명 설정
  StoragePathBuilder fileName(String name) {
    _fileName = name;
    return this;
  }

  /// 확장자 설정
  StoragePathBuilder extension(String ext) {
    _extension = ext.startsWith('.') ? ext.substring(1) : ext;
    return this;
  }

  /// 경로 빌드
  String build() {
    final path = _segments.join('/');
    if (_fileName != null) {
      final ext = _extension != null ? '.$_extension' : '';
      return '$path/$_fileName$ext';
    }
    return path;
  }

  /// 타임스탬프 파일명으로 빌드
  String buildWithTimestamp() {
    final ext = _extension ?? 'jpg';
    final fileName = StoragePaths.generateFileName(ext);
    return '${_segments.join('/')}/$fileName';
  }
}

/// 사용 예시:
/// ```dart
/// // 1. 상수 사용
/// final bucket = StorageBuckets.profiles;
/// final path = StoragePaths.profileAvatar('user123');
///
/// // 2. PathBuilder 사용
/// final path = StoragePathBuilder()
///     .folder('avatars')
///     .userFolder('user123')
///     .buildWithTimestamp();
///
/// // 결과: 'avatars/user123/1734567890123-4567.jpg'
/// ```
