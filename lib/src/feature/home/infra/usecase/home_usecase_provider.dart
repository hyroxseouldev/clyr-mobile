import 'package:clyr_mobile/src/feature/home/data/repository/home_repository_provider.dart';
import 'package:clyr_mobile/src/feature/home/infra/usecase/get_active_program_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_usecase_provider.g.dart';

/// 홈 UseCase 프로바이더
@riverpod
GetActiveProgramUseCase getActiveProgramUseCase(Ref ref) {
  return GetActiveProgramUseCase(ref.watch(homeRepositoryProvider));
}
