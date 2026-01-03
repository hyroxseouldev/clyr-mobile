// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(OrderController)
final orderControllerProvider = OrderControllerProvider._();

final class OrderControllerProvider
    extends $AsyncNotifierProvider<OrderController, List<OrderEntity>> {
  OrderControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'orderControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$orderControllerHash();

  @$internal
  @override
  OrderController create() => OrderController();
}

String _$orderControllerHash() => r'c73ef467804d526fb596cc35e3214d97bd698001';

abstract class _$OrderController extends $AsyncNotifier<List<OrderEntity>> {
  FutureOr<List<OrderEntity>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<OrderEntity>>, List<OrderEntity>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<OrderEntity>>, List<OrderEntity>>,
              AsyncValue<List<OrderEntity>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
