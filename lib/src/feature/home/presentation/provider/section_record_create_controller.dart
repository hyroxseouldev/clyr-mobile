import 'package:clyr_mobile/src/feature/home/infra/usecase/create_section_record_usecase.dart';
import 'package:clyr_mobile/src/feature/home/infra/usecase/home_usecase_provider.dart';
import 'package:clyr_mobile/src/feature/home/presentation/provider/blueprint_section_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'section_record_create_controller.g.dart';

/// 섹션 완료 기록 생성 컨트롤러
@riverpod
class SectionRecordCreateController extends _$SectionRecordCreateController {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<void> createRecord({
    required String sectionId,
    required String sectionItemId,
    required Map<String, dynamic>? content,
    required DateTime selectedDate,
    required Function() onSuccess,
  }) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final usecase = ref.read(createSectionRecordUseCaseProvider);
      final result = await usecase(
        CreateSectionRecordParams(
          sectionId: sectionId,
          sectionItemId: sectionItemId,
          content: content,
        ),
      );
      return result.fold((l) => throw l, (r) {
        onSuccess();
        ref.invalidate(blueprintSectionsProvider(selectedDate));
        return r;
      });
    });
  }
}
