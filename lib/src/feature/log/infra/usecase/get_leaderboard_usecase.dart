import 'package:clyr_mobile/src/core/usecase/usecase.dart';
import 'package:clyr_mobile/src/core/util/type_defs.dart';
import 'package:clyr_mobile/src/feature/log/infra/repository/log_repository.dart';
import 'package:clyr_mobile/src/feature/log/infra/entity/log_entity.dart';

/// 리더보드 조회 UseCase
class GetLeaderboardUseCase implements Usecase<GetLeaderboardParams, List<LeaderboardEntryEntity>> {
  final LogRepository _repository;

  GetLeaderboardUseCase(this._repository);

  @override
  FutureEither<List<LeaderboardEntryEntity>> call(GetLeaderboardParams input) {
    return _repository.getLeaderboard(date: input.date);
  }
}

/// 리더보드 조회 파라미터
class GetLeaderboardParams {
  final DateTime date;

  const GetLeaderboardParams({required this.date});
}
