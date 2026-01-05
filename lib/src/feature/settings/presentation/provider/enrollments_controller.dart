import 'package:clyr_mobile/src/core/pagination/paginated_list_view.dart';
import 'package:clyr_mobile/src/feature/settings/infra/entity/enrollment_entity.dart';
import 'package:clyr_mobile/src/feature/settings/infra/usecase/setting_usecase_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'enrollments_controller.g.dart';

/// 등록 목록 컨트롤러
///
/// 페이지네이션을 지원하는 등록 목록 조회
@riverpod
class EnrollmentsController extends _$EnrollmentsController {
  static const int _pageSize = 20;
  int _currentPage = 0;
  bool _hasMore = true;

  @override
  FutureOr<PaginatedData<EnrollmentEntity>> build() async {
    _currentPage = 0;
    _hasMore = true;
    return await _fetchEnrollments(page: 0);
  }

  /// 다음 페이지 로드
  Future<void> loadNext() async {
    final current = state.value;
    if (current == null || !_hasMore || current.isLoading) return;

    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final nextPageData = await _fetchEnrollments(page: _currentPage + 1);
      return PaginatedData<EnrollmentEntity>(
        items: [...current.items, ...nextPageData.items],
        hasMore: nextPageData.hasMore,
        isLoading: false,
      );
    });
  }

  /// 새로고침
  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      _currentPage = 0;
      _hasMore = true;
      return await _fetchEnrollments(page: 0);
    });
  }

  Future<PaginatedData<EnrollmentEntity>> _fetchEnrollments(
      {required int page}) async {
    final usecases = ref.read(settingUseCasesProvider);
    final result = await usecases.getEnrollments(
      (page: page, limit: _pageSize),
    );

    return result.fold((l) => throw l, (enrollments) {
      _currentPage = page;
      _hasMore = enrollments.length >= _pageSize;
      return PaginatedData<EnrollmentEntity>(
        items: enrollments,
        hasMore: _hasMore,
        isLoading: false,
      );
    });
  }
}
