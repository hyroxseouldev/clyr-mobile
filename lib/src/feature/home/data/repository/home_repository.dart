import 'package:fpdart/fpdart.dart';
import 'package:clyr_mobile/src/core/data/data_source.dart';
import 'package:clyr_mobile/src/core/exception/exception.dart';
import 'package:clyr_mobile/src/core/typedef/typedef.dart';
import 'package:clyr_mobile/src/feature/home/infra/entity/home_entity.dart';

/// 홈 데이터 소스 인터페이스
abstract class HomeRepository {
  /// 현재 사용자의 활성화된 프로그램을 가져옵니다
  FutureEither<AppException, ActiveProgramEntity> getActiveProgram();
}

/// 홈 데이터 소스 구현체
class HomeRepositoryImpl implements HomeRepository {
  final CoreDataSource dataSource;

  HomeRepositoryImpl({required this.dataSource});

  @override
  FutureEither<AppException, ActiveProgramEntity> getActiveProgram() async {
    try {
      final dto = await dataSource.getCurrentActiveProgram();
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
}
