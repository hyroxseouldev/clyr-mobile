import 'package:clyr_mobile/src/core/pagination/paginated_list_view.dart';
import 'package:clyr_mobile/src/feature/settings/infra/entity/order_entity.dart';
import 'package:clyr_mobile/src/feature/settings/presentation/provider/orders_controller.dart';
import 'package:clyr_mobile/src/feature/settings/presentation/widget/order_card.dart';
import 'package:clyr_mobile/src/shared/async_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PurchaseHistoryView extends ConsumerWidget {
  const PurchaseHistoryView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ordersState = ref.watch(ordersControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('구매내역')),
      body: AsyncWidget<PaginatedData<OrderEntity>>(
        data: ordersState,
        builder: (data) {
          return PaginatedListView<OrderEntity>(
            items: data.items,
            hasMore: data.hasMore,
            isLoading: data.isLoading,
            onLoadMore: () =>
                ref.read(ordersControllerProvider.notifier).loadNext(),
            onRefresh: () =>
                ref.read(ordersControllerProvider.notifier).refresh(),
            padding: const EdgeInsets.all(16),
            emptyWidget: _buildEmptyWidget(context),
            itemBuilder: (context, order, index) => OrderCard.fromEntity(order),
          );
        },
      ),
    );
  }

  Widget _buildEmptyWidget(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.receipt_long_outlined,
            size: 64,
            color: Colors.grey.shade400,
          ),
          const SizedBox(height: 16),
          Text(
            '구매내역이 없습니다',
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }
}
