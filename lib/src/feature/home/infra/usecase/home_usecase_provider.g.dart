// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_usecase_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 홈 UseCase 프로바이더

@ProviderFor(getActiveProgramUseCase)
final getActiveProgramUseCaseProvider = GetActiveProgramUseCaseProvider._();

/// 홈 UseCase 프로바이더

final class GetActiveProgramUseCaseProvider
    extends
        $FunctionalProvider<
          GetActiveProgramUseCase,
          GetActiveProgramUseCase,
          GetActiveProgramUseCase
        >
    with $Provider<GetActiveProgramUseCase> {
  /// 홈 UseCase 프로바이더
  GetActiveProgramUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getActiveProgramUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getActiveProgramUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetActiveProgramUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetActiveProgramUseCase create(Ref ref) {
    return getActiveProgramUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetActiveProgramUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetActiveProgramUseCase>(value),
    );
  }
}

String _$getActiveProgramUseCaseHash() =>
    r'cda90562ffcd609497e8f3f5e15823b99bdcba2d';
