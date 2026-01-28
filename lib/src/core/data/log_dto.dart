import 'package:clyr_mobile/src/core/data/dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'log_dto.g.dart';

/// Leaderboard data with all records, current user's record ID, and section content
@JsonSerializable(explicitToJson: true)
class LeaderboardDto {
  final List<SectionRecordDto> sectionRecords;
  final String? mySectionRecordId;
  final String? sectionItemContent; // Content from blueprint_section linked by sectionId

  LeaderboardDto({
    required this.sectionRecords,
    this.mySectionRecordId,
    this.sectionItemContent,
  });

  factory LeaderboardDto.fromJson(Map<String, dynamic> json) =>
      _$LeaderboardDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LeaderboardDtoToJson(this);
}
