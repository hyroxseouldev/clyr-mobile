import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:clyr_mobile/src/core/pagination/paginated_list_view.dart';

/// 공통으로 사용할 페이지네이션 기능을 담은 베이스 클래스
/// T: 데이터 엔티티 타입
abstract class PaginatedNotifier<T> {
  // 상태 조작을 위해 state와 ref에 접근 가능해야 함
  AsyncValue<PaginatedData<T>> get state;
  set state(AsyncValue<PaginatedData<T>> value);

  int _currentPage = 0;
  bool _hasMore = true;
  int get pageSize => 20;

  /// 하위 클래스에서 실제 API 호출 로직만 구현
  Future<List<T>> fetchData({required int page, required int limit});

  /// 공통 build 로직
  Future<PaginatedData<T>> buildPagination() async {
    _currentPage = 0;
    _hasMore = true;
    return await _fetchInternal(page: 0);
  }

  /// 공통 다음 페이지 로드
  Future<void> loadNextPage() async {
    final current = state.value;
    if (current == null || !_hasMore || state.isLoading) return;

    // 현재 상태를 유지하면서 로딩 표시만 하고 싶다면 .copy() 등을 활용
    state = await AsyncValue.guard(() async {
      final nextItems = await fetchData(
        page: _currentPage + 1,
        limit: pageSize,
      );
      _currentPage++;
      _hasMore = nextItems.length >= pageSize;

      return PaginatedData<T>(
        items: [...current.items, ...nextItems],
        hasMore: _hasMore,
        isLoading: false,
      );
    });
  }

  Future<PaginatedData<T>> _fetchInternal({required int page}) async {
    final items = await fetchData(page: page, limit: pageSize);
    _currentPage = page;
    _hasMore = items.length >= pageSize;
    return PaginatedData<T>(items: items, hasMore: _hasMore, isLoading: false);
  }
}
