import 'package:clyr_mobile/src/feature/order/data/dto/order_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_entity.freezed.dart';

@freezed
abstract class OrderEntity with _$OrderEntity {
  const factory OrderEntity({
    required String id,
    required String userId,
    required String productName,
    required int quantity,
    required int totalPrice,
    required String status,
    required DateTime createdAt,
  }) = _OrderEntity;

  factory OrderEntity.fromDto(OrderDto dto) {
    return OrderEntity(
      id: dto.id,
      userId: dto.userId,
      productName: dto.productName,
      quantity: dto.quantity,
      totalPrice: dto.totalPrice,
      status: dto.status,
      createdAt: dto.createdAt,
    );
  }
}
