import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:clyr_mobile/src/feature/program/data/dto/program_dto.dart';

part 'program_entity.freezed.dart';

/// Program entity for UI consumption
@freezed
abstract class ProgramEntity with _$ProgramEntity {
  const factory ProgramEntity({
    required String id,
    required String coachId,
    required String title,
    required String slug,
    required String type,
    String? description,
    required bool isPublic,
    required bool isForSale,
    required num price,
    int? accessPeriodDays,
    required String difficulty,
    required int durationWeeks,
    required int daysPerWeek,
    String? programImage,
    @Default([]) List<CurriculumItemEntity> curriculum,
    CoachProfileEntity? coach,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _ProgramEntity;

  factory ProgramEntity.fromDto(ProgramWithCoachDto dto) {
    return ProgramEntity(
      id: dto.id,
      coachId: dto.coachId,
      title: dto.title,
      slug: dto.slug,
      type: dto.type,
      description: dto.description,
      isPublic: dto.isPublic,
      isForSale: dto.isForSale,
      price: dto.price,
      accessPeriodDays: dto.accessPeriodDays,
      difficulty: dto.difficulty,
      durationWeeks: dto.durationWeeks,
      daysPerWeek: dto.daysPerWeek,
      programImage: dto.mainImageList?.isNotEmpty == true
          ? dto.mainImageList!.first
          : null,
      curriculum:
          dto.curriculum?.map(CurriculumItemEntity.fromDto).toList() ?? [],
      coach: dto.coach != null ? CoachProfileEntity.fromDto(dto.coach!) : null,
      createdAt: dto.createdAt,
      updatedAt: dto.updatedAt,
    );
  }
}

/// Coach profile entity
@freezed
abstract class CoachProfileEntity with _$CoachProfileEntity {
  const factory CoachProfileEntity({
    required String id,
    String? profileImageUrl,
    String? nickname,
  }) = _CoachProfileEntity;

  factory CoachProfileEntity.fromDto(CoachProfileDto dto) {
    return CoachProfileEntity(
      id: dto.id,
      profileImageUrl: dto.profileImageUrl,
      nickname: dto.nickname,
    );
  }
}

/// Curriculum item entity
@freezed
abstract class CurriculumItemEntity with _$CurriculumItemEntity {
  const factory CurriculumItemEntity({
    required String title,
    required String description,
  }) = _CurriculumItemEntity;

  factory CurriculumItemEntity.fromDto(CurriculumItemDto dto) {
    return CurriculumItemEntity(title: dto.title, description: dto.description);
  }
}
