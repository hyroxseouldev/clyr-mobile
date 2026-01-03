import 'package:clyr_mobile/src/feature/order/data/repository/order_repository.dart';
import 'package:clyr_mobile/src/feature/order/infra/usecase/order_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'order_usecase_provider.g.dart';

@riverpod
OrderUseCases orderUseCases(Ref ref) {
  final repository = ref.watch(orderRepositoryProvider);
  return OrderUseCases.fromRepository(repository);
}
