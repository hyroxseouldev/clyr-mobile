// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'enrollment_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EnrollmentEntity {

 String get id; String get userId; String get programId; DateTime get startDate; EnrollmentStatus get status; DateTime get createdAt;
/// Create a copy of EnrollmentEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EnrollmentEntityCopyWith<EnrollmentEntity> get copyWith => _$EnrollmentEntityCopyWithImpl<EnrollmentEntity>(this as EnrollmentEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EnrollmentEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.programId, programId) || other.programId == programId)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,userId,programId,startDate,status,createdAt);

@override
String toString() {
  return 'EnrollmentEntity(id: $id, userId: $userId, programId: $programId, startDate: $startDate, status: $status, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $EnrollmentEntityCopyWith<$Res>  {
  factory $EnrollmentEntityCopyWith(EnrollmentEntity value, $Res Function(EnrollmentEntity) _then) = _$EnrollmentEntityCopyWithImpl;
@useResult
$Res call({
 String id, String userId, String programId, DateTime startDate, EnrollmentStatus status, DateTime createdAt
});




}
/// @nodoc
class _$EnrollmentEntityCopyWithImpl<$Res>
    implements $EnrollmentEntityCopyWith<$Res> {
  _$EnrollmentEntityCopyWithImpl(this._self, this._then);

  final EnrollmentEntity _self;
  final $Res Function(EnrollmentEntity) _then;

/// Create a copy of EnrollmentEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? programId = null,Object? startDate = null,Object? status = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,programId: null == programId ? _self.programId : programId // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as EnrollmentStatus,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [EnrollmentEntity].
extension EnrollmentEntityPatterns on EnrollmentEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EnrollmentEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EnrollmentEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EnrollmentEntity value)  $default,){
final _that = this;
switch (_that) {
case _EnrollmentEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EnrollmentEntity value)?  $default,){
final _that = this;
switch (_that) {
case _EnrollmentEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  String programId,  DateTime startDate,  EnrollmentStatus status,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EnrollmentEntity() when $default != null:
return $default(_that.id,_that.userId,_that.programId,_that.startDate,_that.status,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  String programId,  DateTime startDate,  EnrollmentStatus status,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _EnrollmentEntity():
return $default(_that.id,_that.userId,_that.programId,_that.startDate,_that.status,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  String programId,  DateTime startDate,  EnrollmentStatus status,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _EnrollmentEntity() when $default != null:
return $default(_that.id,_that.userId,_that.programId,_that.startDate,_that.status,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc


class _EnrollmentEntity implements EnrollmentEntity {
  const _EnrollmentEntity({required this.id, required this.userId, required this.programId, required this.startDate, required this.status, required this.createdAt});
  

@override final  String id;
@override final  String userId;
@override final  String programId;
@override final  DateTime startDate;
@override final  EnrollmentStatus status;
@override final  DateTime createdAt;

/// Create a copy of EnrollmentEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EnrollmentEntityCopyWith<_EnrollmentEntity> get copyWith => __$EnrollmentEntityCopyWithImpl<_EnrollmentEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EnrollmentEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.programId, programId) || other.programId == programId)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,userId,programId,startDate,status,createdAt);

@override
String toString() {
  return 'EnrollmentEntity(id: $id, userId: $userId, programId: $programId, startDate: $startDate, status: $status, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$EnrollmentEntityCopyWith<$Res> implements $EnrollmentEntityCopyWith<$Res> {
  factory _$EnrollmentEntityCopyWith(_EnrollmentEntity value, $Res Function(_EnrollmentEntity) _then) = __$EnrollmentEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, String programId, DateTime startDate, EnrollmentStatus status, DateTime createdAt
});




}
/// @nodoc
class __$EnrollmentEntityCopyWithImpl<$Res>
    implements _$EnrollmentEntityCopyWith<$Res> {
  __$EnrollmentEntityCopyWithImpl(this._self, this._then);

  final _EnrollmentEntity _self;
  final $Res Function(_EnrollmentEntity) _then;

/// Create a copy of EnrollmentEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? programId = null,Object? startDate = null,Object? status = null,Object? createdAt = null,}) {
  return _then(_EnrollmentEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,programId: null == programId ? _self.programId : programId // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as EnrollmentStatus,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
