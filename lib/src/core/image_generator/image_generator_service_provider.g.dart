// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_generator_service_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Image generator service provider

@ProviderFor(imageGeneratorService)
final imageGeneratorServiceProvider = ImageGeneratorServiceProvider._();

/// Image generator service provider

final class ImageGeneratorServiceProvider
    extends
        $FunctionalProvider<
          ImageGeneratorService,
          ImageGeneratorService,
          ImageGeneratorService
        >
    with $Provider<ImageGeneratorService> {
  /// Image generator service provider
  ImageGeneratorServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'imageGeneratorServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$imageGeneratorServiceHash();

  @$internal
  @override
  $ProviderElement<ImageGeneratorService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ImageGeneratorService create(Ref ref) {
    return imageGeneratorService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ImageGeneratorService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ImageGeneratorService>(value),
    );
  }
}

String _$imageGeneratorServiceHash() =>
    r'60dabdf86476ac69f5f1d3b83b87734763523b11';
