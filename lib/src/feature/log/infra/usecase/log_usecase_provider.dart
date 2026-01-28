import 'package:clyr_mobile/src/feature/log/infra/repository/log_repository_provider.dart';
import 'package:clyr_mobile/src/feature/log/infra/usecase/get_leaderboard_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'log_usecase_provider.g.dart';

/// 리더보드 조회 UseCase 프로바이더
@riverpod
GetLeaderboardUseCase getLeaderboardUseCase(Ref ref) {
  return GetLeaderboardUseCase(ref.watch(logRepositoryProvider));
}
