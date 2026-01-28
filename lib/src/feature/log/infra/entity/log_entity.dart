import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:clyr_mobile/src/core/data/log_dto.dart';

part 'log_entity.freezed.dart';

@freezed
abstract class LeaderboardEntryEntity with _$LeaderboardEntryEntity {
  const factory LeaderboardEntryEntity({
    required String userId,
    required String userName,
    required String? userProfileImageUrl,
    required DateTime completedAt,
    required Map<String, dynamic>? content,
    required int rank,
  }) = _LeaderboardEntryEntity;

  factory LeaderboardEntryEntity.fromDto(
    SectionRecordWithUserProfileDto dto,
    int rank,
  ) {
    return LeaderboardEntryEntity(
      userId: dto.userId,
      userName: dto.nickname ?? 'Unknown',
      userProfileImageUrl: dto.profileImageUrl,
      completedAt: dto.completedAt,
      content: dto.content,
      rank: rank,
    );
  }
}

@freezed
abstract class TodayLeaderBoardEntity with _$TodayLeaderBoardEntity {
  const factory TodayLeaderBoardEntity({
    required List<LeaderboardEntryEntity> entries,
    String? mySectionRecordId,
    String? sectionContent,
  }) = _TodayLeaderBoardEntity;

  factory TodayLeaderBoardEntity.fromDto(LeaderboardDto dto) {
    final entries = dto.sectionRecords
        .asMap()
        .entries
        .map((entry) =>
            LeaderboardEntryEntity.fromDto(entry.value, entry.key + 1))
        .toList();

    return TodayLeaderBoardEntity(
      entries: entries,
      mySectionRecordId: dto.mySectionRecordId,
      sectionContent: dto.sectionItemContent,
    );
  }
}
