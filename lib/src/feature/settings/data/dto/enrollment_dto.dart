import 'package:json_annotation/json_annotation.dart';
import 'package:clyr_mobile/src/feature/settings/infra/entity/enrollment_entity.dart';

part 'enrollment_dto.g.dart';

@JsonSerializable()
class EnrollmentDto {
  final String id;
  @JsonKey(name: 'user_id')
  final String userId;
  @JsonKey(name: 'program_id')
  final String programId;
  @JsonKey(name: 'start_date')
  final DateTime startDate;
  final String status;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  EnrollmentDto({
    required this.id,
    required this.userId,
    required this.programId,
    required this.startDate,
    required this.status,
    required this.createdAt,
  });

  factory EnrollmentDto.fromJson(Map<String, dynamic> json) =>
      _$EnrollmentDtoFromJson(json);

  Map<String, dynamic> toJson() => _$EnrollmentDtoToJson(this);

  EnrollmentEntity toEntity() => EnrollmentEntity.fromDto(this);
}
