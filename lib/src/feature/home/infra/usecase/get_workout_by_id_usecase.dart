import 'package:clyr_mobile/src/core/health/entity/health_workout_data.dart';
import 'package:clyr_mobile/src/core/usecase/usecase.dart';
import 'package:clyr_mobile/src/core/util/type_defs.dart';
import 'package:clyr_mobile/src/feature/home/data/repository/home_repository.dart';

class GetWorkoutByIdUseCase implements Usecase<GetWorkoutByIdParams, HealthWorkoutData?> {
  final HomeRepository _repository;

  const GetWorkoutByIdUseCase(this._repository);

  @override
  FutureEither<HealthWorkoutData?> call(GetWorkoutByIdParams params) {
    return _repository.getWorkoutById(params.id);
  }
}

class GetWorkoutByIdParams {
  final String id;
  const GetWorkoutByIdParams({required this.id});
}
