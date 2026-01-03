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
mixin _$WorkoutSessionEntity {

 String get id; String get workoutId; String get title; String? get content; int get orderIndex;
/// Create a copy of WorkoutSessionEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkoutSessionEntityCopyWith<WorkoutSessionEntity> get copyWith => _$WorkoutSessionEntityCopyWithImpl<WorkoutSessionEntity>(this as WorkoutSessionEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkoutSessionEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.workoutId, workoutId) || other.workoutId == workoutId)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.orderIndex, orderIndex) || other.orderIndex == orderIndex));
}


@override
int get hashCode => Object.hash(runtimeType,id,workoutId,title,content,orderIndex);

@override
String toString() {
  return 'WorkoutSessionEntity(id: $id, workoutId: $workoutId, title: $title, content: $content, orderIndex: $orderIndex)';
}


}

/// @nodoc
abstract mixin class $WorkoutSessionEntityCopyWith<$Res>  {
  factory $WorkoutSessionEntityCopyWith(WorkoutSessionEntity value, $Res Function(WorkoutSessionEntity) _then) = _$WorkoutSessionEntityCopyWithImpl;
@useResult
$Res call({
 String id, String workoutId, String title, String? content, int orderIndex
});




}
/// @nodoc
class _$WorkoutSessionEntityCopyWithImpl<$Res>
    implements $WorkoutSessionEntityCopyWith<$Res> {
  _$WorkoutSessionEntityCopyWithImpl(this._self, this._then);

  final WorkoutSessionEntity _self;
  final $Res Function(WorkoutSessionEntity) _then;

/// Create a copy of WorkoutSessionEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? workoutId = null,Object? title = null,Object? content = freezed,Object? orderIndex = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,workoutId: null == workoutId ? _self.workoutId : workoutId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,orderIndex: null == orderIndex ? _self.orderIndex : orderIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [WorkoutSessionEntity].
extension WorkoutSessionEntityPatterns on WorkoutSessionEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WorkoutSessionEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WorkoutSessionEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WorkoutSessionEntity value)  $default,){
final _that = this;
switch (_that) {
case _WorkoutSessionEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WorkoutSessionEntity value)?  $default,){
final _that = this;
switch (_that) {
case _WorkoutSessionEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String workoutId,  String title,  String? content,  int orderIndex)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorkoutSessionEntity() when $default != null:
return $default(_that.id,_that.workoutId,_that.title,_that.content,_that.orderIndex);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String workoutId,  String title,  String? content,  int orderIndex)  $default,) {final _that = this;
switch (_that) {
case _WorkoutSessionEntity():
return $default(_that.id,_that.workoutId,_that.title,_that.content,_that.orderIndex);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String workoutId,  String title,  String? content,  int orderIndex)?  $default,) {final _that = this;
switch (_that) {
case _WorkoutSessionEntity() when $default != null:
return $default(_that.id,_that.workoutId,_that.title,_that.content,_that.orderIndex);case _:
  return null;

}
}

}

/// @nodoc


class _WorkoutSessionEntity implements WorkoutSessionEntity {
  const _WorkoutSessionEntity({required this.id, required this.workoutId, required this.title, this.content, required this.orderIndex});
  

@override final  String id;
@override final  String workoutId;
@override final  String title;
@override final  String? content;
@override final  int orderIndex;

/// Create a copy of WorkoutSessionEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkoutSessionEntityCopyWith<_WorkoutSessionEntity> get copyWith => __$WorkoutSessionEntityCopyWithImpl<_WorkoutSessionEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkoutSessionEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.workoutId, workoutId) || other.workoutId == workoutId)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.orderIndex, orderIndex) || other.orderIndex == orderIndex));
}


@override
int get hashCode => Object.hash(runtimeType,id,workoutId,title,content,orderIndex);

@override
String toString() {
  return 'WorkoutSessionEntity(id: $id, workoutId: $workoutId, title: $title, content: $content, orderIndex: $orderIndex)';
}


}

