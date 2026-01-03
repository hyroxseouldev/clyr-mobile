import 'package:clyr_mobile/src/core/exception/exception.dart';
import 'package:clyr_mobile/src/feature/order/presentation/provider/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OrderPage extends ConsumerWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ordersState = ref.watch(orderControllerProvider);

    ref.listen(orderControllerProvider, (previous, next) {
      if (next is AsyncError) {
        final error = next.error;
        if (error is AppException) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(error.displayMessage),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Order'),
      ),
      body: ordersState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, __) => const Center(child: Text('오류가 발생했습니다.')),
        data: (_) => const Center(child: Text('주문 내역')),
      ),
    );
  }
}
