// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDto _$OrderDtoFromJson(Map<String, dynamic> json) => OrderDto(
  id: json['id'] as String,
  userId: json['userId'] as String,
  productName: json['productName'] as String,
  quantity: (json['quantity'] as num).toInt(),
  totalPrice: (json['totalPrice'] as num).toInt(),
  status: json['status'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$OrderDtoToJson(OrderDto instance) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'productName': instance.productName,
  'quantity': instance.quantity,
  'totalPrice': instance.totalPrice,
  'status': instance.status,
  'createdAt': instance.createdAt.toIso8601String(),
};
