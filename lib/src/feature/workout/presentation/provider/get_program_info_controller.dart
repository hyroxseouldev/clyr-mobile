import 'package:clyr_mobile/src/core/pagination/paginated_list_view.dart';
import 'package:clyr_mobile/src/feature/workout/infra/entity/workout_entity.dart';
import 'package:clyr_mobile/src/feature/workout/infra/usecase/get_program_info_usecase.dart';
import 'package:clyr_mobile/src/feature/workout/infra/usecase/workout_usecase_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_program_info_controller.g.dart';

/// Program 정보 조회 컨트롤러
///
/// 현재 사용자의 활성화된 enrollments의 program 정보를 페이지네이션으로 반환
@riverpod
class GetProgramInfoController extends _$GetProgramInfoController {
  static const int _pageSize = 20;
  int _currentPage = 0;
  bool _hasMore = true;

  @override
  FutureOr<PaginatedData<ProgramEntity>> build() async {
    _currentPage = 0;
    _hasMore = true;
    return await _fetchPrograms(page: 0);
  }

  /// 다음 페이지 로드
  Future<void> loadNext() async {
    final current = state.value;
    if (current == null || !_hasMore || current.isLoading) return;

    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final nextPageData = await _fetchPrograms(page: _currentPage + 1);
      return PaginatedData<ProgramEntity>(
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
      return await _fetchPrograms(page: 0);
    });
  }

  Future<PaginatedData<ProgramEntity>> _fetchPrograms({
    required int page,
  }) async {
    final usecases = ref.read(workoutUseCasesProvider);
    final result = await usecases.getProgramInfo((
      page: page + 1, // 0-based → 1-based 변환
      limit: _pageSize,
    ));

    return result.fold((l) => throw l, (programs) {
      _currentPage = page;
      _hasMore = programs.length >= _pageSize;
      return PaginatedData<ProgramEntity>(
        items: programs,
        hasMore: _hasMore,
        isLoading: false,
      );
    });
  }
}
