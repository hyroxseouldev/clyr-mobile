// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDto _$OrderDtoFromJson(Map<String, dynamic> json) => OrderDto(
  id: json['id'] as String,
  buyerId: json['buyer_id'] as String,
  programId: json['program_id'] as String,
  coachId: json['coach_id'] as String,
  amount: json['amount'] as num,
  status: json['status'] as String,
  paymentKey: json['payment_key'] as String?,
  createdAt: DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$OrderDtoToJson(OrderDto instance) => <String, dynamic>{
  'id': instance.id,
  'buyer_id': instance.buyerId,
  'program_id': instance.programId,
  'coach_id': instance.coachId,
  'amount': instance.amount,
  'status': instance.status,
  'payment_key': instance.paymentKey,
  'created_at': instance.createdAt.toIso8601String(),
};
