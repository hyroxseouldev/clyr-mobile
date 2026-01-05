import 'package:clyr_mobile/src/feature/settings/data/repository/setting_repository.dart';
import 'package:clyr_mobile/src/feature/settings/infra/usecase/get_enrollments_usecase.dart';
import 'package:clyr_mobile/src/feature/settings/infra/usecase/get_orders_usecase.dart';

class SettingUseCases {
  final GetOrdersUseCase getOrders;
  final GetEnrollmentsUseCase getEnrollments;

  SettingUseCases({required this.getOrders, required this.getEnrollments});

  factory SettingUseCases.fromRepository(SettingRepository repository) {
    return SettingUseCases(
      getOrders: GetOrdersUseCase(repository),
      getEnrollments: GetEnrollmentsUseCase(repository),
    );
  }
}
