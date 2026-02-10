// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'health_workout_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HealthWorkoutData {

 String get id; HealthWorkoutType get workoutType; DateTime get startTime; DateTime get endTime; Duration get duration; int? get totalEnergyBurned;// Calories in kcal
 double? get totalDistance;// Distance in meters
 List<int>? get heartRates;// Heart rate data points (BPM)
 Map<String, dynamic>? get metadata;
/// Create a copy of HealthWorkoutData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HealthWorkoutDataCopyWith<HealthWorkoutData> get copyWith => _$HealthWorkoutDataCopyWithImpl<HealthWorkoutData>(this as HealthWorkoutData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HealthWorkoutData&&(identical(other.id, id) || other.id == id)&&(identical(other.workoutType, workoutType) || other.workoutType == workoutType)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.totalEnergyBurned, totalEnergyBurned) || other.totalEnergyBurned == totalEnergyBurned)&&(identical(other.totalDistance, totalDistance) || other.totalDistance == totalDistance)&&const DeepCollectionEquality().equals(other.heartRates, heartRates)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}


@override
int get hashCode => Object.hash(runtimeType,id,workoutType,startTime,endTime,duration,totalEnergyBurned,totalDistance,const DeepCollectionEquality().hash(heartRates),const DeepCollectionEquality().hash(metadata));

