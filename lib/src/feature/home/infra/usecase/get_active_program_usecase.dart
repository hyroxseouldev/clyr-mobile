import 'package:clyr_mobile/src/core/usecase/usecase.dart';
import 'package:clyr_mobile/src/core/util/type_defs.dart';
import 'package:clyr_mobile/src/feature/home/data/repository/home_repository.dart';
import 'package:clyr_mobile/src/feature/home/infra/entity/home_entity.dart';

/// 활성화된 프로그램 조회 UseCase
class GetActiveProgramUseCase implements Usecase<void, ActiveProgramEntity> {
  final HomeRepository _repository;

  GetActiveProgramUseCase(this._repository);

  @override
  FutureEither<ActiveProgramEntity> call(void input) {
    return _repository.getActiveProgram();
  }
}
