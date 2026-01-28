import 'package:clyr_mobile/src/core/usecase/usecase.dart';
import 'package:clyr_mobile/src/core/exception/exception.dart';
import 'package:clyr_mobile/src/core/typedef/typedef.dart';
import 'package:clyr_mobile/src/feature/home/infra/repository/home_repository.dart';

/// 섹션 완료 기록 생성 UseCase
class CreateSectionRecordUseCase
    implements Usecase<CreateSectionRecordParams, void> {
  final HomeRepository _repository;

  CreateSectionRecordUseCase(this._repository);

  @override
  FutureEither<AppException, void> call(CreateSectionRecordParams input) {
    return _repository.createSectionRecord(
      sectionId: input.sectionId,
      sectionItemId: input.sectionItemId,
      content: input.content,
    );
  }
}

/// 섹션 완료 기록 생성 파라미터
class CreateSectionRecordParams {
  final String sectionId;
  final String sectionItemId;
  final Map<String, dynamic>? content;

  const CreateSectionRecordParams({
    required this.sectionId,
    required this.sectionItemId,
    this.content,
  });
}
