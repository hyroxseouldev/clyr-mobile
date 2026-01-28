// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeaderboardDto _$LeaderboardDtoFromJson(Map<String, dynamic> json) =>
    LeaderboardDto(
      sectionRecords: (json['sectionRecords'] as List<dynamic>)
          .map((e) => SectionRecordDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      mySectionRecordId: json['mySectionRecordId'] as String?,
      sectionItemContent: json['sectionItemContent'] as String?,
    );

Map<String, dynamic> _$LeaderboardDtoToJson(LeaderboardDto instance) =>
    <String, dynamic>{
      'sectionRecords': instance.sectionRecords.map((e) => e.toJson()).toList(),
      'mySectionRecordId': instance.mySectionRecordId,
      'sectionItemContent': instance.sectionItemContent,
    };
