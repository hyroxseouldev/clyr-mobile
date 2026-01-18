import 'package:clyr_mobile/src/feature/home/data/repository/home_repository_provider.dart';
import 'package:clyr_mobile/src/feature/home/infra/usecase/get_active_program_usecase.dart';
import 'package:clyr_mobile/src/feature/home/infra/usecase/get_blueprint_sections_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_usecase_provider.g.dart';

/// 홈 UseCase 프로바이더
@riverpod
GetActiveProgramUseCase getActiveProgramUseCase(Ref ref) {
  return GetActiveProgramUseCase(ref.watch(homeRepositoryProvider));
}

/// Blueprint 섹션 조회 UseCase 프로바이더
@riverpod
GetBlueprintSectionsUseCase getBlueprintSectionsUseCase(Ref ref) {
  return GetBlueprintSectionsUseCase(ref.watch(homeRepositoryProvider));
}
