import 'package:clyr_mobile/src/feature/workout/data/dto/workout_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'workout_entity.freezed.dart';

@freezed
abstract class WorkoutEntity with _$WorkoutEntity {
  const factory WorkoutEntity({
    required String id,
    required String name,
    required String description,
    required int duration,
    required int calories,
    required DateTime createdAt,
  }) = _WorkoutEntity;

  factory WorkoutEntity.fromDto(WorkoutDto dto) {
    return WorkoutEntity(
      id: dto.id,
      name: dto.name,
      description: dto.description,
      duration: dto.duration,
      calories: dto.calories,
      createdAt: dto.createdAt,
    );
  }
}
