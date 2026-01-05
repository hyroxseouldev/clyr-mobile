import 'package:clyr_mobile/src/core/exception/exception.dart';
import 'package:clyr_mobile/src/core/typedef/typedef.dart';
import 'package:clyr_mobile/src/core/usecase/usecase.dart';
import 'package:clyr_mobile/src/feature/workout/infra/entity/workout_entity.dart';
import 'package:clyr_mobile/src/feature/workout/data/repository/workout_repository.dart';

class GetProgramInfoUseCase implements Usecase<NoParams, List<ProgramEntity>> {
  final WorkoutRepository _repository;

  GetProgramInfoUseCase(this._repository);

  @override
  FutureEither<AppException, List<ProgramEntity>> call(NoParams params) async {
    return await _repository.getProgramInfo();
  }
}
