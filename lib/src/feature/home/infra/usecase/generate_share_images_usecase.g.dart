// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_share_images_usecase.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Generate share images use case provider

@ProviderFor(generateShareImagesUseCase)
final generateShareImagesUseCaseProvider =
    GenerateShareImagesUseCaseProvider._();

/// Generate share images use case provider

final class GenerateShareImagesUseCaseProvider
    extends
        $FunctionalProvider<
          GenerateShareImagesUseCase,
          GenerateShareImagesUseCase,
          GenerateShareImagesUseCase
        >
    with $Provider<GenerateShareImagesUseCase> {
  /// Generate share images use case provider
  GenerateShareImagesUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'generateShareImagesUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$generateShareImagesUseCaseHash();

  @$internal
  @override
  $ProviderElement<GenerateShareImagesUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GenerateShareImagesUseCase create(Ref ref) {
    return generateShareImagesUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GenerateShareImagesUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GenerateShareImagesUseCase>(value),
    );
  }
}

String _$generateShareImagesUseCaseHash() =>
    r'064e6cdc56ba160fdded7cd705747512177790c1';
