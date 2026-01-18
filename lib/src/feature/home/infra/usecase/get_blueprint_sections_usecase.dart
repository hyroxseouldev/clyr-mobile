import 'package:clyr_mobile/src/core/usecase/usecase.dart';
import 'package:clyr_mobile/src/core/exception/exception.dart';
import 'package:clyr_mobile/src/core/typedef/typedef.dart';
import 'package:clyr_mobile/src/feature/home/data/repository/home_repository.dart';
import 'package:clyr_mobile/src/feature/home/infra/entity/home_entity.dart';

/// Blueprint 섹션 조회 UseCase
class GetBlueprintSectionsUseCase implements Usecase<GetBlueprintSectionsParams, List<BlueprintSectionEntity>> {
  final HomeRepository _repository;

  GetBlueprintSectionsUseCase(this._repository);

  @override
  FutureEither<AppException, List<BlueprintSectionEntity>> call(GetBlueprintSectionsParams input) {
    return _repository.getBlueprintSections(date: input.date);
  }
}

/// Blueprint 섹션 조회 파라미터
class GetBlueprintSectionsParams {
  final DateTime date;

  const GetBlueprintSectionsParams({required this.date});
}
