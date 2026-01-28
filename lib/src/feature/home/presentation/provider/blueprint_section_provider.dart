import 'package:clyr_mobile/src/feature/home/infra/entity/home_entity.dart';
import 'package:clyr_mobile/src/feature/home/infra/usecase/get_blueprint_sections_usecase.dart';
import 'package:clyr_mobile/src/feature/home/infra/usecase/home_usecase_provider.dart';
import 'package:clyr_mobile/src/feature/home/presentation/provider/home_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'blueprint_section_provider.g.dart';

/// 오늘의 세션 상태 Provider
///
/// ActiveProgram 상태에 따라 오늘의 세션 상태를 반환합니다:
/// - empty: 활성화된 프로그램 없음
/// - trainingDay: 훈련일 (세션 리스트 있음)
/// - restDay: 휴식일 (세션 없음)
@riverpod
Future<TodaysSessionState> todaysSessionState(Ref ref, DateTime date) async {
  // ActiveProgram 상태 관찰
  final activeProgramAsync = ref.watch(homeControllerProvider);
  final activeProgram = activeProgramAsync.value;

  // ActiveProgram이 없으면 empty 상태 반환
  if (activeProgram == null) {
    return const TodaysSessionState.empty();
  }

  // Blueprint sections 로드
  final usecase = ref.watch(getBlueprintSectionsUseCaseProvider);
  final params = GetBlueprintSectionsParams(date: date);

  final result = await usecase(params);
  return result.fold((l) => throw l, (sections) {
    // 섹션 리스트가 비어있으면 휴식일
    if (sections.isEmpty) {
      return const TodaysSessionState.restDay();
    }

    // 섹션이 있으면 훈련일
    return TodaysSessionState.trainingDay(sections, coachName, quote);
  });
}
