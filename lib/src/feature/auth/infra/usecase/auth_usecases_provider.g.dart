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

@ProviderFor(checkOnboardingUseCase)
final checkOnboardingUseCaseProvider = CheckOnboardingUseCaseProvider._();

final class CheckOnboardingUseCaseProvider
    extends
        $FunctionalProvider<
          CheckOnboardingUseCase,
          CheckOnboardingUseCase,
          CheckOnboardingUseCase
        >
    with $Provider<CheckOnboardingUseCase> {
  CheckOnboardingUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'checkOnboardingUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$checkOnboardingUseCaseHash();

  @$internal
  @override
  $ProviderElement<CheckOnboardingUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CheckOnboardingUseCase create(Ref ref) {
    return checkOnboardingUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CheckOnboardingUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CheckOnboardingUseCase>(value),
    );
  }
}

String _$checkOnboardingUseCaseHash() =>
    r'1bbd304b8b5933a645c4170828e3bcec86e5d75c';

@ProviderFor(completeOnboardingUseCase)
final completeOnboardingUseCaseProvider = CompleteOnboardingUseCaseProvider._();

final class CompleteOnboardingUseCaseProvider
    extends
        $FunctionalProvider<
          CompleteOnboardingUseCase,
          CompleteOnboardingUseCase,
          CompleteOnboardingUseCase
        >
    with $Provider<CompleteOnboardingUseCase> {
  CompleteOnboardingUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'completeOnboardingUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$completeOnboardingUseCaseHash();

  @$internal
  @override
  $ProviderElement<CompleteOnboardingUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CompleteOnboardingUseCase create(Ref ref) {
    return completeOnboardingUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CompleteOnboardingUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CompleteOnboardingUseCase>(value),
    );
  }
}

String _$completeOnboardingUseCaseHash() =>
    r'6924f2c82b5bb236e84f71f9128f282920891b4a';
