import 'package:json_annotation/json_annotation.dart';
import 'package:clyr_mobile/src/feature/order/infra/entity/order_entity.dart';

part 'order_dto.g.dart';

@JsonSerializable()
class OrderDto {
  final String id;
  final String userId;
  final String productName;
  final int quantity;
  final int totalPrice;
  final String status;
  final DateTime createdAt;

  OrderDto({
    required this.id,
    required this.userId,
    required this.productName,
    required this.quantity,
    required this.totalPrice,
    required this.status,
    required this.createdAt,
  });

  factory OrderDto.fromJson(Map<String, dynamic> json) =>
      _$OrderDtoFromJson(json);
  Map<String, dynamic> toJson() => _$OrderDtoToJson(this);

  OrderEntity toEntity() => OrderEntity.fromDto(this);
}
