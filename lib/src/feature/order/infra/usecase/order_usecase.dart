import 'package:clyr_mobile/src/core/exception/exception.dart';
import 'package:clyr_mobile/src/core/typedef/typedef.dart';
import 'package:clyr_mobile/src/core/usecase/usecase.dart';
import 'package:clyr_mobile/src/feature/order/data/repository/order_repository.dart';
import 'package:clyr_mobile/src/feature/order/infra/entity/order_entity.dart';

typedef GetOrdersParams = void;
typedef CreateOrderParams = ({
  String productName,
  int quantity,
  int totalPrice,
});

class GetOrdersUseCase implements Usecase<GetOrdersParams, List<OrderEntity>> {
  final OrderRepository _repository;
  GetOrdersUseCase(this._repository);

  @override
  FutureEither<AppException, List<OrderEntity>> call(GetOrdersParams input) {
    return _repository.getOrders();
  }
}

class OrderUseCases {
  final GetOrdersUseCase getOrders;

  OrderUseCases({required this.getOrders});

  factory OrderUseCases.fromRepository(OrderRepository repository) {
    return OrderUseCases(getOrders: GetOrdersUseCase(repository));
  }
}
