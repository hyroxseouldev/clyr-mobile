import 'package:json_annotation/json_annotation.dart';
import 'package:clyr_mobile/src/feature/workout/infra/entity/workout_entity.dart';

part 'workout_dto.g.dart';

@JsonSerializable()
class WorkoutDto {
  final String id;
  final String name;
  final String description;
  final int duration; // minutes
  final int calories;
  final DateTime createdAt;

  WorkoutDto({
    required this.id,
    required this.name,
    required this.description,
    required this.duration,
    required this.calories,
    required this.createdAt,
  });

  factory WorkoutDto.fromJson(Map<String, dynamic> json) =>
      _$WorkoutDtoFromJson(json);
  Map<String, dynamic> toJson() => _$WorkoutDtoToJson(this);

  WorkoutEntity toEntity() => WorkoutEntity.fromDto(this);
}
