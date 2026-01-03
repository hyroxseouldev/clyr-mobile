import 'package:clyr_mobile/src/feature/workout/data/repository/workout_repository.dart';
import 'package:clyr_mobile/src/feature/workout/infra/usecase/workout_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'workout_usecase_provider.g.dart';

@riverpod
WorkoutUseCases workoutUseCases(Ref ref) {
  final repository = ref.read(workoutRepositoryProvider);
  return WorkoutUseCases.fromRepository(repository);
}
