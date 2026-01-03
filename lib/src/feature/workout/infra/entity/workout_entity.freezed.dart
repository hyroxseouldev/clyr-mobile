// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WorkoutEntity {

 String get id; String get name; String get description; int get duration; int get calories; DateTime get createdAt;
/// Create a copy of WorkoutEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkoutEntityCopyWith<WorkoutEntity> get copyWith => _$WorkoutEntityCopyWithImpl<WorkoutEntity>(this as WorkoutEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkoutEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.calories, calories) || other.calories == calories)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,description,duration,calories,createdAt);

@override
String toString() {
  return 'WorkoutEntity(id: $id, name: $name, description: $description, duration: $duration, calories: $calories, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $WorkoutEntityCopyWith<$Res>  {
  factory $WorkoutEntityCopyWith(WorkoutEntity value, $Res Function(WorkoutEntity) _then) = _$WorkoutEntityCopyWithImpl;
@useResult
$Res call({
 String id, String name, String description, int duration, int calories, DateTime createdAt
});




}
/// @nodoc
class _$WorkoutEntityCopyWithImpl<$Res>
    implements $WorkoutEntityCopyWith<$Res> {
  _$WorkoutEntityCopyWithImpl(this._self, this._then);

  final WorkoutEntity _self;
  final $Res Function(WorkoutEntity) _then;

/// Create a copy of WorkoutEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,Object? duration = null,Object? calories = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int,calories: null == calories ? _self.calories : calories // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [WorkoutEntity].
extension WorkoutEntityPatterns on WorkoutEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WorkoutEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WorkoutEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WorkoutEntity value)  $default,){
final _that = this;
switch (_that) {
case _WorkoutEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WorkoutEntity value)?  $default,){
final _that = this;
switch (_that) {
case _WorkoutEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String description,  int duration,  int calories,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorkoutEntity() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.duration,_that.calories,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String description,  int duration,  int calories,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _WorkoutEntity():
return $default(_that.id,_that.name,_that.description,_that.duration,_that.calories,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String description,  int duration,  int calories,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _WorkoutEntity() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.duration,_that.calories,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc


class _WorkoutEntity implements WorkoutEntity {
  const _WorkoutEntity({required this.id, required this.name, required this.description, required this.duration, required this.calories, required this.createdAt});
  

@override final  String id;
@override final  String name;
@override final  String description;
@override final  int duration;
@override final  int calories;
@override final  DateTime createdAt;

/// Create a copy of WorkoutEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkoutEntityCopyWith<_WorkoutEntity> get copyWith => __$WorkoutEntityCopyWithImpl<_WorkoutEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkoutEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.calories, calories) || other.calories == calories)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,description,duration,calories,createdAt);

@override
String toString() {
  return 'WorkoutEntity(id: $id, name: $name, description: $description, duration: $duration, calories: $calories, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$WorkoutEntityCopyWith<$Res> implements $WorkoutEntityCopyWith<$Res> {
  factory _$WorkoutEntityCopyWith(_WorkoutEntity value, $Res Function(_WorkoutEntity) _then) = __$WorkoutEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String description, int duration, int calories, DateTime createdAt
});




}
/// @nodoc
class __$WorkoutEntityCopyWithImpl<$Res>
    implements _$WorkoutEntityCopyWith<$Res> {
  __$WorkoutEntityCopyWithImpl(this._self, this._then);

  final _WorkoutEntity _self;
  final $Res Function(_WorkoutEntity) _then;

/// Create a copy of WorkoutEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? duration = null,Object? calories = null,Object? createdAt = null,}) {
  return _then(_WorkoutEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int,calories: null == calories ? _self.calories : calories // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
