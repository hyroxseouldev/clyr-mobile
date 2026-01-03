import 'package:clyr_mobile/src/core/exception/exception.dart';
import 'package:clyr_mobile/src/core/supabase/supabase_provider.dart';
import 'package:clyr_mobile/src/core/typedef/typedef.dart';
import 'package:clyr_mobile/src/feature/order/data/dto/order_dto.dart';
import 'package:clyr_mobile/src/feature/order/infra/entity/order_entity.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sb;

part 'order_repository.g.dart';

@Riverpod(keepAlive: true)
OrderRepository orderRepository(Ref ref) {
  final supabase = ref.watch(supabaseClientProvider);
  return OrderRepositoryImpl(supabase: supabase);
}

abstract interface class OrderRepository {
  FutureEither<OrderException, List<OrderEntity>> getOrders();
}

class OrderRepositoryImpl implements OrderRepository {
  final sb.SupabaseClient supabase;
  OrderRepositoryImpl({required this.supabase});

  @override
  FutureEither<OrderException, List<OrderEntity>> getOrders() async {
    try {
      final response = await supabase.from('orders').select();
      final List<dynamic> data = response as List<dynamic>;
      return right(
        data.map((e) => OrderEntity.fromDto(OrderDto.fromJson(e))).toList(),
      );
    } catch (e) {
      return left(OrderException(code: 'unknown', message: e.toString()));
    }
  }
}
