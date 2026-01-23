import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:clyr_mobile/src/core/data/dto.dart';

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

  factory LeaderboardEntryEntity.fromDto(SectionRecordDto dto, int rank) {
    final profile = dto.userProfile;
    return LeaderboardEntryEntity(
      userId: dto.userId,
      userName: profile?.nickname ?? dto.userId,
      userProfileImageUrl: profile?.profileImageUrl,
      completedAt: dto.completedAt,
      content: dto.content,
      rank: rank,
    );
  }
}
