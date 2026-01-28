import 'package:fpdart/fpdart.dart';
import 'package:clyr_mobile/src/core/data/data_source.dart';
import 'package:clyr_mobile/src/core/exception/exception.dart';
import 'package:clyr_mobile/src/core/typedef/typedef.dart';
import 'package:clyr_mobile/src/feature/log/infra/entity/log_entity.dart';

/// Log 데이터 소스 인터페이스
abstract class LogRepository {
  /// 지정된 날짜의 리더보드 엔트리들을 가져옵니다
  FutureEither<AppException, List<LeaderboardEntryEntity>> getLeaderboard({
    required DateTime date,
  });

  /// 지정된 날짜의 오늘 리더보드를 가져옵니다 (내 기록 포함)
  FutureEither<AppException, TodayLeaderBoardEntity> getTodayLeaderBoard({
    required DateTime date,
    bool isTest = false,
  });
}

/// Log 데이터 소스 구현체
class LogRepositoryImpl implements LogRepository {
  final CoreDataSource dataSource;

  LogRepositoryImpl({required this.dataSource});

  @override
  FutureEither<AppException, List<LeaderboardEntryEntity>> getLeaderboard({
    required DateTime date,
  }) async {
    try {
      final dtos = await dataSource.getMainWorkoutSectionRecords(
        date: date,
        isTest: true,
      );

      // Sort by completedAt ascending (faster = better rank)
      dtos.sort((a, b) => a.completedAt.compareTo(b.completedAt));

      // Convert to entities with rank
      final entities = dtos.asMap().entries.map((entry) {
        return LeaderboardEntryEntity.fromDto(entry.value, entry.key + 1);
      }).toList();

      return right(entities);
    } catch (e) {
      return left(
        LogException(code: 'LEADERBOARD_FETCH_FAILED', message: e.toString()),
      );
    }
  }

  @override
  FutureEither<AppException, TodayLeaderBoardEntity> getTodayLeaderBoard({
    required DateTime date,
    bool isTest = false,
  }) async {
    try {
      final dto = await dataSource.getTodayLeaderBoard(
        date: date,
        isTest: isTest,
      );
      final entity = TodayLeaderBoardEntity.fromDto(dto);
      return right(entity);
    } catch (e) {
      return left(
        LogException(code: 'TODAY_LEADERBOARD_FETCH_FAILED', message: e.toString()),
      );
    }
  }
}
