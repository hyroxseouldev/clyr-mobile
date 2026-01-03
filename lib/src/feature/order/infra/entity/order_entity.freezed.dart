// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OrderEntity {

 String get id; String get userId; String get productName; int get quantity; int get totalPrice; String get status; DateTime get createdAt;
/// Create a copy of OrderEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderEntityCopyWith<OrderEntity> get copyWith => _$OrderEntityCopyWithImpl<OrderEntity>(this as OrderEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.totalPrice, totalPrice) || other.totalPrice == totalPrice)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,userId,productName,quantity,totalPrice,status,createdAt);

@override
String toString() {
  return 'OrderEntity(id: $id, userId: $userId, productName: $productName, quantity: $quantity, totalPrice: $totalPrice, status: $status, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $OrderEntityCopyWith<$Res>  {
  factory $OrderEntityCopyWith(OrderEntity value, $Res Function(OrderEntity) _then) = _$OrderEntityCopyWithImpl;
@useResult
$Res call({
 String id, String userId, String productName, int quantity, int totalPrice, String status, DateTime createdAt
});




}
/// @nodoc
class _$OrderEntityCopyWithImpl<$Res>
    implements $OrderEntityCopyWith<$Res> {
  _$OrderEntityCopyWithImpl(this._self, this._then);

  final OrderEntity _self;
  final $Res Function(OrderEntity) _then;

/// Create a copy of OrderEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? productName = null,Object? quantity = null,Object? totalPrice = null,Object? status = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,totalPrice: null == totalPrice ? _self.totalPrice : totalPrice // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderEntity].
extension OrderEntityPatterns on OrderEntity {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderEntity() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderEntity value)  $default,){
final _that = this;
switch (_that) {
case _OrderEntity():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderEntity value)?  $default,){
final _that = this;
switch (_that) {
case _OrderEntity() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  String productName,  int quantity,  int totalPrice,  String status,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderEntity() when $default != null:
return $default(_that.id,_that.userId,_that.productName,_that.quantity,_that.totalPrice,_that.status,_that.createdAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  String productName,  int quantity,  int totalPrice,  String status,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _OrderEntity():
return $default(_that.id,_that.userId,_that.productName,_that.quantity,_that.totalPrice,_that.status,_that.createdAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  String productName,  int quantity,  int totalPrice,  String status,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _OrderEntity() when $default != null:
return $default(_that.id,_that.userId,_that.productName,_that.quantity,_that.totalPrice,_that.status,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc


class _OrderEntity implements OrderEntity {
  const _OrderEntity({required this.id, required this.userId, required this.productName, required this.quantity, required this.totalPrice, required this.status, required this.createdAt});
  

@override final  String id;
@override final  String userId;
@override final  String productName;
@override final  int quantity;
@override final  int totalPrice;
@override final  String status;
@override final  DateTime createdAt;

/// Create a copy of OrderEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderEntityCopyWith<_OrderEntity> get copyWith => __$OrderEntityCopyWithImpl<_OrderEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.totalPrice, totalPrice) || other.totalPrice == totalPrice)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,userId,productName,quantity,totalPrice,status,createdAt);

@override
String toString() {
  return 'OrderEntity(id: $id, userId: $userId, productName: $productName, quantity: $quantity, totalPrice: $totalPrice, status: $status, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$OrderEntityCopyWith<$Res> implements $OrderEntityCopyWith<$Res> {
  factory _$OrderEntityCopyWith(_OrderEntity value, $Res Function(_OrderEntity) _then) = __$OrderEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, String productName, int quantity, int totalPrice, String status, DateTime createdAt
});




}
/// @nodoc
class __$OrderEntityCopyWithImpl<$Res>
    implements _$OrderEntityCopyWith<$Res> {
  __$OrderEntityCopyWithImpl(this._self, this._then);

  final _OrderEntity _self;
  final $Res Function(_OrderEntity) _then;

/// Create a copy of OrderEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? productName = null,Object? quantity = null,Object? totalPrice = null,Object? status = null,Object? createdAt = null,}) {
  return _then(_OrderEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,totalPrice: null == totalPrice ? _self.totalPrice : totalPrice // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
