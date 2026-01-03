import 'package:clyr_mobile/src/feature/order/infra/entity/order_entity.dart';
import 'package:clyr_mobile/src/feature/order/infra/usecase/order_usecase_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'order_controller.g.dart';

@riverpod
class OrderController extends _$OrderController {
  @override
  FutureOr<List<OrderEntity>> build() async {
    final usecases = ref.read(orderUseCasesProvider);
    final result = await usecases.getOrders(null);
    return result.fold((l) => throw l, (r) => r);
  }
}