@override
String toString() {
  return 'HealthWorkoutData(id: $id, workoutType: $workoutType, startTime: $startTime, endTime: $endTime, duration: $duration, totalEnergyBurned: $totalEnergyBurned, totalDistance: $totalDistance, heartRates: $heartRates, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $HealthWorkoutDataCopyWith<$Res>  {
  factory $HealthWorkoutDataCopyWith(HealthWorkoutData value, $Res Function(HealthWorkoutData) _then) = _$HealthWorkoutDataCopyWithImpl;
@useResult
$Res call({
 String id, HealthWorkoutType workoutType, DateTime startTime, DateTime endTime, Duration duration, int? totalEnergyBurned, double? totalDistance, List<int>? heartRates, Map<String, dynamic>? metadata
});




}
/// @nodoc
class _$HealthWorkoutDataCopyWithImpl<$Res>
    implements $HealthWorkoutDataCopyWith<$Res> {
  _$HealthWorkoutDataCopyWithImpl(this._self, this._then);

  final HealthWorkoutData _self;
  final $Res Function(HealthWorkoutData) _then;

/// Create a copy of HealthWorkoutData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? workoutType = null,Object? startTime = null,Object? endTime = null,Object? duration = null,Object? totalEnergyBurned = freezed,Object? totalDistance = freezed,Object? heartRates = freezed,Object? metadata = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,workoutType: null == workoutType ? _self.workoutType : workoutType // ignore: cast_nullable_to_non_nullable
as HealthWorkoutType,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as DateTime,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,totalEnergyBurned: freezed == totalEnergyBurned ? _self.totalEnergyBurned : totalEnergyBurned // ignore: cast_nullable_to_non_nullable
as int?,totalDistance: freezed == totalDistance ? _self.totalDistance : totalDistance // ignore: cast_nullable_to_non_nullable
as double?,heartRates: freezed == heartRates ? _self.heartRates : heartRates // ignore: cast_nullable_to_non_nullable
as List<int>?,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [HealthWorkoutData].
extension HealthWorkoutDataPatterns on HealthWorkoutData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HealthWorkoutData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HealthWorkoutData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HealthWorkoutData value)  $default,){
final _that = this;
switch (_that) {
case _HealthWorkoutData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HealthWorkoutData value)?  $default,){
final _that = this;
switch (_that) {
case _HealthWorkoutData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  HealthWorkoutType workoutType,  DateTime startTime,  DateTime endTime,  Duration duration,  int? totalEnergyBurned,  double? totalDistance,  List<int>? heartRates,  Map<String, dynamic>? metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HealthWorkoutData() when $default != null:
return $default(_that.id,_that.workoutType,_that.startTime,_that.endTime,_that.duration,_that.totalEnergyBurned,_that.totalDistance,_that.heartRates,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  HealthWorkoutType workoutType,  DateTime startTime,  DateTime endTime,  Duration duration,  int? totalEnergyBurned,  double? totalDistance,  List<int>? heartRates,  Map<String, dynamic>? metadata)  $default,) {final _that = this;
switch (_that) {
case _HealthWorkoutData():
return $default(_that.id,_that.workoutType,_that.startTime,_that.endTime,_that.duration,_that.totalEnergyBurned,_that.totalDistance,_that.heartRates,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  HealthWorkoutType workoutType,  DateTime startTime,  DateTime endTime,  Duration duration,  int? totalEnergyBurned,  double? totalDistance,  List<int>? heartRates,  Map<String, dynamic>? metadata)?  $default,) {final _that = this;
switch (_that) {
case _HealthWorkoutData() when $default != null:
return $default(_that.id,_that.workoutType,_that.startTime,_that.endTime,_that.duration,_that.totalEnergyBurned,_that.totalDistance,_that.heartRates,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc


class _HealthWorkoutData extends HealthWorkoutData {
  const _HealthWorkoutData({required this.id, required this.workoutType, required this.startTime, required this.endTime, required this.duration, this.totalEnergyBurned, this.totalDistance, final  List<int>? heartRates, final  Map<String, dynamic>? metadata}): _heartRates = heartRates,_metadata = metadata,super._();
  

@override final  String id;
@override final  HealthWorkoutType workoutType;
@override final  DateTime startTime;
@override final  DateTime endTime;
@override final  Duration duration;
@override final  int? totalEnergyBurned;
// Calories in kcal
@override final  double? totalDistance;
// Distance in meters
 final  List<int>? _heartRates;
// Distance in meters
@override List<int>? get heartRates {
  final value = _heartRates;
  if (value == null) return null;
  if (_heartRates is EqualUnmodifiableListView) return _heartRates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

// Heart rate data points (BPM)
 final  Map<String, dynamic>? _metadata;
// Heart rate data points (BPM)
@override Map<String, dynamic>? get metadata {
  final value = _metadata;
  if (value == null) return null;
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of HealthWorkoutData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HealthWorkoutDataCopyWith<_HealthWorkoutData> get copyWith => __$HealthWorkoutDataCopyWithImpl<_HealthWorkoutData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HealthWorkoutData&&(identical(other.id, id) || other.id == id)&&(identical(other.workoutType, workoutType) || other.workoutType == workoutType)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.totalEnergyBurned, totalEnergyBurned) || other.totalEnergyBurned == totalEnergyBurned)&&(identical(other.totalDistance, totalDistance) || other.totalDistance == totalDistance)&&const DeepCollectionEquality().equals(other._heartRates, _heartRates)&&const DeepCollectionEquality().equals(other._metadata, _metadata));
}


@override
int get hashCode => Object.hash(runtimeType,id,workoutType,startTime,endTime,duration,totalEnergyBurned,totalDistance,const DeepCollectionEquality().hash(_heartRates),const DeepCollectionEquality().hash(_metadata));

@override
String toString() {
  return 'HealthWorkoutData(id: $id, workoutType: $workoutType, startTime: $startTime, endTime: $endTime, duration: $duration, totalEnergyBurned: $totalEnergyBurned, totalDistance: $totalDistance, heartRates: $heartRates, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$HealthWorkoutDataCopyWith<$Res> implements $HealthWorkoutDataCopyWith<$Res> {
  factory _$HealthWorkoutDataCopyWith(_HealthWorkoutData value, $Res Function(_HealthWorkoutData) _then) = __$HealthWorkoutDataCopyWithImpl;
@override @useResult
$Res call({
 String id, HealthWorkoutType workoutType, DateTime startTime, DateTime endTime, Duration duration, int? totalEnergyBurned, double? totalDistance, List<int>? heartRates, Map<String, dynamic>? metadata
});




}
/// @nodoc
class __$HealthWorkoutDataCopyWithImpl<$Res>
    implements _$HealthWorkoutDataCopyWith<$Res> {
  __$HealthWorkoutDataCopyWithImpl(this._self, this._then);

  final _HealthWorkoutData _self;
  final $Res Function(_HealthWorkoutData) _then;

/// Create a copy of HealthWorkoutData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? workoutType = null,Object? startTime = null,Object? endTime = null,Object? duration = null,Object? totalEnergyBurned = freezed,Object? totalDistance = freezed,Object? heartRates = freezed,Object? metadata = freezed,}) {
  return _then(_HealthWorkoutData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,workoutType: null == workoutType ? _self.workoutType : workoutType // ignore: cast_nullable_to_non_nullable
as HealthWorkoutType,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as DateTime,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,totalEnergyBurned: freezed == totalEnergyBurned ? _self.totalEnergyBurned : totalEnergyBurned // ignore: cast_nullable_to_non_nullable
as int?,totalDistance: freezed == totalDistance ? _self.totalDistance : totalDistance // ignore: cast_nullable_to_non_nullable
as double?,heartRates: freezed == heartRates ? _self._heartRates : heartRates // ignore: cast_nullable_to_non_nullable
as List<int>?,metadata: freezed == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}

// dart format on
