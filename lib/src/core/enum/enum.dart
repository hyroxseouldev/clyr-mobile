import 'dart:math' as math;

import 'package:freezed_annotation/freezed_annotation.dart';

/// 섹션 기록 유형
enum RecordType {
  @JsonValue('TIME_BASED')
  timeBased,
  @JsonValue('WEIGHT_BASED')
  weightBased,
  @JsonValue('REP_BASED')
  repBased,
  @JsonValue('DISTANCE_BASED')
  distanceBased,
  @JsonValue('SURVEY')
  survey,
  @JsonValue('CHECKLIST')
  checklist,
  @JsonValue('PHOTO')
  photo,
  @JsonValue('OTHER')
  other,
}

extension RecordTypeX on RecordType {
  String get value => switch (this) {
        RecordType.timeBased => 'TIME_BASED',
        RecordType.weightBased => 'WEIGHT_BASED',
        RecordType.repBased => 'REP_BASED',
        RecordType.distanceBased => 'DISTANCE_BASED',
        RecordType.survey => 'SURVEY',
        RecordType.checklist => 'CHECKLIST',
        RecordType.photo => 'PHOTO',
        RecordType.other => 'OTHER',
      };

  static RecordType? fromString(String? value) => switch (value) {
        'TIME_BASED' => RecordType.timeBased,
        'WEIGHT_BASED' => RecordType.weightBased,
        'REP_BASED' => RecordType.repBased,
        'DISTANCE_BASED' => RecordType.distanceBased,
        'SURVEY' => RecordType.survey,
        'CHECKLIST' => RecordType.checklist,
        'PHOTO' => RecordType.photo,
        'OTHER' => RecordType.other,
        _ => null,
      };
}

/// 블루프린트 섹션 카드 제목 유형
enum BlueprintCardTitleEnum {
  @JsonValue('cool_down')
  coolDown,
  @JsonValue('warm_up')
  warmUp,
  @JsonValue('main_workout')
  mainWorkout,
  @JsonValue('aerobics')
  aerobics,
  @JsonValue('accessory')
  accessory,
}

extension BlueprintCardTitleEnumX on BlueprintCardTitleEnum {
  String get value => switch (this) {
        BlueprintCardTitleEnum.coolDown => 'cool_down',
        BlueprintCardTitleEnum.warmUp => 'warm_up',
        BlueprintCardTitleEnum.mainWorkout => 'main_workout',
        BlueprintCardTitleEnum.aerobics => 'aerobics',
        BlueprintCardTitleEnum.accessory => 'accessory',
      };

  static BlueprintCardTitleEnum? fromString(String? value) => switch (value) {
        'cool_down' => BlueprintCardTitleEnum.coolDown,
        'warm_up' => BlueprintCardTitleEnum.warmUp,
        'main_workout' => BlueprintCardTitleEnum.mainWorkout,
        'aerobics' => BlueprintCardTitleEnum.aerobics,
        'accessory' => BlueprintCardTitleEnum.accessory,
        _ => null,
      };
}

/// Extension for formatting and comparing workout records
extension RecordTypeRecordFormatting on RecordType {
  /// Format record values into a string based on record type
  String formatNotes({
    required String hours,
    required String minutes,
    required String seconds,
    required String rounds,
    required String reps,
    required String weight,
    required String distance,
  }) {
    return switch (this) {
      RecordType.timeBased =>
        '${hours.padLeft(2, '0')}:${minutes.padLeft(2, '0')}:${seconds.padLeft(2, '0')}',
      RecordType.repBased => '$rounds Round $reps Rep',
      RecordType.weightBased => '$weight kg',
      RecordType.distanceBased => '$distance m',
      _ => '',
    };
  }

  /// Parse a formatted record string back to seconds for time-based,
  /// or to numeric value for other types
  double _parseRecordValue(String record) {
    return switch (this) {
      RecordType.timeBased => _parseTimeToSeconds(record).toDouble(),
      RecordType.weightBased ||
      RecordType.repBased ||
      RecordType.distanceBased =>
        double.tryParse(record) ?? 0.0,
      _ => 0.0,
    };
  }

  /// Parse time string (hh:mm:ss or mm:ss) to seconds
  int _parseTimeToSeconds(String timeStr) {
    final parts = timeStr.split(':');
    int seconds = 0;
    for (int i = 0; i < parts.length; i++) {
      final value = int.tryParse(parts[i]) ?? 0;
      // Rightmost part is seconds, then minutes, then hours
      seconds += value * math.pow(60, parts.length - 1 - i).toInt();
    }
    return seconds;
  }

  /// Compare two records for leaderboard sorting
  /// Returns negative if a < b, positive if a > b, zero if equal
  int compareRecords(String? aRecord, String? bRecord) {
    if (aRecord == null || bRecord == null) {
      return 0; // Keep original order if null
    }

    final aValue = _parseRecordValue(aRecord);
    final bValue = _parseRecordValue(bRecord);

    return switch (this) {
      // Ascending: less time = better rank
      RecordType.timeBased => aValue.compareTo(bValue),
      // Descending: larger value = better rank
      RecordType.weightBased ||
      RecordType.repBased ||
      RecordType.distanceBased =>
        bValue.compareTo(aValue),
      _ => 0,
    };
  }
}
