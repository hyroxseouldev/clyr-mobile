import 'package:clyr_mobile/src/core/data/dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_entity.freezed.dart';

/// 주문 상태
enum OrderStatus {
  @JsonValue('PENDING')
  pending,
  @JsonValue('COMPLETED')
  completed,
  @JsonValue('CANCELLED')
  cancelled;

  static OrderStatus fromString(String? value) {
    if (value == null) return OrderStatus.pending;
    return switch (value.toUpperCase()) {
      'PENDING' => OrderStatus.pending,
      'COMPLETED' => OrderStatus.completed,
      'CANCELLED' => OrderStatus.cancelled,
      _ => throw ArgumentError('Invalid OrderStatus: $value'),
    };
  }
}

/// 주문 엔티티
@freezed
abstract class OrderEntity with _$OrderEntity {
  const factory OrderEntity({
    required String id,
    required String buyerId,
    required String programId,
    required String coachId,
    required double amount,
    required OrderStatus status,
    String? paymentKey,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) = _OrderEntity;

  factory OrderEntity.fromDto(OrdersDto dto) {
    return OrderEntity(
      id: dto.id,
      buyerId: dto.buyerId,
      programId: dto.programId,
      coachId: dto.coachId,
      amount: dto.amount?.toDouble() ?? 0.0,
      status: OrderStatus.fromString(dto.status),
      paymentKey: dto.paymentKey,
      createdAt: dto.createdAt,
      updatedAt: dto.updatedAt,
    );
  }
}
