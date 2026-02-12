import 'package:clyr_mobile/src/core/health/entity/health_workout_data.dart';
import 'package:clyr_mobile/src/core/share/entity/share_image_entity.dart';
import 'package:clyr_mobile/src/core/usecase/usecase.dart';
import 'package:clyr_mobile/src/core/util/type_defs.dart';
import 'package:clyr_mobile/src/feature/home/data/repository/workout_share_repository.dart';
import 'package:clyr_mobile/src/feature/home/data/repository/workout_share_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generate_share_images_usecase.g.dart';

/// Parameters for generating share images
class GenerateShareImagesParams {
  final HealthWorkoutData workout;
  final List<ShareImageStyle> styles;

  const GenerateShareImagesParams({
    required this.workout,
    this.styles = ShareImageStyle.values,
  });
}

/// Generate share images use case
/// Generates specified image versions for sharing
class GenerateShareImagesUseCase
    implements Usecase<GenerateShareImagesParams, List<ShareImageEntity>> {
  final WorkoutShareRepository _repository;

  GenerateShareImagesUseCase(this._repository);

  @override
  FutureEither<List<ShareImageEntity>> call(
    GenerateShareImagesParams input,
  ) async {
    return await _repository.generateShareImages(
      input.workout,
      styles: input.styles,
    );
  }
}

/// Generate share images use case provider
@riverpod
GenerateShareImagesUseCase generateShareImagesUseCase(Ref ref) {
  return GenerateShareImagesUseCase(ref.watch(workoutShareRepositoryProvider));
}
