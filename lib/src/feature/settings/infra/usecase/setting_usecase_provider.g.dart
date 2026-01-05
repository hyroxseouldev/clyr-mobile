// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_usecase_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(settingUseCases)
final settingUseCasesProvider = SettingUseCasesProvider._();

final class SettingUseCasesProvider
    extends
        $FunctionalProvider<SettingUseCases, SettingUseCases, SettingUseCases>
    with $Provider<SettingUseCases> {
  SettingUseCasesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'settingUseCasesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$settingUseCasesHash();

  @$internal
  @override
  $ProviderElement<SettingUseCases> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SettingUseCases create(Ref ref) {
    return settingUseCases(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SettingUseCases value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SettingUseCases>(value),
    );
  }
}

String _$settingUseCasesHash() => r'728f915f8f2adc49756e73caf40d99bd99a6527d';
