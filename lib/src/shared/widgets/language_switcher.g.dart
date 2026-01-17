// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_switcher.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Language provider for managing app language state
/// Note: This provider is standalone and NOT integrated with app.dart yet
/// User will integrate language switching functionality later

@ProviderFor(Language)
final languageProvider = LanguageProvider._();

/// Language provider for managing app language state
/// Note: This provider is standalone and NOT integrated with app.dart yet
/// User will integrate language switching functionality later
final class LanguageProvider extends $NotifierProvider<Language, Locale> {
  /// Language provider for managing app language state
  /// Note: This provider is standalone and NOT integrated with app.dart yet
  /// User will integrate language switching functionality later
  LanguageProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'languageProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$languageHash();

  @$internal
  @override
  Language create() => Language();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Locale value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Locale>(value),
    );
  }
}

String _$languageHash() => r'3b8c6e8b1aac0f8398f83f3d9685b757b4a61a61';

/// Language provider for managing app language state
/// Note: This provider is standalone and NOT integrated with app.dart yet
/// User will integrate language switching functionality later

abstract class _$Language extends $Notifier<Locale> {
  Locale build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<Locale, Locale>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Locale, Locale>,
              Locale,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
