import 'package:clyr_mobile/src/feature/home/infra/entity/home_entity.dart';
import 'package:clyr_mobile/src/feature/home/infra/usecase/home_usecase_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_controller.g.dart';

/// 홈 컨트롤러
///
/// 현재 사용자의 활성화된 프로그램을 가져옵니다
@riverpod
class HomeController extends _$HomeController {
  @override
  FutureOr<ActiveProgramEntity?> build() async {
    try {
      final usecase = ref.read(getActiveProgramUseCaseProvider);
      final result = await usecase(null);
      return result.fold(
        (l) => null, // 에러 시 null 반환 (활성화된 프로그램 없음)
        (r) => r,
      );
    } catch (e) {
      return null;
    }
  }

  /// 프로그램 새로고침
  Future<void> refresh() async {
    ref.invalidateSelf();
  }
}
