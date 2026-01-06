// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_log_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WorkoutLogEntity {

 String get id; String get userId; String get title; DateTime get logDate; Map<String, dynamic> get content; WorkoutIntensity get intensity; String? get programId; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of WorkoutLogEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkoutLogEntityCopyWith<WorkoutLogEntity> get copyWith => _$WorkoutLogEntityCopyWithImpl<WorkoutLogEntity>(this as WorkoutLogEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkoutLogEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.title, title) || other.title == title)&&(identical(other.logDate, logDate) || other.logDate == logDate)&&const DeepCollectionEquality().equals(other.content, content)&&(identical(other.intensity, intensity) || other.intensity == intensity)&&(identical(other.programId, programId) || other.programId == programId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,userId,title,logDate,const DeepCollectionEquality().hash(content),intensity,programId,createdAt,updatedAt);

@override
String toString() {
  return 'WorkoutLogEntity(id: $id, userId: $userId, title: $title, logDate: $logDate, content: $content, intensity: $intensity, programId: $programId, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $WorkoutLogEntityCopyWith<$Res>  {
  factory $WorkoutLogEntityCopyWith(WorkoutLogEntity value, $Res Function(WorkoutLogEntity) _then) = _$WorkoutLogEntityCopyWithImpl;
@useResult
$Res call({
 String id, String userId, String title, DateTime logDate, Map<String, dynamic> content, WorkoutIntensity intensity, String? programId, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$WorkoutLogEntityCopyWithImpl<$Res>
    implements $WorkoutLogEntityCopyWith<$Res> {
  _$WorkoutLogEntityCopyWithImpl(this._self, this._then);

  final WorkoutLogEntity _self;
  final $Res Function(WorkoutLogEntity) _then;

/// Create a copy of WorkoutLogEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? title = null,Object? logDate = null,Object? content = null,Object? intensity = null,Object? programId = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,logDate: null == logDate ? _self.logDate : logDate // ignore: cast_nullable_to_non_nullable
as DateTime,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,intensity: null == intensity ? _self.intensity : intensity // ignore: cast_nullable_to_non_nullable
as WorkoutIntensity,programId: freezed == programId ? _self.programId : programId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [WorkoutLogEntity].
extension WorkoutLogEntityPatterns on WorkoutLogEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WorkoutLogEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WorkoutLogEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WorkoutLogEntity value)  $default,){
final _that = this;
switch (_that) {
case _WorkoutLogEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WorkoutLogEntity value)?  $default,){
final _that = this;
switch (_that) {
case _WorkoutLogEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  String title,  DateTime logDate,  Map<String, dynamic> content,  WorkoutIntensity intensity,  String? programId,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorkoutLogEntity() when $default != null:
return $default(_that.id,_that.userId,_that.title,_that.logDate,_that.content,_that.intensity,_that.programId,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  String title,  DateTime logDate,  Map<String, dynamic> content,  WorkoutIntensity intensity,  String? programId,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _WorkoutLogEntity():
return $default(_that.id,_that.userId,_that.title,_that.logDate,_that.content,_that.intensity,_that.programId,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  String title,  DateTime logDate,  Map<String, dynamic> content,  WorkoutIntensity intensity,  String? programId,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _WorkoutLogEntity() when $default != null:
return $default(_that.id,_that.userId,_that.title,_that.logDate,_that.content,_that.intensity,_that.programId,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _WorkoutLogEntity implements WorkoutLogEntity {
  const _WorkoutLogEntity({required this.id, required this.userId, required this.title, required this.logDate, required final  Map<String, dynamic> content, required this.intensity, this.programId, required this.createdAt, required this.updatedAt}): _content = content;
  

@override final  String id;
@override final  String userId;
@override final  String title;
@override final  DateTime logDate;
 final  Map<String, dynamic> _content;
@override Map<String, dynamic> get content {
  if (_content is EqualUnmodifiableMapView) return _content;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_content);
}

@override final  WorkoutIntensity intensity;
@override final  String? programId;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of WorkoutLogEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkoutLogEntityCopyWith<_WorkoutLogEntity> get copyWith => __$WorkoutLogEntityCopyWithImpl<_WorkoutLogEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkoutLogEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.title, title) || other.title == title)&&(identical(other.logDate, logDate) || other.logDate == logDate)&&const DeepCollectionEquality().equals(other._content, _content)&&(identical(other.intensity, intensity) || other.intensity == intensity)&&(identical(other.programId, programId) || other.programId == programId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,userId,title,logDate,const DeepCollectionEquality().hash(_content),intensity,programId,createdAt,updatedAt);

@override
String toString() {
  return 'WorkoutLogEntity(id: $id, userId: $userId, title: $title, logDate: $logDate, content: $content, intensity: $intensity, programId: $programId, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$WorkoutLogEntityCopyWith<$Res> implements $WorkoutLogEntityCopyWith<$Res> {
  factory _$WorkoutLogEntityCopyWith(_WorkoutLogEntity value, $Res Function(_WorkoutLogEntity) _then) = __$WorkoutLogEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, String title, DateTime logDate, Map<String, dynamic> content, WorkoutIntensity intensity, String? programId, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$WorkoutLogEntityCopyWithImpl<$Res>
    implements _$WorkoutLogEntityCopyWith<$Res> {
  __$WorkoutLogEntityCopyWithImpl(this._self, this._then);

  final _WorkoutLogEntity _self;
  final $Res Function(_WorkoutLogEntity) _then;

/// Create a copy of WorkoutLogEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? title = null,Object? logDate = null,Object? content = null,Object? intensity = null,Object? programId = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_WorkoutLogEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,logDate: null == logDate ? _self.logDate : logDate // ignore: cast_nullable_to_non_nullable
as DateTime,content: null == content ? _self._content : content // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,intensity: null == intensity ? _self.intensity : intensity // ignore: cast_nullable_to_non_nullable
as WorkoutIntensity,programId: freezed == programId ? _self.programId : programId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
