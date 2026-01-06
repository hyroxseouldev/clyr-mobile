import 'package:clyr_mobile/src/core/pagination/paginated_list_view.dart';
import 'package:clyr_mobile/src/feature/workout/infra/entity/workout_log_entity.dart';
import 'package:clyr_mobile/src/feature/workout/infra/usecase/workout_log_usecase_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_workout_logs_controller.g.dart';

/// 운동 로그 페이지네이션 조회 컨트롤러
@riverpod
class GetWorkoutLogsController extends _$GetWorkoutLogsController {
  static const int _pageSize = 20;
  int _currentPage = 0;
  bool _hasMore = true;

  @override
  FutureOr<PaginatedData<WorkoutLogEntity>> build() async {
    _currentPage = 0;
    _hasMore = true;
    return await _fetchLogs(page: 0);
  }

  /// 다음 페이지 로드
  Future<void> loadNext() async {
    final current = state.value;
    if (current == null || !_hasMore || current.isLoading) return;

    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final nextPageData = await _fetchLogs(page: _currentPage + 1);
      return PaginatedData<WorkoutLogEntity>(
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
      return await _fetchLogs(page: 0);
    });
  }

  Future<PaginatedData<WorkoutLogEntity>> _fetchLogs({
    required int page,
  }) async {
    final usecases = ref.read(workoutLogUseCasesProvider);
    // Supabase range는 0-based, page는 0-based
    // Repository에서 1-based로 변환하므로 page + 1
    final result = await usecases.getWorkoutLogs((
      page: page + 1,
      limit: _pageSize,
    ));

    return result.fold((l) => throw l, (logs) {
      _currentPage = page;
      _hasMore = logs.length >= _pageSize;
      return PaginatedData<WorkoutLogEntity>(
        items: logs,
        hasMore: _hasMore,
        isLoading: false,
      );
    });
  }
}
