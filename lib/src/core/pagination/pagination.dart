/// Pagination 패키지 - 간단 버전
///
/// 복잡한 제너릭 없이 단순한 데이터 전달 방식
///
/// 사용 예시:
/// ```dart
/// // 1. Controller에서 상태 관리
/// @riverpod
/// class MyController extends _$MyController {
///   @override
///   FutureOr<PaginatedData<MyItem>> build() async {
///     return await fetchItems(page: 1);
///   }
///
///   Future<void> loadNext() async {
///     final current = state;
///     if (current.hasMore && !current.isLoading) {
///       state = current.copyWith(isLoading: true);
///       final next = await fetchItems(page: currentPage + 1);
///       state = PaginatedData(
///         items: [...current.items, ...next.items],
///         hasMore: next.hasMore,
///       );
///     }
///   }
/// }
///
/// // 2. UI에서 사용
/// PaginatedListView<MyItem>(
///   items: data.items,
///   hasMore: data.hasMore,
///   isLoading: data.isLoading,
///   onLoadMore: () => ref.read(controller.notifier).loadNext(),
///   itemBuilder: (context, item, index) => MyItemCard(item: item),
/// )
/// ```
library;

export 'paginated_list_view.dart';
