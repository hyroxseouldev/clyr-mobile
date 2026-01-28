import 'package:fpdart/fpdart.dart';
import 'package:clyr_mobile/src/core/data/data_source.dart';
import 'package:clyr_mobile/src/core/exception/exception.dart';
import 'package:clyr_mobile/src/core/typedef/typedef.dart';
import 'package:clyr_mobile/src/feature/home/infra/entity/home_entity.dart';

/// 오늘의 세션 데이터
///
/// 섹션 리스트, 코치의 한마디, 코치 이름을 포함합니다.
typedef TodaysSessionData = ({
  List<BlueprintSectionEntity> sections,
  String notes,
  String coachName,
});

/// 홈 데이터 소스 인터페이스
abstract class HomeRepository {
  /// 현재 사용자의 활성화된 프로그램을 가져옵니다
  FutureEither<AppException, ActiveProgramEntity> getActiveProgram();

  /// 지정된 날짜의 오늘의 세션 데이터를 가져옵니다
  /// (섹션 리스트, 코치의 한마디, 코치 이름)
  FutureEither<AppException, TodaysSessionData> getTodaysSessionData({
    required DateTime date,
  });

  /// 섹션 완료 기록을 생성합니다
  FutureEither<AppException, void> createSectionRecord({
    required String sectionId,
    required String sectionItemId,
    Map<String, dynamic>? content,
  });
}

/// 홈 데이터 소스 구현체
class HomeRepositoryImpl implements HomeRepository {
  final CoreDataSource dataSource;

  HomeRepositoryImpl({required this.dataSource});

  @override
  FutureEither<AppException, ActiveProgramEntity> getActiveProgram() async {
    try {
      final dto = await dataSource.getCurrentActiveProgram();
      if (dto == null) {
        return right(const ActiveProgramEntity.empty());
      }
      return right(ActiveProgramEntity.fromDto(dto));
    } catch (e) {
      return left(
        HomeException(
          code: 'ACTIVE_PROGRAM_FETCH_FAILED',
          message: e.toString(),
        ),
      );
    }
  }

  @override
  FutureEither<AppException, TodaysSessionData> getTodaysSessionData({
    required DateTime date,
  }) async {
    try {
      final dto = await dataSource.getTodaysSessionState(
        date: date,
        isTest: true,
      );

      final sections = dto.sections
          .map((sectionDto) => BlueprintSectionEntity.fromDto(sectionDto))
          .toList();

      final sessionData = (
        sections: sections,
        notes: dto.notes,
        coachName: dto.coachName,
      );

      return right(sessionData);
    } catch (e) {
      return left(
        HomeException(
          code: 'TODAYS_SESSION_FETCH_FAILED',
          message: e.toString(),
        ),
      );
    }
  }

  @override
  FutureEither<AppException, void> createSectionRecord({
    required String sectionId,
    required String sectionItemId,
    Map<String, dynamic>? content,
  }) async {
    try {
      await dataSource.createSectionRecord(
        sectionId: sectionId,
        sectionItemId: sectionItemId,
        content: content,
      );
      return right(null);
    } catch (e) {
      return left(
        HomeException(
          code: 'SECTION_RECORD_CREATE_FAILED',
          message: e.toString(),
        ),
      );
    }
  }
}
