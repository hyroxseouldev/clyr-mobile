import 'package:clyr_mobile/src/feature/home/infra/usecase/home_usecase_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'startup_health_sync_provider.g.dart';

@riverpod
Future<int> startupHealthSync(Ref ref) async {
  final useCase = ref.watch(syncConnectedDeviceWorkoutsUseCaseProvider);
  final result = await useCase();

  return result.fold(
    (error) => throw Exception(error.message),
    (count) => count,
  );
}
