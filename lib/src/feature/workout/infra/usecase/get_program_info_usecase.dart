import 'package:clyr_mobile/src/core/exception/exception.dart';
import 'package:clyr_mobile/src/core/typedef/typedef.dart';
import 'package:clyr_mobile/src/core/usecase/usecase.dart';
import 'package:clyr_mobile/src/feature/workout/infra/entity/workout_entity.dart';
import 'package:clyr_mobile/src/feature/workout/data/repository/workout_repository.dart';

/// 프로그램 정보 조회 파라미터
typedef GetProgramInfoParams = ({int page, int limit});

class GetProgramInfoUseCase
    implements Usecase<GetProgramInfoParams, List<ProgramEntity>> {
  final WorkoutRepository _repository;

  GetProgramInfoUseCase(this._repository);

  @override
  FutureEither<AppException, List<ProgramEntity>> call(
      GetProgramInfoParams params) async {
    return await _repository.getProgramInfo(
      page: params.page,
      limit: params.limit,
    );
  }
}
