import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// 페이지네이션 데이터 모델
class PaginatedData<T> {
  final List<T> items;
  final bool hasMore;
  final bool isLoading;
  final Object? error;

  const PaginatedData({
    required this.items,
    required this.hasMore,
    this.isLoading = false,
    this.error,
  });

  PaginatedData<T> copyWith({
    List<T>? items,
    bool? hasMore,
    bool? isLoading,
    Object? error,
  }) {
    return PaginatedData<T>(
      items: items ?? this.items,
      hasMore: hasMore ?? this.hasMore,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

/// 페이지네이션 리스트 위젯
///
/// 사용 예시:
/// ```dart
/// PaginatedListView<Item>(
///   items: data.items,
///   hasMore: data.hasMore,
///   isLoading: data.isLoading,
///   onLoadMore: () => ref.read(provider.notifier).loadNext(),
///   onRefresh: () => ref.read(provider.notifier).refresh(),
///   itemBuilder: (context, item, index) => ItemCard(item: item),
/// )
/// ```
class PaginatedListView<T> extends HookWidget {
  final List<T> items;
  final bool hasMore;
  final bool isLoading;
  final Object? error;
  final VoidCallback onLoadMore;
  final Future<void> Function()? onRefresh;
  final Widget Function(BuildContext context, T item, int index) itemBuilder;
  final Widget Function(BuildContext context, int index)? separatorBuilder;
  final Widget Function(BuildContext context)? headerBuilder;
  final Widget? loadingWidget;
  final Widget? loadingMoreWidget;
  final Widget Function(Object error)? errorBuilder;
  final Widget? emptyWidget;
  final ScrollPhysics? physics;
  final EdgeInsets? padding;

  const PaginatedListView({
    super.key,
    required this.items,
    required this.hasMore,
    required this.isLoading,
    required this.onLoadMore,
    this.onRefresh,
    required this.itemBuilder,
    this.error,
    this.separatorBuilder,
    this.headerBuilder,
    this.loadingWidget,
    this.loadingMoreWidget,
    this.errorBuilder,
    this.emptyWidget,
    this.physics,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();
    final isLoadingMore = useState(false);

    // 스크롤 감지
    useEffect(() {
      void listener() {
        if (!hasMore || isLoading || isLoadingMore.value) return;

        final maxScroll = scrollController.position.maxScrollExtent;
        final currentScroll = scrollController.position.pixels;
        final threshold = maxScroll * 0.8;

        if (currentScroll >= threshold) {
          isLoadingMore.value = true;
          onLoadMore();
          // isLoadingMore는 외부에서 관리
        }
      }

      scrollController.addListener(listener);
      return () => scrollController.removeListener(listener);
    }, [hasMore, isLoading, items.length]);

    // 에러 상태
    if (error != null && items.isEmpty) {
      return errorBuilder?.call(error as Object) ??
          _defaultErrorBuilder(context, error as Object);
    }

    // 초기 로딩
    if (items.isEmpty && isLoading) {
      return loadingWidget ?? _defaultLoadingWidget(context);
    }

    // 빈 상태
    if (items.isEmpty && !isLoading) {
      final empty = emptyWidget ?? _defaultEmptyWidget(context);
      // 빈 상태에서도 refresh 가능하도록
      return onRefresh != null
          ? RefreshIndicator(
              onRefresh: onRefresh ?? () async => onLoadMore(),
              child: ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [empty],
              ),
            )
          : empty;
    }

    // 데이터 표시
    return RefreshIndicator(
      onRefresh: onRefresh ?? () async => onLoadMore(),
      child: ListView.separated(
        controller: scrollController,
        physics: physics ?? const AlwaysScrollableScrollPhysics(),
        padding: padding,
        itemCount:
            items.length + (hasMore ? 1 : 0) + (headerBuilder != null ? 1 : 0),
        separatorBuilder: (context, index) {
          if (separatorBuilder == null) return const SizedBox.shrink();

          if (headerBuilder != null && index == 0)
            return const SizedBox.shrink();

          final actualIndex = index - (headerBuilder != null ? 1 : 0);
          if (hasMore && actualIndex == items.length - 1) {
            return const SizedBox.shrink();
          }

          return separatorBuilder!(context, actualIndex);
        },
        itemBuilder: (context, index) {
          // 헤더
          if (headerBuilder != null && index == 0) {
            return headerBuilder!(context);
          }

          final adjustedIndex = index - (headerBuilder != null ? 1 : 0);

          // 로딩 더
          if (adjustedIndex >= items.length) {
            return loadingMoreWidget ??
                _defaultLoadingMoreWidget(context, hasMore);
          }

          // 데이터 아이템
          return itemBuilder(context, items[adjustedIndex], adjustedIndex);
        },
      ),
    );
  }

  Widget _defaultLoadingWidget(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _defaultLoadingMoreWidget(BuildContext context, bool hasMore) {
    if (!hasMore) return const SizedBox.shrink();

    return const Padding(
      padding: EdgeInsets.all(16),
      child: Center(child: CircularProgressIndicator()),
    );
  }

  Widget _defaultErrorBuilder(BuildContext context, Object error) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 48, color: Colors.red),
            const SizedBox(height: 16),
            Text('오류가 발생했습니다', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Text(
              error.toString(),
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _defaultEmptyWidget(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.inbox_outlined, size: 64, color: Colors.grey[400]),
          const SizedBox(height: 16),
          Text(
            '데이터가 없습니다',
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}
