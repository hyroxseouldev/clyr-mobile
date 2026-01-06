import 'package:clyr_mobile/src/feature/workout/data/repository/workoutlog_repository.dart';
import 'package:clyr_mobile/src/feature/workout/infra/usecase/workout_log_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'workout_log_usecase_provider.g.dart';

@riverpod
WorkoutLogUseCases workoutLogUseCases(Ref ref) {
  final repository = ref.read(workoutLogRepositoryProvider);
  return WorkoutLogUseCases.fromRepository(repository);
}
