// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_workout_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeWorkoutEntity {

 String get id; HealthWorkoutType get workoutType; DateTime get startTime; DateTime get endTime; Duration get duration; int? get totalEnergyBurned; double? get totalDistance;
/// Create a copy of HomeWorkoutEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeWorkoutEntityCopyWith<HomeWorkoutEntity> get copyWith => _$HomeWorkoutEntityCopyWithImpl<HomeWorkoutEntity>(this as HomeWorkoutEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeWorkoutEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.workoutType, workoutType) || other.workoutType == workoutType)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.totalEnergyBurned, totalEnergyBurned) || other.totalEnergyBurned == totalEnergyBurned)&&(identical(other.totalDistance, totalDistance) || other.totalDistance == totalDistance));
}


@override
int get hashCode => Object.hash(runtimeType,id,workoutType,startTime,endTime,duration,totalEnergyBurned,totalDistance);

@override
String toString() {
  return 'HomeWorkoutEntity(id: $id, workoutType: $workoutType, startTime: $startTime, endTime: $endTime, duration: $duration, totalEnergyBurned: $totalEnergyBurned, totalDistance: $totalDistance)';
}


}

/// @nodoc
abstract mixin class $HomeWorkoutEntityCopyWith<$Res>  {
  factory $HomeWorkoutEntityCopyWith(HomeWorkoutEntity value, $Res Function(HomeWorkoutEntity) _then) = _$HomeWorkoutEntityCopyWithImpl;
@useResult
$Res call({
 String id, HealthWorkoutType workoutType, DateTime startTime, DateTime endTime, Duration duration, int? totalEnergyBurned, double? totalDistance
});




}
/// @nodoc
class _$HomeWorkoutEntityCopyWithImpl<$Res>
    implements $HomeWorkoutEntityCopyWith<$Res> {
  _$HomeWorkoutEntityCopyWithImpl(this._self, this._then);

  final HomeWorkoutEntity _self;
  final $Res Function(HomeWorkoutEntity) _then;

/// Create a copy of HomeWorkoutEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? workoutType = null,Object? startTime = null,Object? endTime = null,Object? duration = null,Object? totalEnergyBurned = freezed,Object? totalDistance = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,workoutType: null == workoutType ? _self.workoutType : workoutType // ignore: cast_nullable_to_non_nullable
as HealthWorkoutType,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as DateTime,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,totalEnergyBurned: freezed == totalEnergyBurned ? _self.totalEnergyBurned : totalEnergyBurned // ignore: cast_nullable_to_non_nullable
as int?,totalDistance: freezed == totalDistance ? _self.totalDistance : totalDistance // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeWorkoutEntity].
extension HomeWorkoutEntityPatterns on HomeWorkoutEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeWorkoutEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeWorkoutEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeWorkoutEntity value)  $default,){
final _that = this;
switch (_that) {
case _HomeWorkoutEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeWorkoutEntity value)?  $default,){
final _that = this;
switch (_that) {
case _HomeWorkoutEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  HealthWorkoutType workoutType,  DateTime startTime,  DateTime endTime,  Duration duration,  int? totalEnergyBurned,  double? totalDistance)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeWorkoutEntity() when $default != null:
return $default(_that.id,_that.workoutType,_that.startTime,_that.endTime,_that.duration,_that.totalEnergyBurned,_that.totalDistance);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  HealthWorkoutType workoutType,  DateTime startTime,  DateTime endTime,  Duration duration,  int? totalEnergyBurned,  double? totalDistance)  $default,) {final _that = this;
switch (_that) {
case _HomeWorkoutEntity():
return $default(_that.id,_that.workoutType,_that.startTime,_that.endTime,_that.duration,_that.totalEnergyBurned,_that.totalDistance);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  HealthWorkoutType workoutType,  DateTime startTime,  DateTime endTime,  Duration duration,  int? totalEnergyBurned,  double? totalDistance)?  $default,) {final _that = this;
switch (_that) {
case _HomeWorkoutEntity() when $default != null:
return $default(_that.id,_that.workoutType,_that.startTime,_that.endTime,_that.duration,_that.totalEnergyBurned,_that.totalDistance);case _:
  return null;

}
}

}

/// @nodoc


class _HomeWorkoutEntity extends HomeWorkoutEntity {
  const _HomeWorkoutEntity({required this.id, required this.workoutType, required this.startTime, required this.endTime, required this.duration, this.totalEnergyBurned, this.totalDistance}): super._();
  

@override final  String id;
@override final  HealthWorkoutType workoutType;
@override final  DateTime startTime;
@override final  DateTime endTime;
@override final  Duration duration;
@override final  int? totalEnergyBurned;
@override final  double? totalDistance;

/// Create a copy of HomeWorkoutEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeWorkoutEntityCopyWith<_HomeWorkoutEntity> get copyWith => __$HomeWorkoutEntityCopyWithImpl<_HomeWorkoutEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeWorkoutEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.workoutType, workoutType) || other.workoutType == workoutType)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.totalEnergyBurned, totalEnergyBurned) || other.totalEnergyBurned == totalEnergyBurned)&&(identical(other.totalDistance, totalDistance) || other.totalDistance == totalDistance));
}


@override
int get hashCode => Object.hash(runtimeType,id,workoutType,startTime,endTime,duration,totalEnergyBurned,totalDistance);

@override
String toString() {
  return 'HomeWorkoutEntity(id: $id, workoutType: $workoutType, startTime: $startTime, endTime: $endTime, duration: $duration, totalEnergyBurned: $totalEnergyBurned, totalDistance: $totalDistance)';
}


}

/// @nodoc
abstract mixin class _$HomeWorkoutEntityCopyWith<$Res> implements $HomeWorkoutEntityCopyWith<$Res> {
  factory _$HomeWorkoutEntityCopyWith(_HomeWorkoutEntity value, $Res Function(_HomeWorkoutEntity) _then) = __$HomeWorkoutEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, HealthWorkoutType workoutType, DateTime startTime, DateTime endTime, Duration duration, int? totalEnergyBurned, double? totalDistance
});




}
/// @nodoc
class __$HomeWorkoutEntityCopyWithImpl<$Res>
    implements _$HomeWorkoutEntityCopyWith<$Res> {
  __$HomeWorkoutEntityCopyWithImpl(this._self, this._then);

  final _HomeWorkoutEntity _self;
  final $Res Function(_HomeWorkoutEntity) _then;

/// Create a copy of HomeWorkoutEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? workoutType = null,Object? startTime = null,Object? endTime = null,Object? duration = null,Object? totalEnergyBurned = freezed,Object? totalDistance = freezed,}) {
  return _then(_HomeWorkoutEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,workoutType: null == workoutType ? _self.workoutType : workoutType // ignore: cast_nullable_to_non_nullable
as HealthWorkoutType,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as DateTime,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,totalEnergyBurned: freezed == totalEnergyBurned ? _self.totalEnergyBurned : totalEnergyBurned // ignore: cast_nullable_to_non_nullable
as int?,totalDistance: freezed == totalDistance ? _self.totalDistance : totalDistance // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
