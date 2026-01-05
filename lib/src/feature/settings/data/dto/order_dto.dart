import 'package:json_annotation/json_annotation.dart';
import 'package:clyr_mobile/src/feature/settings/infra/entity/order_entity.dart';

part 'order_dto.g.dart';

@JsonSerializable()
class OrderDto {
  final String id;
  @JsonKey(name: 'buyer_id')
  final String buyerId;
  @JsonKey(name: 'program_id')
  final String programId;
  @JsonKey(name: 'coach_id')
  final String coachId;
  final num amount;
  final String status;
  @JsonKey(name: 'payment_key')
  final String? paymentKey;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  OrderDto({
    required this.id,
    required this.buyerId,
    required this.programId,
    required this.coachId,
    required this.amount,
    required this.status,
    this.paymentKey,
    required this.createdAt,
  });

  factory OrderDto.fromJson(Map<String, dynamic> json) =>
      _$OrderDtoFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDtoToJson(this);

  OrderEntity toEntity() => OrderEntity.fromDto(this);
}
