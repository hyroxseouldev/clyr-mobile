import 'package:clyr_mobile/src/feature/log/infra/entity/log_entity.dart';
import 'package:clyr_mobile/src/feature/log/infra/usecase/get_today_leaderboard_usecase.dart';
import 'package:clyr_mobile/src/feature/log/infra/usecase/log_usecase_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'today_leaderboard_provider.g.dart';

/// 오늘 리더보드 Provider
///
/// 지정된 날짜의 리더보드 데이터를 가져옵니다.
/// 날짜가 변경되면 자동으로 다시 가져옵니다.
@riverpod
Future<TodayLeaderBoardEntity> todayLeaderboard(
  Ref ref,
  DateTime date,
) async {
  final usecase = ref.watch(getTodayLeaderBoardUseCaseProvider);
  final params = GetTodayLeaderBoardParams(
    date: date,
    isTest: true, // Force phase 1, day 1 for testing
  );

  final result = await usecase(params);
  return result.fold(
    (l) => throw l,
    (r) => r,
  );
}
