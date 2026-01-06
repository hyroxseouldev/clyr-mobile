import 'package:json_annotation/json_annotation.dart';
import 'package:clyr_mobile/src/feature/workout/infra/entity/workout_log_entity.dart';

part 'workout_log_dto.g.dart';

@JsonSerializable()
class WorkoutLogDto {
  final String id;
  @JsonKey(name: 'user_id')
  final String userId;
  final String title;
  @JsonKey(name: 'log_date')
  final DateTime logDate;
  final Map<String, dynamic> content;
  final String intensity;
  @JsonKey(name: 'program_id')
  final String? programId;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  WorkoutLogDto({
    required this.id,
    required this.userId,
    required this.title,
    required this.logDate,
    required this.content,
    required this.intensity,
    this.programId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory WorkoutLogDto.fromJson(Map<String, dynamic> json) =>
      _$WorkoutLogDtoFromJson(json);

  Map<String, dynamic> toJson() => _$WorkoutLogDtoToJson(this);

  WorkoutLogEntity toEntity() {
    return WorkoutLogEntity(
      id: id,
      userId: userId,
      title: title,
      logDate: logDate,
      content: content,
      intensity: WorkoutIntensity.fromString(intensity),
      programId: programId,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  factory WorkoutLogDto.fromEntity(WorkoutLogEntity entity) {
    return WorkoutLogDto(
      id: entity.id,
      userId: entity.userId,
      title: entity.title,
      logDate: entity.logDate,
      content: entity.content,
      intensity: entity.intensity.value,
      programId: entity.programId,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }
}
