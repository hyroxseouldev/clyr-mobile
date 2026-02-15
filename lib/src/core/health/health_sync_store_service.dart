abstract class HealthSyncStoreService {
  Future<void> markWorkoutSynced(String workoutId);

  Future<bool> isWorkoutSynced(String workoutId);

  Future<DateTime?> getLastSyncedAt();

  Future<void> setLastSyncedAt(DateTime dateTime);
}
