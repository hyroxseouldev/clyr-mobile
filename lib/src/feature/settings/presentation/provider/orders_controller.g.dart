// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 주문 목록 컨트롤러
///
/// 페이지네이션을 지원하는 주문 목록 조회

@ProviderFor(OrdersController)
final ordersControllerProvider = OrdersControllerProvider._();

/// 주문 목록 컨트롤러
///
/// 페이지네이션을 지원하는 주문 목록 조회
final class OrdersControllerProvider
    extends
        $AsyncNotifierProvider<OrdersController, PaginatedData<OrderEntity>> {
  /// 주문 목록 컨트롤러
  ///
  /// 페이지네이션을 지원하는 주문 목록 조회
  OrdersControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ordersControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ordersControllerHash();

  @$internal
  @override
  OrdersController create() => OrdersController();
}

String _$ordersControllerHash() => r'cac8c310efbe02de917fbe1102ce0d259a8c6fc7';

/// 주문 목록 컨트롤러
///
/// 페이지네이션을 지원하는 주문 목록 조회

abstract class _$OrdersController
    extends $AsyncNotifier<PaginatedData<OrderEntity>> {
  FutureOr<PaginatedData<OrderEntity>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<PaginatedData<OrderEntity>>,
              PaginatedData<OrderEntity>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<PaginatedData<OrderEntity>>,
                PaginatedData<OrderEntity>
              >,
              AsyncValue<PaginatedData<OrderEntity>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
