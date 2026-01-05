import 'package:clyr_mobile/src/core/storage/storage.dart';
import 'package:clyr_mobile/src/core/supabase/supabase_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'storage_provider.g.dart';

/// 스토리지 서비스 프로바이더;
@riverpod
StorageService storageService(Ref ref) {
  final supabase = ref.watch(supabaseClientProvider);
  return StorageService(storage: supabase.storage);
}

/// 스토리지 버킷 이름
class StorageBuckets {
  static const String images = 'images';
  static const String profiles = 'profiles';
  static const String workouts = 'workouts';
}
