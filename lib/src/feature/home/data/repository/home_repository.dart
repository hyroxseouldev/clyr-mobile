import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:clyr_mobile/src/core/data/data_source.dart';
import 'package:clyr_mobile/src/core/health/connected_device_service.dart';
import 'package:clyr_mobile/src/core/error/exception.dart';
import 'package:clyr_mobile/src/core/health/health_sync_store_service.dart';
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

  /// Get single workout by ID from HealthKit
  FutureEither<HealthWorkoutData?> getWorkoutById(String id);

  /// Scan connected device workouts and write them as app workouts.
  FutureEither<int> syncConnectedDeviceWorkouts();
}

/// 홈 데이터 소스 구현체
class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl({
    required CoreDataSource dataSource,
    required HealthService healthService,
    required PermissionService permissionService,
    required ConnectedDeviceService connectedDeviceService,
    required HealthSyncStoreService healthSyncStoreService,
  }) : _dataSource = dataSource,
       _healthService = healthService,
       _permissionService = permissionService,
       _connectedDeviceService = connectedDeviceService,
       _healthSyncStoreService = healthSyncStoreService;

  final CoreDataSource _dataSource;
  final HealthService _healthService;
  final PermissionService _permissionService;
  final ConnectedDeviceService _connectedDeviceService;
  final HealthSyncStoreService _healthSyncStoreService;

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
      return left(AppException.home(e.toString()));
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
      return left(AppException.home(e.toString()));
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
      return left(AppException.home(e.toString()));
    }
  }

  @override
  FutureEither<List<HealthWorkoutData>> getWorkoutsByDate(DateTime date) async {
    debugPrint(
      '📅 [HomeRepository] Fetching workouts for date: ${date.toString().split(' ')[0]}',
    );

    try {
      // Step 1: Validate date - check if future date
      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);
      final queryDate = DateTime(date.year, date.month, date.day);

      if (queryDate.isAfter(today)) {
        debugPrint(
          '⏭️ [HomeRepository] Future date detected, returning empty list',
        );
        return right(const <HealthWorkoutData>[]);
      }

      // Step 2: Check permissions (with cache)
      if (!_permissionsChecked) {
        debugPrint('🔐 [HomeRepository] Checking health permissions...');
        final permissionsResult = await _permissionService
            .areHealthPermissionsGranted();

        permissionsResult.fold(
          (error) {
            debugPrint(
              '❌ [HomeRepository] Permission check failed: ${error.message}',
            );
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
          return left(
            AppException.permission('Health permissions not granted'),
          );
        }
      } else {
        debugPrint(
          '♻️ [HomeRepository] Using cached permission state: $_permissionsGranted',
        );
      }

      // Step 2: Get start and end of day
      final startOfDay = DateTime(date.year, date.month, date.day);
      final endOfDay = DateTime(date.year, date.month, date.day, 23, 59, 59);
      debugPrint('🕐 [HomeRepository] Query range: $startOfDay to $endOfDay');

      // Step 3: Fetch workouts from HealthService
      debugPrint('🔍 [HomeRepository] Fetching workouts from HealthService...');
      final selectedSourceIds = await _connectedDeviceService
          .getSelectedSourceIds();

      final workoutsResult = await _healthService.getWorkouts(
        startDate: startOfDay,
        endDate: endOfDay,
        sourceIds: selectedSourceIds,
      );

      // Step 4: Return workouts
      return workoutsResult.fold(
        (error) {
          debugPrint(
            '❌ [HomeRepository] Failed to fetch workouts: ${error.message}',
          );
          return left(error);
        },
        (workouts) {
          debugPrint(
            '✅ [HomeRepository] Fetched ${workouts.length} workouts from HealthService',
          );

          if (workouts.isEmpty) {
            debugPrint(
              '📭 [HomeRepository] No workouts found for ${date.toString().split(' ')[0]}',
            );
            return left(
              AppException.noData(
                'No workouts found for ${date.toString().split(' ')[0]}',
              ),
            );
          }

          debugPrint(
            '🎉 [HomeRepository] Successfully fetched ${workouts.length} workouts',
          );
          for (final workout in workouts) {
            debugPrint(
              '   - ${workout.workoutType.displayName}: ${workout.duration}',
            );
          }

          return right(workouts);
        },
      );
    } on Exception catch (e) {
      debugPrint('💥 [HomeRepository] Exception caught: ${e.toString()}');
      return left(
        AppException.health('Failed to get workouts: ${e.toString()}'),
      );
    }
  }

  /// Reset permission cache (for testing or manual refresh)
  void resetPermissionCache() {
    debugPrint('🔄 [HomeRepository] Resetting permission cache');
    _permissionsChecked = false;
    _permissionsGranted = false;
  }

  @override
  FutureEither<HealthWorkoutData?> getWorkoutById(String id) async {
    debugPrint('💪 [HomeRepository] Fetching workout by ID: $id');

    try {
      // Fetch recent workouts (last 30 days) to find the matching ID
      final endDate = DateTime.now();
      final startDate = endDate.subtract(const Duration(days: 30));

      debugPrint('🔍 [HomeRepository] Query range: $startDate to $endDate');

      // Check permissions first
      if (!_permissionsChecked) {
        debugPrint('🔐 [HomeRepository] Checking health permissions...');
        final permissionsResult = await _permissionService
            .areHealthPermissionsGranted();

        final hasPermission = permissionsResult.fold(
          (error) {
            debugPrint(
              '❌ [HomeRepository] Permission check failed: ${error.message}',
            );
            return false;
          },
          (granted) {
            _permissionsChecked = true;
            _permissionsGranted = granted;
            debugPrint('✅ [HomeRepository] Permissions granted: $granted');
            return granted;
          },
        );

        if (!hasPermission) {
          debugPrint('⛔ [HomeRepository] Health permissions not granted');
          return left(
            AppException.permission('Health permissions not granted'),
          );
        }
      }

      // Fetch workouts from HealthService
      final selectedSourceIds = await _connectedDeviceService
          .getSelectedSourceIds();

      final workoutsResult = await _healthService.getWorkouts(
        startDate: startDate,
        endDate: endDate,
        sourceIds: selectedSourceIds,
      );

      return workoutsResult.fold(
        (error) {
          debugPrint(
            '❌ [HomeRepository] Failed to fetch workouts: ${error.message}',
          );
          return left(error);
        },
        (workouts) {
          final workout = workouts.cast<HealthWorkoutData?>().firstWhere(
            (w) => w?.id == id,
            orElse: () => null,
          );

          if (workout == null) {
            debugPrint('📭 [HomeRepository] Workout not found: $id');
            return right(null);
          }

          debugPrint('✅ [HomeRepository] Workout found:');
          debugPrint('   - ID: ${workout.id}');
          debugPrint('   - Type: ${workout.workoutType}');
          debugPrint('   - Duration: ${workout.duration}');
          debugPrint('   - Start: ${workout.startTime}');
          debugPrint('   - End: ${workout.endTime}');
          debugPrint('   - Avg HR: ${workout.avgHeartRate} bpm');
          debugPrint('   - Distance: ${workout.totalDistance} m');
          debugPrint('   - Calories: ${workout.totalEnergyBurned} kcal');
          debugPrint('   - Metadata: ${workout.metadata}');
          return right(workout);
        },
      );
    } on Exception catch (e) {
      debugPrint('❌ [HomeRepository] Error fetching workout by ID: $e');
      return left(
        AppException.health('Failed to fetch workout: ${e.toString()}'),
      );
    }
  }

  @override
  FutureEither<int> syncConnectedDeviceWorkouts() async {
    debugPrint('🔄 [HomeRepository] Starting connected device sync');

    try {
      final now = DateTime.now();
      final startDate = now.subtract(const Duration(days: 30));

      final lastSyncedAt = await _healthSyncStoreService.getLastSyncedAt();
      if (lastSyncedAt != null && now.difference(lastSyncedAt).inMinutes < 10) {
        debugPrint('⏭️ [HomeRepository] Skip sync (recently synced)');
        return right(0);
      }

      final selectedSourceIds = await _connectedDeviceService
          .getSelectedSourceIds();
      if (selectedSourceIds.isEmpty) {
        debugPrint('📭 [HomeRepository] No selected device sources');
        return right(0);
      }

      final readGranted = await _permissionService
          .areHealthReadPermissionsGranted();
      final hasReadPermission = await readGranted.fold((_) async {
        final requestResult = await _permissionService
            .requestHealthReadPermissions();
        return requestResult.fold((_) => false, (result) {
          return result.values.every((status) => status.isGranted);
        });
      }, (granted) async => granted);

      if (!hasReadPermission) {
        return left(
          AppException.permission('Health read permission not granted'),
        );
      }

      final writeGranted = await _permissionService
          .isHealthWorkoutWritePermissionGranted();
      final hasWritePermission = await writeGranted.fold((_) async {
        final requestResult = await _permissionService
            .requestHealthWorkoutWritePermission();
        return requestResult.fold((_) => false, (status) => status.isGranted);
      }, (granted) async => granted);

      if (!hasWritePermission) {
        return left(
          AppException.permission(
            'Health workout write permission not granted',
          ),
        );
      }

      final workoutsResult = await _healthService.getWorkouts(
        startDate: startDate,
        endDate: now,
        sourceIds: selectedSourceIds,
      );

      return await workoutsResult.fold(
        (error) async {
          if (error.message?.contains('No workouts found') ?? false) {
            await _healthSyncStoreService.setLastSyncedAt(now);
            return right(0);
          }

          return left(error);
        },
        (workouts) async {
          var syncedCount = 0;
          final sorted = [...workouts]
            ..sort((a, b) => a.startTime.compareTo(b.startTime));

          for (final workout in sorted) {
            final syncId =
                '${workout.id}_${workout.startTime.toIso8601String()}';
            final alreadySynced = await _healthSyncStoreService.isWorkoutSynced(
              syncId,
            );

            if (alreadySynced) {
              continue;
            }

            final writeResult = await _healthService.writeWorkout(
              workout: workout,
            );
            final isSuccess = writeResult.fold((_) => false, (_) => true);
            if (!isSuccess) {
              continue;
            }

            await _healthSyncStoreService.markWorkoutSynced(syncId);
            syncedCount++;
          }

          await _healthSyncStoreService.setLastSyncedAt(now);
          debugPrint('✅ [HomeRepository] Synced $syncedCount workouts');
          return right(syncedCount);
        },
      );
    } on Exception catch (e) {
      debugPrint('❌ [HomeRepository] Sync error: $e');
      return left(
        AppException.health('Failed to sync workouts: ${e.toString()}'),
      );
    }
  }
}
