import 'dart:developer';

import 'package:clyr_mobile/src/core/data/dto.dart';
import 'package:clyr_mobile/src/core/error/exception.dart';
import 'package:clyr_mobile/src/core/supabase/supabase_provider.dart';
import 'package:clyr_mobile/src/core/util/type_defs.dart';
import 'package:clyr_mobile/src/feature/settings/infra/entity/enrollment_entity.dart';
import 'package:clyr_mobile/src/feature/settings/infra/entity/order_entity.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sb;

part 'setting_repository.g.dart';

@Riverpod(keepAlive: true)
SettingRepository settingRepository(Ref ref) {
  final supabase = ref.watch(supabaseClientProvider);
  return SettingRepositoryImpl(supabase: supabase);
}

/// 주문 목록 조회 파라미터
typedef GetOrdersParams = ({int page, int limit});

/// 등록 목록 조회 파라미터
typedef GetEnrollmentsParams = ({int page, int limit});

abstract interface class SettingRepository {
  FutureEither<List<OrderEntity>> getOrders(
    GetOrdersParams params,
  );
  FutureEither<List<EnrollmentEntity>> getEnrollments(
    GetEnrollmentsParams params,
  );
}

class SettingRepositoryImpl implements SettingRepository {
  final sb.SupabaseClient supabase;
  SettingRepositoryImpl({required this.supabase});

  @override
  FutureEither<List<OrderEntity>> getOrders(
    GetOrdersParams params,
  ) async {
    final userId = supabase.auth.currentUser?.id;
    if (userId == null) {
      return left(AppException.order('User not authenticated'));
    }

    try {
      final from = params.page * params.limit;
      final to = from + params.limit - 1;

      final response = await supabase
          .from('orders')
          .select()
          .eq('buyer_id', userId)
          .order('created_at', ascending: false)
          .range(from, to);

      log(
        'getOrders: page=${params.page}, limit=${params.limit}, count=${response.length}',
      );

      final orders = response.map((json) {
        final dto = OrdersDto.fromJson(json);
        return dto.toEntity();
      }).toList();

      return right(orders);
    } catch (e) {
      log('getOrders: error = $e');
      return left(AppException.order(e.toString()));
    }
  }

  @override
  FutureEither<List<EnrollmentEntity>> getEnrollments(
    GetEnrollmentsParams params,
  ) async {
    final userId = supabase.auth.currentUser?.id;
    if (userId == null) {
      return left(AppException.order('User not authenticated'));
    }

    try {
      final from = params.page * params.limit;
      final to = from + params.limit - 1;

      final response = await supabase
          .from('enrollments')
          .select()
          .eq('user_id', userId)
          .order('created_at', ascending: false)
          .range(from, to);

      log(
        'getEnrollments: page=${params.page}, limit=${params.limit}, count=${response.length}',
      );

      final enrollments = response.map((json) {
        final dto = EnrollmentsDto.fromJson(json);
        return dto.toEntity();
      }).toList();

      return right(enrollments);
    } catch (e) {
      log('getEnrollments: error = $e');
      return left(AppException.order(e.toString()));
    }
  }
}
