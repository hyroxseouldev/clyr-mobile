import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_mode_provider.g.dart';

/// 테마 모드 저장소 키
const _themeModeKey = 'theme_mode';

/// 테마 모드 프로바이더
///
/// 라이트/다크/시스템 모드 상태 관리 및 영구 저장
@riverpod
class ThemeModeNotifier extends _$ThemeModeNotifier {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  @override
  Future<ThemeMode> build() async {
    // 저장된 테마 모드 로드
    final savedThemeMode = await _storage.read(key: _themeModeKey);
    return _parseThemeMode(savedThemeMode);
  }

  /// 테마 모드 변경
  Future<void> setThemeMode(ThemeMode mode) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await _storage.write(key: _themeModeKey, value: mode.toString());
      return mode;
    });
  }

  /// 테마 모드 토글 (라이트 → 다크 → 시스템 → 라이트 ...)
  Future<void> toggleThemeMode() async {
    final currentMode = state.value ?? ThemeMode.system;
    ThemeMode newMode;

    switch (currentMode) {
      case ThemeMode.light:
        newMode = ThemeMode.dark;
        break;
      case ThemeMode.dark:
        newMode = ThemeMode.system;
        break;
      case ThemeMode.system:
        newMode = ThemeMode.light;
        break;
    }

    await setThemeMode(newMode);
  }

  ThemeMode _parseThemeMode(String? value) {
    switch (value) {
      case 'ThemeMode.light':
        return ThemeMode.light;
      case 'ThemeMode.dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }
}
