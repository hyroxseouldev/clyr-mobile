// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_usecase_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(orderUseCases)
final orderUseCasesProvider = OrderUseCasesProvider._();

final class OrderUseCasesProvider
    extends $FunctionalProvider<OrderUseCases, OrderUseCases, OrderUseCases>
    with $Provider<OrderUseCases> {
  OrderUseCasesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'orderUseCasesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$orderUseCasesHash();

  @$internal
  @override
  $ProviderElement<OrderUseCases> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  OrderUseCases create(Ref ref) {
    return orderUseCases(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(OrderUseCases value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<OrderUseCases>(value),
    );
  }
}

String _$orderUseCasesHash() => r'f1bb822c3a4b1d3cba76e9e660085df8ed976615';
