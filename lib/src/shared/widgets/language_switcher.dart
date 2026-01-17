import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'language_switcher.g.dart';

/// Language provider for managing app language state
/// Note: This provider is standalone and NOT integrated with app.dart yet
/// User will integrate language switching functionality later
@riverpod
class Language extends _$Language {
  @override
  Locale build() {
    return const Locale('ko'); // Default: Korean
  }

  void setLocale(Locale locale) {
    state = locale;
  }
}

/// Language switcher widget - standalone, not integrated yet
///
/// Usage example (for future integration):
/// ```dart
/// AppBar(
///   title: Text('Settings'),
///   actions: const [
///     LanguageSwitcher(),
///   ],
/// )
/// ```
///
/// Note: To actually change the app language, you need to:
/// 1. Watch this provider in app.dart
/// 2. Pass the locale to MaterialApp.router(locale: locale)
class LanguageSwitcher extends ConsumerWidget {
  const LanguageSwitcher({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLocale = ref.watch(languageProvider);
    final isKorean = currentLocale.languageCode == 'ko';

    return PopupMenuButton<Locale>(
      icon: const Icon(Icons.language),
      tooltip: 'Change Language',
      onSelected: (Locale locale) {
        ref.read(languageProvider.notifier).setLocale(locale);
        // Note: Language change won't take effect until integrated with app.dart
        // User will add this integration later
      },
      itemBuilder: (BuildContext context) => [
        PopupMenuItem<Locale>(
          value: const Locale('ko'),
          child: Row(
            children: [
              const Text('🇰🇷'),
              const SizedBox(width: 12),
              const Text('한국어'),
              if (isKorean) ...[
                const Spacer(),
                const Icon(Icons.check, size: 18),
              ],
            ],
          ),
        ),
        PopupMenuItem<Locale>(
          value: const Locale('en'),
          child: Row(
            children: [
              const Text('🇺🇸'),
              const SizedBox(width: 12),
              const Text('English'),
              if (!isKorean) ...[
                const Spacer(),
                const Icon(Icons.check, size: 18),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

/// Simple language switcher with SegmentedButton style
/// Alternative design for language selection
class SimpleLanguageSwitcher extends ConsumerWidget {
  const SimpleLanguageSwitcher({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLocale = ref.watch(languageProvider);
    final isKorean = currentLocale.languageCode == 'ko';

    return SegmentedButton<bool>(
      segments: const [
        ButtonSegment(
          value: true,
          label: Text('한국어'),
          icon: Text('🇰🇷', style: TextStyle(fontSize: 18)),
        ),
        ButtonSegment(
          value: false,
          label: Text('English'),
          icon: Text('🇺🇸', style: TextStyle(fontSize: 18)),
        ),
      ],
      selected: {isKorean},
      onSelectionChanged: (Set<bool> selected) {
        final isKo = selected.first;
        ref.read(languageProvider.notifier).setLocale(
            isKo ? const Locale('ko') : const Locale('en'));
        // Note: Language change won't take effect until integrated with app.dart
      },
    );
  }
}
