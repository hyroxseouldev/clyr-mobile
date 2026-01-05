import 'package:clyr_mobile/src/core/pagination/paginated_list_view.dart';
import 'package:clyr_mobile/src/core/typedef/typedef.dart';
import 'package:clyr_mobile/src/feature/settings/infra/entity/order_entity.dart';
import 'package:clyr_mobile/src/feature/settings/infra/usecase/setting_usecase_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'orders_controller.g.dart';

/// 주문 목록 컨트롤러
///
/// 페이지네이션을 지원하는 주문 목록 조회
@riverpod
class OrdersController extends _$OrdersController {
  static const int _pageSize = 20;
  int _currentPage = 0;
  bool _hasMore = true;

  @override
  FutureOr<PaginatedData<OrderEntity>> build() async {
    _currentPage = 0;
    _hasMore = true;
    return await _fetchOrders(page: 0);
  }

  /// 다음 페이지 로드
  Future<void> loadNext() async {
    final current = state.value;
    if (current == null || !_hasMore || current.isLoading) return;

    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final nextPageData = await _fetchOrders(page: _currentPage + 1);
      return PaginatedData<OrderEntity>(
        items: [...current.items, ...nextPageData.items],
        hasMore: nextPageData.hasMore,
        isLoading: false,
      );
    });
  }

  /// 새로고침
  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      _currentPage = 0;
      _hasMore = true;
      return await _fetchOrders(page: 0);
    });
  }

  Future<PaginatedData<OrderEntity>> _fetchOrders({required int page}) async {
    final usecases = ref.read(settingUseCasesProvider);
    final result =
        await usecases.getOrders((page: page, limit: _pageSize));

    return result.fold((l) => throw l, (orders) {
      _currentPage = page;
      _hasMore = orders.length >= _pageSize;
      return PaginatedData<OrderEntity>(
        items: orders,
        hasMore: _hasMore,
        isLoading: false,
      );
    });
  }
}