/// @nodoc
abstract mixin class _$WorkoutSessionEntityCopyWith<$Res> implements $WorkoutSessionEntityCopyWith<$Res> {
  factory _$WorkoutSessionEntityCopyWith(_WorkoutSessionEntity value, $Res Function(_WorkoutSessionEntity) _then) = __$WorkoutSessionEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String workoutId, String title, String? content, int orderIndex
});




}
/// @nodoc
class __$WorkoutSessionEntityCopyWithImpl<$Res>
    implements _$WorkoutSessionEntityCopyWith<$Res> {
  __$WorkoutSessionEntityCopyWithImpl(this._self, this._then);

  final _WorkoutSessionEntity _self;
  final $Res Function(_WorkoutSessionEntity) _then;

/// Create a copy of WorkoutSessionEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? workoutId = null,Object? title = null,Object? content = freezed,Object? orderIndex = null,}) {
  return _then(_WorkoutSessionEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,workoutId: null == workoutId ? _self.workoutId : workoutId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,orderIndex: null == orderIndex ? _self.orderIndex : orderIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$WorkoutEntity {

 String get id; String get programId; String get weekId; int get dayNumber; String get title; String? get content; DateTime get createdAt;// Nested week info
 ProgramWeekEntity? get programWeek;// Nested sessions (if fetched with nested query)
 List<WorkoutSessionEntity>? get sessions;
/// Create a copy of WorkoutEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkoutEntityCopyWith<WorkoutEntity> get copyWith => _$WorkoutEntityCopyWithImpl<WorkoutEntity>(this as WorkoutEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkoutEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.programId, programId) || other.programId == programId)&&(identical(other.weekId, weekId) || other.weekId == weekId)&&(identical(other.dayNumber, dayNumber) || other.dayNumber == dayNumber)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.programWeek, programWeek) || other.programWeek == programWeek)&&const DeepCollectionEquality().equals(other.sessions, sessions));
}


@override
int get hashCode => Object.hash(runtimeType,id,programId,weekId,dayNumber,title,content,createdAt,programWeek,const DeepCollectionEquality().hash(sessions));

@override
String toString() {
  return 'WorkoutEntity(id: $id, programId: $programId, weekId: $weekId, dayNumber: $dayNumber, title: $title, content: $content, createdAt: $createdAt, programWeek: $programWeek, sessions: $sessions)';
}


}

/// @nodoc
abstract mixin class $WorkoutEntityCopyWith<$Res>  {
  factory $WorkoutEntityCopyWith(WorkoutEntity value, $Res Function(WorkoutEntity) _then) = _$WorkoutEntityCopyWithImpl;
@useResult
$Res call({
 String id, String programId, String weekId, int dayNumber, String title, String? content, DateTime createdAt, ProgramWeekEntity? programWeek, List<WorkoutSessionEntity>? sessions
});


$ProgramWeekEntityCopyWith<$Res>? get programWeek;

}
/// @nodoc
class _$WorkoutEntityCopyWithImpl<$Res>
    implements $WorkoutEntityCopyWith<$Res> {
  _$WorkoutEntityCopyWithImpl(this._self, this._then);

  final WorkoutEntity _self;
  final $Res Function(WorkoutEntity) _then;

/// Create a copy of WorkoutEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? programId = null,Object? weekId = null,Object? dayNumber = null,Object? title = null,Object? content = freezed,Object? createdAt = null,Object? programWeek = freezed,Object? sessions = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,programId: null == programId ? _self.programId : programId // ignore: cast_nullable_to_non_nullable
as String,weekId: null == weekId ? _self.weekId : weekId // ignore: cast_nullable_to_non_nullable
as String,dayNumber: null == dayNumber ? _self.dayNumber : dayNumber // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,programWeek: freezed == programWeek ? _self.programWeek : programWeek // ignore: cast_nullable_to_non_nullable
as ProgramWeekEntity?,sessions: freezed == sessions ? _self.sessions : sessions // ignore: cast_nullable_to_non_nullable
as List<WorkoutSessionEntity>?,
  ));
}
/// Create a copy of WorkoutEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProgramWeekEntityCopyWith<$Res>? get programWeek {
    if (_self.programWeek == null) {
    return null;
  }

  return $ProgramWeekEntityCopyWith<$Res>(_self.programWeek!, (value) {
    return _then(_self.copyWith(programWeek: value));
  });
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String programId,  String weekId,  int dayNumber,  String title,  String? content,  DateTime createdAt,  ProgramWeekEntity? programWeek,  List<WorkoutSessionEntity>? sessions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorkoutEntity() when $default != null:
return $default(_that.id,_that.programId,_that.weekId,_that.dayNumber,_that.title,_that.content,_that.createdAt,_that.programWeek,_that.sessions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String programId,  String weekId,  int dayNumber,  String title,  String? content,  DateTime createdAt,  ProgramWeekEntity? programWeek,  List<WorkoutSessionEntity>? sessions)  $default,) {final _that = this;
switch (_that) {
case _WorkoutEntity():
return $default(_that.id,_that.programId,_that.weekId,_that.dayNumber,_that.title,_that.content,_that.createdAt,_that.programWeek,_that.sessions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String programId,  String weekId,  int dayNumber,  String title,  String? content,  DateTime createdAt,  ProgramWeekEntity? programWeek,  List<WorkoutSessionEntity>? sessions)?  $default,) {final _that = this;
switch (_that) {
case _WorkoutEntity() when $default != null:
return $default(_that.id,_that.programId,_that.weekId,_that.dayNumber,_that.title,_that.content,_that.createdAt,_that.programWeek,_that.sessions);case _:
  return null;

}
}

}

