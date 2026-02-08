import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:clyr_mobile/src/core/error/exception.dart';
import 'package:clyr_mobile/src/core/health/entity/health_workout_data.dart';
import 'package:clyr_mobile/src/core/util/type_defs.dart';
import 'package:clyr_mobile/src/feature/home/data/repository/home_repository.dart';
import 'package:clyr_mobile/src/feature/home/infra/entity/home_entity.dart';

/// Test repository with mock HealthKit data for simulator testing
class TestHomeRepository implements HomeRepository {
  /// Cache for mock workouts to ensure consistent IDs across calls
  final Map<int, List<HealthWorkoutData>> _mockWorkoutsCache = {};

  /// Get or generate cached mock workouts for a specific day difference
  List<HealthWorkoutData> _getCachedMockWorkouts(int dayDiff) {
    return _mockWorkoutsCache.putIfAbsent(dayDiff, () => _generateMockWorkouts(dayDiff));
  }

  /// Mock today's session data
  @override
  FutureEither<TodaysSessionData> getTodaysSessionData({
    required DateTime date,
  }) async {
    await Future.delayed(const Duration(milliseconds: 500));

    final mockSections = [
      BlueprintSectionEntity(
        id: '1',
        title: 'Warm Up',
        content: '<p>Light cardio and stretching</p>',
        orderIndex: 1,
        sectionId: 'warmup',
        isRecordable: false,
        isCompleted: true,
      ),
      BlueprintSectionEntity(
        id: '2',
        title: 'Main Workout',
        content: '<p>Strength training focus</p>',
        orderIndex: 2,
        sectionId: 'main',
        isRecordable: true,
        isCompleted: false,
      ),
      BlueprintSectionEntity(
        id: '3',
        title: 'Cool Down',
        content: '<p>Stretching and relaxation</p>',
        orderIndex: 3,
        sectionId: 'cooldown',
        isRecordable: false,
        isCompleted: false,
      ),
    ];

    final sessionData = (
      sections: mockSections,
      notes: '오늘은 힘든 훈련이지만, 여러분은 할 수 있습니다! 💪',
      coachName: 'Kim Coach',
    );

    return right(sessionData);
  }

  /// Mock active program
  @override
  FutureEither<ActiveProgramEntity> getActiveProgram() async {
    await Future.delayed(const Duration(milliseconds: 300));

    final program = ActiveProgramEntity(
      id: 'test-program-1',
      title: '12주 벌크업 프로그램',
      programImage: 'https://picsum.photos/400/300',
      mainImageList: ['https://picsum.photos/400/300'],
      description: '근성장을 위한 12주 프로그램',
      startDate: DateTime.now().subtract(const Duration(days: 30)),
      endDate: DateTime.now().add(const Duration(days: 54)),
      coachProfileUrl: 'https://i.pravatar.cc/150?img=12',
      coachName: 'Kim Coach',
    );

    return right(program);
  }

  /// Mock section record creation
  @override
  FutureEither<void> createSectionRecord({
    required String sectionId,
    required String sectionItemId,
    Map<String, dynamic>? content,
  }) async {
    await Future.delayed(const Duration(milliseconds: 500));
    debugPrint('📝 [TestHomeRepository] Section record created: $sectionId');
    return right(null);
  }

  /// Mock HealthKit workout data
  @override
  FutureEither<List<HealthWorkoutData>> getWorkoutsByDate(DateTime date) async {
    await Future.delayed(const Duration(milliseconds: 800));
    debugPrint('📅 [TestHomeRepository] Fetching mock workouts for: ${date.toString().split(' ')[0]}');

    // Validate date - check if future date (same as HomeRepositoryImpl)
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final queryDate = DateTime(date.year, date.month, date.day);

    if (queryDate.isAfter(today)) {
      // Future date - no workouts
      debugPrint('⏭️ [TestHomeRepository] Future date detected, returning empty list');
      return right(const <HealthWorkoutData>[]);
    }

    // Get cached mock workouts based on day difference
    final dayDiff = DateTime.now().difference(date).inDays;
    final mockWorkouts = _getCachedMockWorkouts(dayDiff);

    if (mockWorkouts.isEmpty) {
      debugPrint('📭 [TestHomeRepository] No mock workouts for this date');
      return left(AppException.noData('No workouts found for this date'));
    }

    debugPrint('✅ [TestHomeRepository] Returning ${mockWorkouts.length} mock workouts');
    for (final workout in mockWorkouts) {
      debugPrint('   - ${workout.workoutType.displayName}: ${workout.duration}');
    }

    return right(mockWorkouts);
  }

