import 'package:clyr_mobile/src/core/data/dto.dart';
import 'package:clyr_mobile/src/core/data/home_dto.dart';
import 'package:clyr_mobile/src/core/enum/enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_entity.freezed.dart';

/// 활성화된 프로그램 엔티티
@freezed
sealed class ActiveProgramEntity with _$ActiveProgramEntity {
  const factory ActiveProgramEntity({
    required String id,
    required String title,
    required String programImage,
    required List<String> mainImageList,
    required String description,
    required DateTime startDate,
    required DateTime endDate,
    required String coachProfileUrl,
    required String coachName,
  }) = ActiveProgramData;

  const factory ActiveProgramEntity.empty() = ActiveProgramEmpty;

  /// DTO로부터 엔티티 생성
  factory ActiveProgramEntity.fromDto(ActiveProgramDto dto) {
    return ActiveProgramEntity(
      id: dto.id,
      title: dto.title,
      programImage: dto.programImage ?? '',
      mainImageList: dto.mainImageList ?? [],
      description: dto.description ?? '',
      startDate: dto.startDate ?? DateTime.now(),
      endDate: dto.endDate ?? DateTime.now(),
      coachProfileUrl: dto.coachProfileUrl ?? '',
      coachName: dto.coachName ?? '',
    );
  }
}

/// Blueprint 섹션 엔티티
@freezed
abstract class BlueprintSectionEntity with _$BlueprintSectionEntity {
  const factory BlueprintSectionEntity({
    required String id, // sectionItemId
    required String sectionId, // sectionId
    required String title,
    required String content,
    required int orderIndex,
    required bool isCompleted,
    required bool isRecordable,
    RecordType? recordType,
  }) = BlueprintSectionData;

  /// DTO로부터 엔티티 생성
  factory BlueprintSectionEntity.fromDto(FlattenBlueprintSectionItemsDto dto) {
    return BlueprintSectionEntity(
      id: dto.id, // sectionItemId
      sectionId: dto.sectionId, // sectionId
      title: dto.title,
      content: dto.content,
      orderIndex: dto.orderIndex,
      isCompleted: dto.isCompleted,
      isRecordable: dto.isRecordable ?? false,
      recordType: dto.recordType != null
          ? RecordTypeX.fromString(dto.recordType)
          : null,
    );
  }
}

/// 섹션 완료 기록 엔티티
@freezed
abstract class SectionRecordEntity with _$SectionRecordEntity {
  const factory SectionRecordEntity({
    required String id,
    required String userId,
    required String userProfileId,
    required String sectionId,
    required String sectionItemId,
    Map<String, dynamic>? content,
    DateTime? completedAt,
    String? coachComment,
    RecordType? recordType,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = SectionRecordData;

  /// DTO로부터 엔티티 생성
  factory SectionRecordEntity.fromDto(SectionRecordDto dto) {
    return SectionRecordEntity(
      id: dto.id,
      userId: dto.userId,
      userProfileId: dto.userProfileId ?? '',
      sectionId: dto.sectionId,
      sectionItemId: dto.sectionItemId,
      content: dto.content,
      completedAt: dto.completedAt,
      coachComment: dto.coachComment,
      recordType: dto.recordType != null
          ? RecordTypeX.fromString(dto.recordType)
          : null,
      createdAt: dto.createdAt,
      updatedAt: dto.updatedAt,
    );
  }
}

/// 오늘의 세션 상태
///
/// ActiveProgram이 로드된 상태에서 날짜에 따른 세션 상태를 나타냅니다.
@freezed
sealed class TodaysSessionState with _$TodaysSessionState {
  /// 활성화된 프로그램이 없는 상태
  const factory TodaysSessionState.empty() = TodaysSessionEmpty;

  /// 훈련일 - 세션 리스트가 있음
  const factory TodaysSessionState.trainingDay(
    List<BlueprintSectionEntity> sections,
    String coachQuote,
    String coachName,
  ) = TodaysSessionTrainingDay;

  /// 휴식일 - 세션 없음
  const factory TodaysSessionState.restDay() = TodaysSessionRestDay;
}