/// @nodoc


class _WorkoutEntity implements WorkoutEntity {
  const _WorkoutEntity({required this.id, required this.programId, required this.weekId, required this.dayNumber, required this.title, this.content, required this.createdAt, this.programWeek, final  List<WorkoutSessionEntity>? sessions}): _sessions = sessions;
  

@override final  String id;
@override final  String programId;
@override final  String weekId;
@override final  int dayNumber;
@override final  String title;
@override final  String? content;
@override final  DateTime createdAt;
// Nested week info
@override final  ProgramWeekEntity? programWeek;
// Nested sessions (if fetched with nested query)
 final  List<WorkoutSessionEntity>? _sessions;
// Nested sessions (if fetched with nested query)
@override List<WorkoutSessionEntity>? get sessions {
  final value = _sessions;
  if (value == null) return null;
  if (_sessions is EqualUnmodifiableListView) return _sessions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of WorkoutEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkoutEntityCopyWith<_WorkoutEntity> get copyWith => __$WorkoutEntityCopyWithImpl<_WorkoutEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkoutEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.programId, programId) || other.programId == programId)&&(identical(other.weekId, weekId) || other.weekId == weekId)&&(identical(other.dayNumber, dayNumber) || other.dayNumber == dayNumber)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.programWeek, programWeek) || other.programWeek == programWeek)&&const DeepCollectionEquality().equals(other._sessions, _sessions));
}


@override
int get hashCode => Object.hash(runtimeType,id,programId,weekId,dayNumber,title,content,createdAt,programWeek,const DeepCollectionEquality().hash(_sessions));

@override
String toString() {
  return 'WorkoutEntity(id: $id, programId: $programId, weekId: $weekId, dayNumber: $dayNumber, title: $title, content: $content, createdAt: $createdAt, programWeek: $programWeek, sessions: $sessions)';
}


}

/// @nodoc
abstract mixin class _$WorkoutEntityCopyWith<$Res> implements $WorkoutEntityCopyWith<$Res> {
  factory _$WorkoutEntityCopyWith(_WorkoutEntity value, $Res Function(_WorkoutEntity) _then) = __$WorkoutEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String programId, String weekId, int dayNumber, String title, String? content, DateTime createdAt, ProgramWeekEntity? programWeek, List<WorkoutSessionEntity>? sessions
});


