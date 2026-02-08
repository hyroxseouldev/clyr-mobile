import 'package:clyr_mobile/src/core/util/type_defs.dart';
import 'package:clyr_mobile/src/core/usecase/usecase.dart';
import 'package:clyr_mobile/src/feature/settings/infra/repository/setting_repository.dart';
import 'package:clyr_mobile/src/feature/settings/infra/entity/order_entity.dart';

class GetOrdersUseCase implements Usecase<GetOrdersParams, List<OrderEntity>> {
  final SettingRepository _repository;

  GetOrdersUseCase(this._repository);

  @override
  FutureEither<List<OrderEntity>> call(
    GetOrdersParams input,
  ) async {
    return await _repository.getOrders(input);
  }
}
