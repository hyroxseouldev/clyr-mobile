import 'package:clyr_mobile/src/feature/settings/infra/repository/setting_repository.dart';
import 'package:clyr_mobile/src/feature/settings/infra/usecase/setting_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'setting_usecase_provider.g.dart';

@riverpod
SettingUseCases settingUseCases(Ref ref) {
  final repository = ref.read(settingRepositoryProvider);
  return SettingUseCases.fromRepository(repository);
}