@override $ProgramWeekEntityCopyWith<$Res>? get programWeek;

}
/// @nodoc
class __$WorkoutEntityCopyWithImpl<$Res>
    implements _$WorkoutEntityCopyWith<$Res> {
  __$WorkoutEntityCopyWithImpl(this._self, this._then);

  final _WorkoutEntity _self;
  final $Res Function(_WorkoutEntity) _then;

/// Create a copy of WorkoutEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? programId = null,Object? weekId = null,Object? dayNumber = null,Object? title = null,Object? content = freezed,Object? createdAt = null,Object? programWeek = freezed,Object? sessions = freezed,}) {
  return _then(_WorkoutEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,programId: null == programId ? _self.programId : programId // ignore: cast_nullable_to_non_nullable
as String,weekId: null == weekId ? _self.weekId : weekId // ignore: cast_nullable_to_non_nullable
as String,dayNumber: null == dayNumber ? _self.dayNumber : dayNumber // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,programWeek: freezed == programWeek ? _self.programWeek : programWeek // ignore: cast_nullable_to_non_nullable
as ProgramWeekEntity?,sessions: freezed == sessions ? _self._sessions : sessions // ignore: cast_nullable_to_non_nullable
as List<WorkoutSessionEntity>?,
  ));
}

/// Create a copy of WorkoutEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProgramWeekEntityCopyWith<$Res>? get programWeek {
    if (_self.programWeek == null) {
    return null;
  }

  return $ProgramWeekEntityCopyWith<$Res>(_self.programWeek!, (value) {
    return _then(_self.copyWith(programWeek: value));
  });
}
}

/// @nodoc
mixin _$ProgramWeekEntity {

 String get id; String get programId; int get weekNumber; String get title; String? get description;// Nested workouts (if fetched)
 List<WorkoutEntity>? get workouts;
/// Create a copy of ProgramWeekEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgramWeekEntityCopyWith<ProgramWeekEntity> get copyWith => _$ProgramWeekEntityCopyWithImpl<ProgramWeekEntity>(this as ProgramWeekEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgramWeekEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.programId, programId) || other.programId == programId)&&(identical(other.weekNumber, weekNumber) || other.weekNumber == weekNumber)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.workouts, workouts));
}


@override
int get hashCode => Object.hash(runtimeType,id,programId,weekNumber,title,description,const DeepCollectionEquality().hash(workouts));

@override
String toString() {
  return 'ProgramWeekEntity(id: $id, programId: $programId, weekNumber: $weekNumber, title: $title, description: $description, workouts: $workouts)';
}


}

