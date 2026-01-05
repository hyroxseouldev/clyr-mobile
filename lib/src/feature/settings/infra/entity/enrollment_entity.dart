import 'package:clyr_mobile/src/feature/settings/data/dto/enrollment_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'enrollment_entity.freezed.dart';

/// 등록 상태
enum EnrollmentStatus {
  @JsonValue('ACTIVE')
  active,
  @JsonValue('INACTIVE')
  inactive,
  @JsonValue('CANCELLED')
  cancelled,
  @JsonValue('EXPIRED')
  expired;

  String get displayName {
    return switch (this) {
      EnrollmentStatus.active => '활성',
      EnrollmentStatus.inactive => '비활성',
      EnrollmentStatus.cancelled => '취소됨',
      EnrollmentStatus.expired => '만료됨',
    };
  }

  static EnrollmentStatus fromString(String value) {
    return switch (value.toUpperCase()) {
      'ACTIVE' => EnrollmentStatus.active,
      'INACTIVE' => EnrollmentStatus.inactive,
      'CANCELLED' => EnrollmentStatus.cancelled,
      'EXPIRED' => EnrollmentStatus.expired,
      _ => throw ArgumentError('Invalid EnrollmentStatus: $value'),
    };
  }
}

/// 등록 엔티티
@freezed
abstract class EnrollmentEntity with _$EnrollmentEntity {
  const factory EnrollmentEntity({
    required String id,
    required String userId,
    required String programId,
    required DateTime startDate,
    required EnrollmentStatus status,
    required DateTime createdAt,
  }) = _EnrollmentEntity;

  factory EnrollmentEntity.fromDto(EnrollmentDto dto) {
    return EnrollmentEntity(
      id: dto.id,
      userId: dto.userId,
      programId: dto.programId,
      startDate: dto.startDate,
      status: EnrollmentStatus.fromString(dto.status),
      createdAt: dto.createdAt,
    );
  }
}
