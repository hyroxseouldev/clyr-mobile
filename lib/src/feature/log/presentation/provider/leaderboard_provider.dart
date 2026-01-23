import 'package:clyr_mobile/src/feature/log/infra/entity/log_entity.dart';
import 'package:clyr_mobile/src/feature/log/infra/usecase/get_leaderboard_usecase.dart';
import 'package:clyr_mobile/src/feature/log/infra/usecase/log_usecase_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'leaderboard_provider.g.dart';

/// Leaderboard Provider
///
/// 지정된 날짜의 리더보드 엔트리들을 가져옵니다.
/// 날짜가 변경되면 자동으로 다시 가져옵니다.
@riverpod
Future<List<LeaderboardEntryEntity>> leaderboard(
  Ref ref,
  DateTime date,
) async {
  final usecase = ref.watch(getLeaderboardUseCaseProvider);
  final params = GetLeaderboardParams(date: date);

  final result = await usecase(params);
  return result.fold(
    (l) => throw l,
    (r) => r,
  );
}