/// @nodoc
abstract mixin class $ProgramWeekEntityCopyWith<$Res>  {
  factory $ProgramWeekEntityCopyWith(ProgramWeekEntity value, $Res Function(ProgramWeekEntity) _then) = _$ProgramWeekEntityCopyWithImpl;
@useResult
$Res call({
 String id, String programId, int weekNumber, String title, String? description, List<WorkoutEntity>? workouts
});




}
/// @nodoc
class _$ProgramWeekEntityCopyWithImpl<$Res>
    implements $ProgramWeekEntityCopyWith<$Res> {
  _$ProgramWeekEntityCopyWithImpl(this._self, this._then);

  final ProgramWeekEntity _self;
  final $Res Function(ProgramWeekEntity) _then;

/// Create a copy of ProgramWeekEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? programId = null,Object? weekNumber = null,Object? title = null,Object? description = freezed,Object? workouts = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,programId: null == programId ? _self.programId : programId // ignore: cast_nullable_to_non_nullable
as String,weekNumber: null == weekNumber ? _self.weekNumber : weekNumber // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,workouts: freezed == workouts ? _self.workouts : workouts // ignore: cast_nullable_to_non_nullable
as List<WorkoutEntity>?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProgramWeekEntity].
extension ProgramWeekEntityPatterns on ProgramWeekEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProgramWeekEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProgramWeekEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProgramWeekEntity value)  $default,){
final _that = this;
switch (_that) {
case _ProgramWeekEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProgramWeekEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ProgramWeekEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String programId,  int weekNumber,  String title,  String? description,  List<WorkoutEntity>? workouts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProgramWeekEntity() when $default != null:
return $default(_that.id,_that.programId,_that.weekNumber,_that.title,_that.description,_that.workouts);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String programId,  int weekNumber,  String title,  String? description,  List<WorkoutEntity>? workouts)  $default,) {final _that = this;
switch (_that) {
case _ProgramWeekEntity():
return $default(_that.id,_that.programId,_that.weekNumber,_that.title,_that.description,_that.workouts);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String programId,  int weekNumber,  String title,  String? description,  List<WorkoutEntity>? workouts)?  $default,) {final _that = this;
switch (_that) {
case _ProgramWeekEntity() when $default != null:
return $default(_that.id,_that.programId,_that.weekNumber,_that.title,_that.description,_that.workouts);case _:
  return null;

}
}

}

/// @nodoc


class _ProgramWeekEntity implements ProgramWeekEntity {
  const _ProgramWeekEntity({required this.id, required this.programId, required this.weekNumber, required this.title, this.description, final  List<WorkoutEntity>? workouts}): _workouts = workouts;
  

@override final  String id;
@override final  String programId;
@override final  int weekNumber;
@override final  String title;
@override final  String? description;
// Nested workouts (if fetched)
 final  List<WorkoutEntity>? _workouts;
// Nested workouts (if fetched)
@override List<WorkoutEntity>? get workouts {
  final value = _workouts;
  if (value == null) return null;
  if (_workouts is EqualUnmodifiableListView) return _workouts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of ProgramWeekEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProgramWeekEntityCopyWith<_ProgramWeekEntity> get copyWith => __$ProgramWeekEntityCopyWithImpl<_ProgramWeekEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProgramWeekEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.programId, programId) || other.programId == programId)&&(identical(other.weekNumber, weekNumber) || other.weekNumber == weekNumber)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._workouts, _workouts));
}


@override
int get hashCode => Object.hash(runtimeType,id,programId,weekNumber,title,description,const DeepCollectionEquality().hash(_workouts));

@override
String toString() {
  return 'ProgramWeekEntity(id: $id, programId: $programId, weekNumber: $weekNumber, title: $title, description: $description, workouts: $workouts)';
}


}

/// @nodoc
abstract mixin class _$ProgramWeekEntityCopyWith<$Res> implements $ProgramWeekEntityCopyWith<$Res> {
  factory _$ProgramWeekEntityCopyWith(_ProgramWeekEntity value, $Res Function(_ProgramWeekEntity) _then) = __$ProgramWeekEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String programId, int weekNumber, String title, String? description, List<WorkoutEntity>? workouts
});




}
/// @nodoc
class __$ProgramWeekEntityCopyWithImpl<$Res>
    implements _$ProgramWeekEntityCopyWith<$Res> {
  __$ProgramWeekEntityCopyWithImpl(this._self, this._then);

  final _ProgramWeekEntity _self;
  final $Res Function(_ProgramWeekEntity) _then;

/// Create a copy of ProgramWeekEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? programId = null,Object? weekNumber = null,Object? title = null,Object? description = freezed,Object? workouts = freezed,}) {
  return _then(_ProgramWeekEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,programId: null == programId ? _self.programId : programId // ignore: cast_nullable_to_non_nullable
as String,weekNumber: null == weekNumber ? _self.weekNumber : weekNumber // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,workouts: freezed == workouts ? _self._workouts : workouts // ignore: cast_nullable_to_non_nullable
as List<WorkoutEntity>?,
  ));
}


}

// dart format on
