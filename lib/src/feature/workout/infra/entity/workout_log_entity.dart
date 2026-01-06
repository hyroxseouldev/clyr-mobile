import 'package:clyr_mobile/src/feature/workout/data/dto/workout_log_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'workout_log_entity.freezed.dart';

/// 운동 강도
enum WorkoutIntensity {
  low,
  medium,
  high;

  String get value => toUpperCase();

  String toUpperCase() {
    return name.toUpperCase();
  }

  static WorkoutIntensity fromString(String value) {
    return WorkoutIntensity.values.firstWhere(
      (e) => e.name.toUpperCase() == value.toUpperCase(),
      orElse: () => WorkoutIntensity.medium,
    );
  }
}

/// 운동 로그 엔티티
@freezed
abstract class WorkoutLogEntity with _$WorkoutLogEntity {
  const factory WorkoutLogEntity({
    required String id,
    required String userId,
    required String title,
    required DateTime logDate,
    required Map<String, dynamic> content,
    required WorkoutIntensity intensity,
    String? programId,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _WorkoutLogEntity;

  factory WorkoutLogEntity.fromDto(WorkoutLogDto dto) {
    return WorkoutLogEntity(
      id: dto.id,
      userId: dto.userId,
      title: dto.title,
      logDate: dto.logDate,
      content: dto.content,
      intensity: WorkoutIntensity.fromString(dto.intensity),
      programId: dto.programId,
      createdAt: dto.createdAt,
      updatedAt: dto.updatedAt,
    );
  }
}
