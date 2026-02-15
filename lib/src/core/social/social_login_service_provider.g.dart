// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_login_service_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(socialLoginService)
final socialLoginServiceProvider = SocialLoginServiceProvider._();

final class SocialLoginServiceProvider
    extends
        $FunctionalProvider<
          SocialLoginService,
          SocialLoginService,
          SocialLoginService
        >
    with $Provider<SocialLoginService> {
  SocialLoginServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'socialLoginServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$socialLoginServiceHash();

  @$internal
  @override
  $ProviderElement<SocialLoginService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SocialLoginService create(Ref ref) {
    return socialLoginService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SocialLoginService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SocialLoginService>(value),
    );
  }
}

String _$socialLoginServiceHash() =>
    r'65b675480d8547c99014c09e24225f4efb4f643a';
