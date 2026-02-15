import 'package:clyr_mobile/src/core/util/type_defs.dart';
import 'package:clyr_mobile/src/feature/home/data/repository/home_repository.dart';
import 'package:flutter/foundation.dart';

class SyncConnectedDeviceWorkoutsUseCase {
  const SyncConnectedDeviceWorkoutsUseCase({required HomeRepository repository})
    : _repository = repository;

  final HomeRepository _repository;

  FutureEither<int> call() async {
    debugPrint('🔄 [SyncConnectedDeviceWorkoutsUseCase] Triggered');
    return _repository.syncConnectedDeviceWorkouts();
  }
}
