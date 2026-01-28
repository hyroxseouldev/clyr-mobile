import 'package:clyr_mobile/src/core/usecase/usecase.dart';
import 'package:clyr_mobile/src/core/exception/exception.dart';
import 'package:clyr_mobile/src/core/typedef/typedef.dart';
import 'package:clyr_mobile/src/feature/home/infra/repository/home_repository.dart';

/// 오늘의 세션 조회 UseCase
class GetTodaysSessionUseCase implements Usecase<GetTodaysSessionParams, TodaysSessionData> {
  final HomeRepository _repository;

  GetTodaysSessionUseCase(this._repository);

  @override
  FutureEither<AppException, TodaysSessionData> call(GetTodaysSessionParams input) {
    return _repository.getTodaysSessionData(date: input.date);
  }
}

/// 오늘의 세션 조회 파라미터
class GetTodaysSessionParams {
  final DateTime date;

  const GetTodaysSessionParams({required this.date});
}
