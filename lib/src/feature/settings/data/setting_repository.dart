import 'package:clyr_mobile/src/core/exception/exception.dart';
import 'package:clyr_mobile/src/core/supabase/supabase_provider.dart';
import 'package:clyr_mobile/src/core/typedef/typedef.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sb;

part 'setting_repository.g.dart';

@Riverpod(keepAlive: true)
SettingRepository settingRepository(Ref ref) {
  final supabase = ref.watch(supabaseClientProvider);
  return SettingRepositoryImpl(supabase: supabase);
}

abstract interface class SettingRepository {
  FutureEither<AppException, void> getOrders();
  FutureEither<AppException, void> getMemberships();
}

class SettingRepositoryImpl implements SettingRepository {
  final sb.SupabaseClient supabase;
  SettingRepositoryImpl({required this.supabase});

  @override
  FutureEither<AppException, void> getOrders() {
    return supabase.from('orders').select().map((e) => OrderDto.fromJson(e));
  }

  @override
  FutureEither<AppException, void> getEnrollments() {
    return supabase
        .from('enrollments')
        .select()
        .map((e) => EnrollmentDto.fromJson(e));
  }
}
