import 'package:clyr_mobile/src/feature/home/infra/entity/home_entity.dart';
import 'package:clyr_mobile/src/feature/home/infra/usecase/get_blueprint_sections_usecase.dart';
import 'package:clyr_mobile/src/feature/home/infra/usecase/home_usecase_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'blueprint_section_provider.g.dart';

/// Blueprint Sections Provider
///
/// 지정된 날짜의 블루프린트 섹션 엔티티들을 가져옵니다.
/// 날짜가 변경되면 자동으로 다시 가져옵니다.
@riverpod
Future<List<BlueprintSectionEntity>> blueprintSections(
  Ref ref,
  DateTime date,
) async {
  final usecase = ref.watch(getBlueprintSectionsUseCaseProvider);
  final params = GetBlueprintSectionsParams(date: date);

  final result = await usecase(params);
  return result.fold(
    (l) => throw l,
    (r) => r,
  );
}