  /// Generate mock workouts based on day difference
  List<HealthWorkoutData> _generateMockWorkouts(int dayDiff) {
    // Different workout patterns for different days
    final today = DateTime.now();
    final baseDate = DateTime(today.year, today.month, today.day);

    switch (dayDiff % 7) {
      case 0: // Today - running
        return [
          HealthWorkoutData(
            id: 'mock-${today.millisecondsSinceEpoch}-1',
            workoutType: HealthWorkoutType.running,
            startTime: baseDate.add(const Duration(hours: 7)),
            endTime: baseDate.add(const Duration(hours: 7, minutes: 45)),
            duration: const Duration(minutes: 45),
            totalEnergyBurned: 350,
            totalDistance: 5000.0,
          ),
        ];

      case 1: // Yesterday - strength training
        return [
          HealthWorkoutData(
            id: 'mock-${today.millisecondsSinceEpoch}-1',
            workoutType: HealthWorkoutType.fitness,
            startTime: baseDate.subtract(const Duration(days: 1)).add(const Duration(hours: 18)),
            endTime: baseDate.subtract(const Duration(days: 1)).add(const Duration(hours: 19, minutes: 15)),
            duration: const Duration(minutes: 75),
            totalEnergyBurned: 420,
            totalDistance: null,
          ),
        ];

      case 2: // 2 days ago - cycling
        return [
          HealthWorkoutData(
            id: 'mock-${today.millisecondsSinceEpoch}-1',
            workoutType: HealthWorkoutType.cycling,
            startTime: baseDate.subtract(const Duration(days: 2)).add(const Duration(hours: 6)),
            endTime: baseDate.subtract(const Duration(days: 2)).add(const Duration(hours: 7, minutes: 30)),
            duration: const Duration(minutes: 90),
            totalEnergyBurned: 550,
            totalDistance: 25000.0,
          ),
        ];

      case 3: // 3 days ago - no workouts
        return [];

      case 4: // 4 days ago - walking
        return [
          HealthWorkoutData(
            id: 'mock-${today.millisecondsSinceEpoch}-1',
            workoutType: HealthWorkoutType.walking,
            startTime: baseDate.subtract(const Duration(days: 4)).add(const Duration(hours: 12)),
            endTime: baseDate.subtract(const Duration(days: 4)).add(const Duration(hours: 12, minutes: 45)),
            duration: const Duration(minutes: 45),
            totalEnergyBurned: 180,
            totalDistance: 3500.0,
          ),
        ];

      case 5: // 5 days ago - HIIT
        return [
          HealthWorkoutData(
            id: 'mock-${today.millisecondsSinceEpoch}-1',
            workoutType: HealthWorkoutType.fitness,
            startTime: baseDate.subtract(const Duration(days: 5)).add(const Duration(hours: 19)),
            endTime: baseDate.subtract(const Duration(days: 5)).add(const Duration(hours: 19, minutes: 35)),
            duration: const Duration(minutes: 35),
            totalEnergyBurned: 380,
            totalDistance: null,
          ),
        ];

      default: // Other days - swimming or hiking
        return [
          if (dayDiff % 2 == 0)
            HealthWorkoutData(
              id: 'mock-${today.millisecondsSinceEpoch}-1',
              workoutType: HealthWorkoutType.swimming,
              startTime: baseDate.subtract(Duration(days: dayDiff)).add(const Duration(hours: 8)),
              endTime: baseDate.subtract(Duration(days: dayDiff)).add(const Duration(hours: 9)),
              duration: const Duration(minutes: 60),
              totalEnergyBurned: 450,
              totalDistance: 1500.0,
            )
          else
            HealthWorkoutData(
              id: 'mock-${today.millisecondsSinceEpoch}-1',
              workoutType: HealthWorkoutType.hiking,
              startTime: baseDate.subtract(Duration(days: dayDiff)).add(const Duration(hours: 7)),
              endTime: baseDate.subtract(Duration(days: dayDiff)).add(const Duration(hours: 10, minutes: 30)),
              duration: const Duration(minutes: 210),
              totalEnergyBurned: 780,
              totalDistance: 8500.0,
            ),
        ];
    }
  }

  @override
  FutureEither<HealthWorkoutData?> getWorkoutById(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));
    debugPrint('💪 [TestHomeRepository] Fetching workout by ID: $id');

    // Search through cached mock workouts
    for (int dayDiff = 0; dayDiff < 7; dayDiff++) {
      final workouts = _getCachedMockWorkouts(dayDiff);
      final workout = workouts.cast<HealthWorkoutData?>().firstWhere(
        (w) => w?.id == id,
        orElse: () => null,
      );

      if (workout != null) {
        debugPrint('✅ [TestHomeRepository] Workout found: ${workout.workoutType} (${workout.id})');
        return right(workout);
      }
    }

    debugPrint('📭 [TestHomeRepository] Workout not found: $id');
    debugPrint('   Searched ${_mockWorkoutsCache.length} cached days with ${_mockWorkoutsCache.values.fold(0, (sum, list) => sum + list.length)} total workouts');
    return right(null);
  }
}
