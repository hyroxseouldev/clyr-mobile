import 'package:clyr_mobile/src/core/health/entity/health_workout_data.dart';
import 'package:clyr_mobile/src/core/share/entity/share_image_entity.dart';
import 'package:clyr_mobile/src/feature/home/data/repository/workout_share_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'workout_share_provider.g.dart';

/// Workout share provider
/// Manages state for workout sharing feature
@riverpod
class WorkoutShare extends _$WorkoutShare {
  @override
  Future<List<ShareImageEntity>> build(HealthWorkoutData workout) async {
    // Generate all 3 image versions on initialization
    final result = await ref
        .read(workoutShareRepositoryProvider)
        .generateShareImages(workout);
    return result.fold((error) => throw error, (images) => images);
  }
}
