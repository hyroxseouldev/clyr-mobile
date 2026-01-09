import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:clyr_mobile/src/core/theme/theme_mode_provider.dart';

/// 테마 모드 전환 위젯
///
/// 현재 테마 상태를 표시하고 클릭 시 다이얼로그를 열어 테마를 변경합니다
class ThemeModeToggle extends HookConsumerWidget {
  const ThemeModeToggle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeModeAsync = ref.watch(themeModeProvider);

    return ListTile(
      leading: Icon(_getIcon(themeModeAsync)),
      title: const Text('테마 설정'),
      subtitle: Text(_getSubtitle(themeModeAsync)),
      trailing: const Icon(Icons.chevron_right),
      onTap: () => _showThemeDialog(context),
    );
  }

  IconData _getIcon(AsyncValue<ThemeMode> themeModeAsync) {
    return themeModeAsync.when(
      data: (mode) {
        switch (mode) {
          case ThemeMode.light:
            return Icons.light_mode;
          case ThemeMode.dark:
            return Icons.dark_mode;
          case ThemeMode.system:
            return Icons.brightness_auto;
        }
      },
      loading: () => Icons.brightness_auto,
      error: (_, __) => Icons.brightness_auto,
    );
  }

  String _getSubtitle(AsyncValue<ThemeMode> themeModeAsync) {
    return themeModeAsync.when(
      data: (mode) {
        switch (mode) {
          case ThemeMode.light:
            return '라이트 모드';
          case ThemeMode.dark:
            return '다크 모드';
          case ThemeMode.system:
            return '시스템 설정 따르기';
        }
      },
      loading: () => '로딩 중...',
      error: (_, __) => '기본 설정',
    );
  }

  void _showThemeDialog(BuildContext context) {
    showDialog(context: context, builder: (context) => const ThemeModeDialog());
  }
}

/// 테마 모드 선택 다이얼로그
class ThemeModeDialog extends ConsumerWidget {
  const ThemeModeDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeModeAsync = ref.watch(themeModeProvider);

    return AlertDialog(
      title: const Text('테마 선택'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _ThemeOption(
            icon: Icons.light_mode,
            label: '라이트 모드',
            mode: ThemeMode.light,
            currentMode: themeModeAsync,
          ),
          _ThemeOption(
            icon: Icons.dark_mode,
            label: '다크 모드',
            mode: ThemeMode.dark,
            currentMode: themeModeAsync,
          ),
          _ThemeOption(
            icon: Icons.brightness_auto,
            label: '시스템 설정',
            mode: ThemeMode.system,
            currentMode: themeModeAsync,
          ),
        ],
      ),
    );
  }
}

/// 테마 옵션 위젯
class _ThemeOption extends ConsumerWidget {
  final IconData icon;
  final String label;
  final ThemeMode mode;
  final AsyncValue<ThemeMode> currentMode;

  const _ThemeOption({
    required this.icon,
    required this.label,
    required this.mode,
    required this.currentMode,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSelected = currentMode.when(
      data: (current) => current == mode,
      loading: () => false,
      error: (_, __) => false,
    );

    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      trailing: isSelected
          ? Icon(Icons.check, color: Theme.of(context).colorScheme.primary)
          : null,
      onTap: () async {
        await ref.read(themeModeProvider.notifier).setThemeMode(mode);
        if (context.mounted) {
          Navigator.of(context).pop();
        }
      },
    );
  }
}
