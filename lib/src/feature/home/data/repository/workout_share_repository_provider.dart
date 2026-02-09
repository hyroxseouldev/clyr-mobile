import 'package:clyr_mobile/src/core/image_generator/image_generator_service_provider.dart';
import 'package:clyr_mobile/src/core/share/share_service_provider.dart';
import 'package:clyr_mobile/src/feature/home/data/repository/workout_share_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'workout_share_repository_provider.g.dart';

/// Workout share repository provider
@riverpod
WorkoutShareRepository workoutShareRepository(Ref ref) {
  return WorkoutShareRepository(
    imageGenerator: ref.watch(imageGeneratorServiceProvider),
    shareService: ref.watch(shareServiceProvider),
  );
}
