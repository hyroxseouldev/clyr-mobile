import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:clyr_mobile/src/core/data/data_source.dart';
import 'package:clyr_mobile/src/core/error/exception.dart';
import 'package:clyr_mobile/src/core/health/health_service.dart';
import 'package:clyr_mobile/src/core/permission/permission_service.dart';
import 'package:clyr_mobile/src/core/util/type_defs.dart';
import 'package:clyr_mobile/src/feature/home/infra/entity/home_entity.dart';
import 'package:clyr_mobile/src/core/health/entity/health_workout_data.dart';

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
  FutureEither<ActiveProgramEntity> getActiveProgram();

  /// 지정된 날짜의 오늘의 세션 데이터를 가져옵니다
  /// (섹션 리스트, 코치의 한마디, 코치 이름)
  FutureEither<TodaysSessionData> getTodaysSessionData({
    required DateTime date,
  });

  /// 섹션 완료 기록을 생성합니다
  FutureEither<void> createSectionRecord({
    required String sectionId,
    required String sectionItemId,
    Map<String, dynamic>? content,
  });

  /// Get workouts for a specific date from HealthKit
  FutureEither<List<HealthWorkoutData>> getWorkoutsByDate(DateTime date);
}

/// 홈 데이터 소스 구현체
class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl({
    required CoreDataSource dataSource,
    required HealthService healthService,
    required PermissionService permissionService,
  })  : _dataSource = dataSource,
        _healthService = healthService,
        _permissionService = permissionService;

  final CoreDataSource _dataSource;
  final HealthService _healthService;
  final PermissionService _permissionService;

  /// Cache for permission state to avoid repeated prompts
  bool _permissionsChecked = false;
  bool _permissionsGranted = false;

  @override
  FutureEither<ActiveProgramEntity> getActiveProgram() async {
    try {
      final dto = await _dataSource.getCurrentActiveProgram();
      if (dto == null) {
        return right(const ActiveProgramEntity.empty());
      }
      return right(ActiveProgramEntity.fromDto(dto));
    } catch (e) {
      return left(
        AppException.home(e.toString()),
      );
    }
  }

  @override
  FutureEither<TodaysSessionData> getTodaysSessionData({
    required DateTime date,
  }) async {
    try {
      final dto = await _dataSource.getTodaysSessionState(
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
        AppException.home(e.toString()),
      );
    }
  }

  @override
  FutureEither<void> createSectionRecord({
    required String sectionId,
    required String sectionItemId,
    Map<String, dynamic>? content,
  }) async {
    try {
      await _dataSource.createSectionRecord(
        sectionId: sectionId,
        sectionItemId: sectionItemId,
        content: content,
      );
      return right(null);
    } catch (e) {
      return left(
        AppException.home(e.toString()),
      );
    }
  }

  @override
  FutureEither<List<HealthWorkoutData>> getWorkoutsByDate(DateTime date) async {
    debugPrint('📅 [HomeRepository] Fetching workouts for date: ${date.toString().split(' ')[0]}');

    try {
      // Step 1: Check permissions (with cache)
      if (!_permissionsChecked) {
        debugPrint('🔐 [HomeRepository] Checking health permissions...');
        final permissionsResult = await _permissionService.areHealthPermissionsGranted();

        permissionsResult.fold(
          (error) {
            debugPrint('❌ [HomeRepository] Permission check failed: ${error.message}');
            return left(error);
          },
          (granted) {
            _permissionsChecked = true;
            _permissionsGranted = granted;
            debugPrint('✅ [HomeRepository] Permissions granted: $granted');
          },
        );

        if (!_permissionsGranted) {
          debugPrint('⛔ [HomeRepository] Health permissions not granted');
          return left(AppException.permission(
            'Health permissions not granted',
          ));
        }
      } else {
        debugPrint('♻️ [HomeRepository] Using cached permission state: $_permissionsGranted');
      }

      // Step 2: Get start and end of day
      final startOfDay = DateTime(date.year, date.month, date.day);
      final endOfDay = DateTime(date.year, date.month, date.day, 23, 59, 59);
      debugPrint('🕐 [HomeRepository] Query range: $startOfDay to $endOfDay');

      // Step 3: Fetch workouts from HealthService
      debugPrint('🔍 [HomeRepository] Fetching workouts from HealthService...');
      final workoutsResult = await _healthService.getWorkouts(
        startDate: startOfDay,
        endDate: endOfDay,
      );

      // Step 4: Return workouts
      return workoutsResult.fold(
        (error) {
          debugPrint('❌ [HomeRepository] Failed to fetch workouts: ${error.message}');
          return left(error);
        },
        (workouts) {
          debugPrint('✅ [HomeRepository] Fetched ${workouts.length} workouts from HealthService');

          if (workouts.isEmpty) {
            debugPrint('📭 [HomeRepository] No workouts found for ${date.toString().split(' ')[0]}');
            return left(AppException.noData(
              'No workouts found for ${date.toString().split(' ')[0]}',
            ));
          }

          debugPrint('🎉 [HomeRepository] Successfully fetched ${workouts.length} workouts');
          for (final workout in workouts) {
            debugPrint('   - ${workout.workoutType.displayName}: ${workout.duration}');
          }

          return right(workouts);
        },
      );
    } on Exception catch (e) {
      debugPrint('💥 [HomeRepository] Exception caught: ${e.toString()}');
      return left(
        AppException.health(
          'Failed to get workouts: ${e.toString()}',
        ),
      );
    }
  }

  /// Reset permission cache (for testing or manual refresh)
  void resetPermissionCache() {
    debugPrint('🔄 [HomeRepository] Resetting permission cache');
    _permissionsChecked = false;
    _permissionsGranted = false;
  }
}
