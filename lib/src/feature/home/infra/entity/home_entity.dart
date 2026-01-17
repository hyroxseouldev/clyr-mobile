import 'package:clyr_mobile/src/core/data/dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_entity.freezed.dart';

/// 활성화된 프로그램 엔티티
@freezed
abstract class ActiveProgramEntity with _$ActiveProgramEntity {
  const factory ActiveProgramEntity({
    required String id,
    required String title,
    String? thumbnailUrl,
    String? shortDescription,
    String? description,
  }) = _ActiveProgramEntity;

  /// DTO로부터 엔티티 생성
  factory ActiveProgramEntity.fromDto(ProgramsDto dto) {
    return ActiveProgramEntity(
      id: dto.id,
      title: dto.title,
      thumbnailUrl: dto.thumbnailUrl,
      shortDescription: dto.shortDescription,
      description: dto.description,
    );
  }
}
