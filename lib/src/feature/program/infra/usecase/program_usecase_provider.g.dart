// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'program_usecase_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provides GetProgramsUseCase

@ProviderFor(getProgramsUseCase)
final getProgramsUseCaseProvider = GetProgramsUseCaseProvider._();

/// Provides GetProgramsUseCase

final class GetProgramsUseCaseProvider
    extends
        $FunctionalProvider<
          GetProgramsUseCase,
          GetProgramsUseCase,
          GetProgramsUseCase
        >
    with $Provider<GetProgramsUseCase> {
  /// Provides GetProgramsUseCase
  GetProgramsUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getProgramsUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getProgramsUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetProgramsUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetProgramsUseCase create(Ref ref) {
    return getProgramsUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetProgramsUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetProgramsUseCase>(value),
    );
  }
}

String _$getProgramsUseCaseHash() =>
    r'54df9432c2e162332a2a2404dc7e30ccd96bfd90';

/// Provides GetProgramDetailUseCase

@ProviderFor(getProgramDetailUseCase)
final getProgramDetailUseCaseProvider = GetProgramDetailUseCaseProvider._();

/// Provides GetProgramDetailUseCase

final class GetProgramDetailUseCaseProvider
    extends
        $FunctionalProvider<
          GetProgramDetailUseCase,
          GetProgramDetailUseCase,
          GetProgramDetailUseCase
        >
    with $Provider<GetProgramDetailUseCase> {
  /// Provides GetProgramDetailUseCase
  GetProgramDetailUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getProgramDetailUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getProgramDetailUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetProgramDetailUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetProgramDetailUseCase create(Ref ref) {
    return getProgramDetailUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetProgramDetailUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetProgramDetailUseCase>(value),
    );
  }
}

String _$getProgramDetailUseCaseHash() =>
    r'c18b4db3aa38f2446cb5e0a2b7699b7e21eb2e24';
