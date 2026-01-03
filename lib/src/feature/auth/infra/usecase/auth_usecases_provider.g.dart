// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_usecases_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(authUseCases)
final authUseCasesProvider = AuthUseCasesProvider._();

final class AuthUseCasesProvider
    extends $FunctionalProvider<AuthUseCases, AuthUseCases, AuthUseCases>
    with $Provider<AuthUseCases> {
  AuthUseCasesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authUseCasesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authUseCasesHash();

  @$internal
  @override
  $ProviderElement<AuthUseCases> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AuthUseCases create(Ref ref) {
    return authUseCases(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthUseCases value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthUseCases>(value),
    );
  }
}

String _$authUseCasesHash() => r'd6fc4ebdafb2d5695b5f25ea023f33d3bd48514d';
