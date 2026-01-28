import 'package:clyr_mobile/src/core/data/dto.dart';
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

  static EnrollmentStatus fromString(String? value) {
    if (value == null) return EnrollmentStatus.inactive;
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
    String? orderId,
    DateTime? endDate,
    DateTime? updatedAt,
  }) = _EnrollmentEntity;

  factory EnrollmentEntity.fromDto(EnrollmentsDto dto) {
    return EnrollmentEntity(
      id: dto.id,
      userId: dto.userId,
      programId: dto.programId,
      startDate: dto.startDate ?? DateTime.now(),
      status: EnrollmentStatus.fromString(dto.status),
      createdAt: dto.createdAt,
      orderId: dto.orderId,
      endDate: dto.endDate,
      updatedAt: dto.updatedAt,
    );
  }
}
