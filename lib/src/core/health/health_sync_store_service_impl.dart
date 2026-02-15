import 'dart:convert';

import 'package:clyr_mobile/src/core/health/health_sync_store_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class HealthSyncStoreServiceImpl implements HealthSyncStoreService {
  HealthSyncStoreServiceImpl({FlutterSecureStorage? storage})
    : _storage = storage ?? const FlutterSecureStorage();

  static const String _syncedWorkoutIdsKey = 'health_sync_synced_workout_ids';
  static const String _lastSyncedAtKey = 'health_sync_last_synced_at';
  static const int _maxStoredIds = 1000;

  final FlutterSecureStorage _storage;

  @override
  Future<void> markWorkoutSynced(String workoutId) async {
    final current = await _readSyncedWorkoutIds();
    if (current.contains(workoutId)) {
      return;
    }

    current.add(workoutId);

    if (current.length > _maxStoredIds) {
      current.removeRange(0, current.length - _maxStoredIds);
    }

    await _storage.write(key: _syncedWorkoutIdsKey, value: jsonEncode(current));
  }

  @override
  Future<bool> isWorkoutSynced(String workoutId) async {
    final current = await _readSyncedWorkoutIds();
    return current.contains(workoutId);
  }

  @override
  Future<DateTime?> getLastSyncedAt() async {
    final value = await _storage.read(key: _lastSyncedAtKey);
    if (value == null || value.isEmpty) {
      return null;
    }

    return DateTime.tryParse(value);
  }

  @override
  Future<void> setLastSyncedAt(DateTime dateTime) async {
    await _storage.write(
      key: _lastSyncedAtKey,
      value: dateTime.toIso8601String(),
    );
  }

  Future<List<String>> _readSyncedWorkoutIds() async {
    final raw = await _storage.read(key: _syncedWorkoutIdsKey);
    if (raw == null || raw.isEmpty) {
      return <String>[];
    }

    final decoded = jsonDecode(raw);
    if (decoded is! List) {
      return <String>[];
    }

    return decoded.whereType<String>().toList();
  }
}
