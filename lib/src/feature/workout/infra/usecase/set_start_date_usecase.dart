import 'package:clyr_mobile/src/core/exception/exception.dart';
import 'package:clyr_mobile/src/core/typedef/typedef.dart';
import 'package:clyr_mobile/src/core/usecase/usecase.dart';
import 'package:clyr_mobile/src/feature/workout/data/repository/workout_repository.dart';

class SetStartDateUseCase implements Usecase<SetStartDateParams, void> {
  final WorkoutRepository _repository;

  SetStartDateUseCase(this._repository);

  @override
  FutureEither<AppException, void> call(SetStartDateParams input) {
    return _repository.setStartDate(input.date);
  }
}

/// SetStartDateUseCase 파라미터
typedef SetStartDateParams = ({DateTime date});
