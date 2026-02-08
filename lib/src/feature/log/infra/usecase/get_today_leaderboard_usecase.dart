import 'package:clyr_mobile/src/core/usecase/usecase.dart';
import 'package:clyr_mobile/src/core/util/type_defs.dart';
import 'package:clyr_mobile/src/feature/log/infra/entity/log_entity.dart';
import 'package:clyr_mobile/src/feature/log/infra/repository/log_repository.dart';

/// 오늘 리더보드 조회 UseCase
class GetTodayLeaderBoardUseCase implements Usecase<GetTodayLeaderBoardParams, TodayLeaderBoardEntity> {
  final LogRepository _repository;

  GetTodayLeaderBoardUseCase(this._repository);

  @override
  FutureEither<TodayLeaderBoardEntity> call(GetTodayLeaderBoardParams input) {
    return _repository.getTodayLeaderBoard(
      date: input.date,
      isTest: input.isTest,
    );
  }
}

/// 오늘 리더보드 조회 파라미터
class GetTodayLeaderBoardParams {
  final DateTime date;
  final bool isTest;

  const GetTodayLeaderBoardParams({
    required this.date,
    this.isTest = false,
  });
}
