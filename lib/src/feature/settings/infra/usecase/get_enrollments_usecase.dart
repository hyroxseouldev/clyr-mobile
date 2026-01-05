import 'package:clyr_mobile/src/core/exception/exception.dart';
import 'package:clyr_mobile/src/core/typedef/typedef.dart';
import 'package:clyr_mobile/src/core/usecase/usecase.dart';
import 'package:clyr_mobile/src/feature/settings/data/repository/setting_repository.dart';
import 'package:clyr_mobile/src/feature/settings/infra/entity/enrollment_entity.dart';

class GetEnrollmentsUseCase
    implements Usecase<GetEnrollmentsParams, List<EnrollmentEntity>> {
  final SettingRepository _repository;

  GetEnrollmentsUseCase(this._repository);

  @override
  FutureEither<AppException, List<EnrollmentEntity>> call(
    GetEnrollmentsParams input,
  ) async {
    return await _repository.getEnrollments(input);
  }
}
