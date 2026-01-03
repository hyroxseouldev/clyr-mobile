// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_daily_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WorkoutDailyEntity {

/// enrollment 레코드 존재 여부
 bool get hasEnrollment;/// enrollment 시작 날짜가 설정되었는지 여부
 bool get isStartDateSet;/// 미래 날짜 접근 제한 여부 (4일 뒤 이후 접근 불가)
 bool get isFutureRestricted;/// 시작 날짜 이전 여부 (프로그램 시작 전)
 bool get isBeforeStartDate;/// 해당 날짜의 워크아웃 정보 (설정된 시작 날짜로부터 계산된 dayNumber)
///
/// - null: 해당 날짜에 할당된 워크아웃 없음 (휴식일 또는 프로그램 기간 종료)
/// - 값: 계산된 dayNumber에 해당하는 워크아웃과 세션 정보
 WorkoutWithSession? get workout;
/// Create a copy of WorkoutDailyEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkoutDailyEntityCopyWith<WorkoutDailyEntity> get copyWith => _$WorkoutDailyEntityCopyWithImpl<WorkoutDailyEntity>(this as WorkoutDailyEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkoutDailyEntity&&(identical(other.hasEnrollment, hasEnrollment) || other.hasEnrollment == hasEnrollment)&&(identical(other.isStartDateSet, isStartDateSet) || other.isStartDateSet == isStartDateSet)&&(identical(other.isFutureRestricted, isFutureRestricted) || other.isFutureRestricted == isFutureRestricted)&&(identical(other.isBeforeStartDate, isBeforeStartDate) || other.isBeforeStartDate == isBeforeStartDate)&&(identical(other.workout, workout) || other.workout == workout));
}


@override
int get hashCode => Object.hash(runtimeType,hasEnrollment,isStartDateSet,isFutureRestricted,isBeforeStartDate,workout);

@override
String toString() {
  return 'WorkoutDailyEntity(hasEnrollment: $hasEnrollment, isStartDateSet: $isStartDateSet, isFutureRestricted: $isFutureRestricted, isBeforeStartDate: $isBeforeStartDate, workout: $workout)';
}


}

/// @nodoc
abstract mixin class $WorkoutDailyEntityCopyWith<$Res>  {
  factory $WorkoutDailyEntityCopyWith(WorkoutDailyEntity value, $Res Function(WorkoutDailyEntity) _then) = _$WorkoutDailyEntityCopyWithImpl;
@useResult
$Res call({
 bool hasEnrollment, bool isStartDateSet, bool isFutureRestricted, bool isBeforeStartDate, WorkoutWithSession? workout
});


$WorkoutWithSessionCopyWith<$Res>? get workout;

}
/// @nodoc
class _$WorkoutDailyEntityCopyWithImpl<$Res>
    implements $WorkoutDailyEntityCopyWith<$Res> {
  _$WorkoutDailyEntityCopyWithImpl(this._self, this._then);

  final WorkoutDailyEntity _self;
  final $Res Function(WorkoutDailyEntity) _then;

/// Create a copy of WorkoutDailyEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hasEnrollment = null,Object? isStartDateSet = null,Object? isFutureRestricted = null,Object? isBeforeStartDate = null,Object? workout = freezed,}) {
  return _then(_self.copyWith(
hasEnrollment: null == hasEnrollment ? _self.hasEnrollment : hasEnrollment // ignore: cast_nullable_to_non_nullable
as bool,isStartDateSet: null == isStartDateSet ? _self.isStartDateSet : isStartDateSet // ignore: cast_nullable_to_non_nullable
as bool,isFutureRestricted: null == isFutureRestricted ? _self.isFutureRestricted : isFutureRestricted // ignore: cast_nullable_to_non_nullable
as bool,isBeforeStartDate: null == isBeforeStartDate ? _self.isBeforeStartDate : isBeforeStartDate // ignore: cast_nullable_to_non_nullable
as bool,workout: freezed == workout ? _self.workout : workout // ignore: cast_nullable_to_non_nullable
as WorkoutWithSession?,
  ));
}
/// Create a copy of WorkoutDailyEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WorkoutWithSessionCopyWith<$Res>? get workout {
    if (_self.workout == null) {
    return null;
  }

  return $WorkoutWithSessionCopyWith<$Res>(_self.workout!, (value) {
    return _then(_self.copyWith(workout: value));
  });
}
}


/// Adds pattern-matching-related methods to [WorkoutDailyEntity].
extension WorkoutDailyEntityPatterns on WorkoutDailyEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WorkoutDailyEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WorkoutDailyEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WorkoutDailyEntity value)  $default,){
final _that = this;
switch (_that) {
case _WorkoutDailyEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WorkoutDailyEntity value)?  $default,){
final _that = this;
switch (_that) {
case _WorkoutDailyEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool hasEnrollment,  bool isStartDateSet,  bool isFutureRestricted,  bool isBeforeStartDate,  WorkoutWithSession? workout)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorkoutDailyEntity() when $default != null:
return $default(_that.hasEnrollment,_that.isStartDateSet,_that.isFutureRestricted,_that.isBeforeStartDate,_that.workout);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool hasEnrollment,  bool isStartDateSet,  bool isFutureRestricted,  bool isBeforeStartDate,  WorkoutWithSession? workout)  $default,) {final _that = this;
switch (_that) {
case _WorkoutDailyEntity():
return $default(_that.hasEnrollment,_that.isStartDateSet,_that.isFutureRestricted,_that.isBeforeStartDate,_that.workout);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool hasEnrollment,  bool isStartDateSet,  bool isFutureRestricted,  bool isBeforeStartDate,  WorkoutWithSession? workout)?  $default,) {final _that = this;
switch (_that) {
case _WorkoutDailyEntity() when $default != null:
return $default(_that.hasEnrollment,_that.isStartDateSet,_that.isFutureRestricted,_that.isBeforeStartDate,_that.workout);case _:
  return null;

}
}

}

/// @nodoc


class _WorkoutDailyEntity implements WorkoutDailyEntity {
  const _WorkoutDailyEntity({required this.hasEnrollment, required this.isStartDateSet, required this.isFutureRestricted, required this.isBeforeStartDate, this.workout});
  

/// enrollment 레코드 존재 여부
@override final  bool hasEnrollment;
/// enrollment 시작 날짜가 설정되었는지 여부
@override final  bool isStartDateSet;
/// 미래 날짜 접근 제한 여부 (4일 뒤 이후 접근 불가)
@override final  bool isFutureRestricted;
/// 시작 날짜 이전 여부 (프로그램 시작 전)
@override final  bool isBeforeStartDate;
/// 해당 날짜의 워크아웃 정보 (설정된 시작 날짜로부터 계산된 dayNumber)
///
/// - null: 해당 날짜에 할당된 워크아웃 없음 (휴식일 또는 프로그램 기간 종료)
/// - 값: 계산된 dayNumber에 해당하는 워크아웃과 세션 정보
@override final  WorkoutWithSession? workout;

/// Create a copy of WorkoutDailyEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkoutDailyEntityCopyWith<_WorkoutDailyEntity> get copyWith => __$WorkoutDailyEntityCopyWithImpl<_WorkoutDailyEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkoutDailyEntity&&(identical(other.hasEnrollment, hasEnrollment) || other.hasEnrollment == hasEnrollment)&&(identical(other.isStartDateSet, isStartDateSet) || other.isStartDateSet == isStartDateSet)&&(identical(other.isFutureRestricted, isFutureRestricted) || other.isFutureRestricted == isFutureRestricted)&&(identical(other.isBeforeStartDate, isBeforeStartDate) || other.isBeforeStartDate == isBeforeStartDate)&&(identical(other.workout, workout) || other.workout == workout));
}


@override
int get hashCode => Object.hash(runtimeType,hasEnrollment,isStartDateSet,isFutureRestricted,isBeforeStartDate,workout);

@override
String toString() {
  return 'WorkoutDailyEntity(hasEnrollment: $hasEnrollment, isStartDateSet: $isStartDateSet, isFutureRestricted: $isFutureRestricted, isBeforeStartDate: $isBeforeStartDate, workout: $workout)';
}


}

/// @nodoc
abstract mixin class _$WorkoutDailyEntityCopyWith<$Res> implements $WorkoutDailyEntityCopyWith<$Res> {
  factory _$WorkoutDailyEntityCopyWith(_WorkoutDailyEntity value, $Res Function(_WorkoutDailyEntity) _then) = __$WorkoutDailyEntityCopyWithImpl;
@override @useResult
$Res call({
 bool hasEnrollment, bool isStartDateSet, bool isFutureRestricted, bool isBeforeStartDate, WorkoutWithSession? workout
});


@override $WorkoutWithSessionCopyWith<$Res>? get workout;

}
/// @nodoc
class __$WorkoutDailyEntityCopyWithImpl<$Res>
    implements _$WorkoutDailyEntityCopyWith<$Res> {
  __$WorkoutDailyEntityCopyWithImpl(this._self, this._then);

  final _WorkoutDailyEntity _self;
  final $Res Function(_WorkoutDailyEntity) _then;

/// Create a copy of WorkoutDailyEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hasEnrollment = null,Object? isStartDateSet = null,Object? isFutureRestricted = null,Object? isBeforeStartDate = null,Object? workout = freezed,}) {
  return _then(_WorkoutDailyEntity(
hasEnrollment: null == hasEnrollment ? _self.hasEnrollment : hasEnrollment // ignore: cast_nullable_to_non_nullable
as bool,isStartDateSet: null == isStartDateSet ? _self.isStartDateSet : isStartDateSet // ignore: cast_nullable_to_non_nullable
as bool,isFutureRestricted: null == isFutureRestricted ? _self.isFutureRestricted : isFutureRestricted // ignore: cast_nullable_to_non_nullable
as bool,isBeforeStartDate: null == isBeforeStartDate ? _self.isBeforeStartDate : isBeforeStartDate // ignore: cast_nullable_to_non_nullable
as bool,workout: freezed == workout ? _self.workout : workout // ignore: cast_nullable_to_non_nullable
as WorkoutWithSession?,
  ));
}

/// Create a copy of WorkoutDailyEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WorkoutWithSessionCopyWith<$Res>? get workout {
    if (_self.workout == null) {
    return null;
  }

  return $WorkoutWithSessionCopyWith<$Res>(_self.workout!, (value) {
    return _then(_self.copyWith(workout: value));
  });
}
}

/// @nodoc
mixin _$WorkoutWithSession {

/// 기본 워크아웃 정보
 WorkoutEntity get workout;/// 워크아웃에 속한 세션 목록
 List<WorkoutSessionEntity> get sessions;/// enrollment 시작 날짜로부터 계산된 상대 dayNumber
/// (예: 시작일이 1일차, 시작일+1이 2일차)
 int get relativeDayNumber;
/// Create a copy of WorkoutWithSession
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkoutWithSessionCopyWith<WorkoutWithSession> get copyWith => _$WorkoutWithSessionCopyWithImpl<WorkoutWithSession>(this as WorkoutWithSession, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkoutWithSession&&(identical(other.workout, workout) || other.workout == workout)&&const DeepCollectionEquality().equals(other.sessions, sessions)&&(identical(other.relativeDayNumber, relativeDayNumber) || other.relativeDayNumber == relativeDayNumber));
}


@override
int get hashCode => Object.hash(runtimeType,workout,const DeepCollectionEquality().hash(sessions),relativeDayNumber);

@override
String toString() {
  return 'WorkoutWithSession(workout: $workout, sessions: $sessions, relativeDayNumber: $relativeDayNumber)';
}


}

/// @nodoc
abstract mixin class $WorkoutWithSessionCopyWith<$Res>  {
  factory $WorkoutWithSessionCopyWith(WorkoutWithSession value, $Res Function(WorkoutWithSession) _then) = _$WorkoutWithSessionCopyWithImpl;
@useResult
$Res call({
 WorkoutEntity workout, List<WorkoutSessionEntity> sessions, int relativeDayNumber
});


$WorkoutEntityCopyWith<$Res> get workout;

}
/// @nodoc
class _$WorkoutWithSessionCopyWithImpl<$Res>
    implements $WorkoutWithSessionCopyWith<$Res> {
  _$WorkoutWithSessionCopyWithImpl(this._self, this._then);

  final WorkoutWithSession _self;
  final $Res Function(WorkoutWithSession) _then;

/// Create a copy of WorkoutWithSession
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? workout = null,Object? sessions = null,Object? relativeDayNumber = null,}) {
  return _then(_self.copyWith(
workout: null == workout ? _self.workout : workout // ignore: cast_nullable_to_non_nullable
as WorkoutEntity,sessions: null == sessions ? _self.sessions : sessions // ignore: cast_nullable_to_non_nullable
as List<WorkoutSessionEntity>,relativeDayNumber: null == relativeDayNumber ? _self.relativeDayNumber : relativeDayNumber // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of WorkoutWithSession
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WorkoutEntityCopyWith<$Res> get workout {
  
  return $WorkoutEntityCopyWith<$Res>(_self.workout, (value) {
    return _then(_self.copyWith(workout: value));
  });
}
}


/// Adds pattern-matching-related methods to [WorkoutWithSession].
extension WorkoutWithSessionPatterns on WorkoutWithSession {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WorkoutWithSession value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WorkoutWithSession() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WorkoutWithSession value)  $default,){
final _that = this;
switch (_that) {
case _WorkoutWithSession():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WorkoutWithSession value)?  $default,){
final _that = this;
switch (_that) {
case _WorkoutWithSession() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( WorkoutEntity workout,  List<WorkoutSessionEntity> sessions,  int relativeDayNumber)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorkoutWithSession() when $default != null:
return $default(_that.workout,_that.sessions,_that.relativeDayNumber);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( WorkoutEntity workout,  List<WorkoutSessionEntity> sessions,  int relativeDayNumber)  $default,) {final _that = this;
switch (_that) {
case _WorkoutWithSession():
return $default(_that.workout,_that.sessions,_that.relativeDayNumber);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( WorkoutEntity workout,  List<WorkoutSessionEntity> sessions,  int relativeDayNumber)?  $default,) {final _that = this;
switch (_that) {
case _WorkoutWithSession() when $default != null:
return $default(_that.workout,_that.sessions,_that.relativeDayNumber);case _:
  return null;

}
}

}

/// @nodoc


class _WorkoutWithSession implements WorkoutWithSession {
  const _WorkoutWithSession({required this.workout, required final  List<WorkoutSessionEntity> sessions, required this.relativeDayNumber}): _sessions = sessions;
  

/// 기본 워크아웃 정보
@override final  WorkoutEntity workout;
/// 워크아웃에 속한 세션 목록
 final  List<WorkoutSessionEntity> _sessions;
/// 워크아웃에 속한 세션 목록
@override List<WorkoutSessionEntity> get sessions {
  if (_sessions is EqualUnmodifiableListView) return _sessions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sessions);
}

/// enrollment 시작 날짜로부터 계산된 상대 dayNumber
/// (예: 시작일이 1일차, 시작일+1이 2일차)
@override final  int relativeDayNumber;

/// Create a copy of WorkoutWithSession
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkoutWithSessionCopyWith<_WorkoutWithSession> get copyWith => __$WorkoutWithSessionCopyWithImpl<_WorkoutWithSession>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkoutWithSession&&(identical(other.workout, workout) || other.workout == workout)&&const DeepCollectionEquality().equals(other._sessions, _sessions)&&(identical(other.relativeDayNumber, relativeDayNumber) || other.relativeDayNumber == relativeDayNumber));
}


@override
int get hashCode => Object.hash(runtimeType,workout,const DeepCollectionEquality().hash(_sessions),relativeDayNumber);

@override
String toString() {
  return 'WorkoutWithSession(workout: $workout, sessions: $sessions, relativeDayNumber: $relativeDayNumber)';
}


}

/// @nodoc
abstract mixin class _$WorkoutWithSessionCopyWith<$Res> implements $WorkoutWithSessionCopyWith<$Res> {
  factory _$WorkoutWithSessionCopyWith(_WorkoutWithSession value, $Res Function(_WorkoutWithSession) _then) = __$WorkoutWithSessionCopyWithImpl;
@override @useResult
$Res call({
 WorkoutEntity workout, List<WorkoutSessionEntity> sessions, int relativeDayNumber
});


@override $WorkoutEntityCopyWith<$Res> get workout;

}
/// @nodoc
class __$WorkoutWithSessionCopyWithImpl<$Res>
    implements _$WorkoutWithSessionCopyWith<$Res> {
  __$WorkoutWithSessionCopyWithImpl(this._self, this._then);

  final _WorkoutWithSession _self;
  final $Res Function(_WorkoutWithSession) _then;

/// Create a copy of WorkoutWithSession
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? workout = null,Object? sessions = null,Object? relativeDayNumber = null,}) {
  return _then(_WorkoutWithSession(
workout: null == workout ? _self.workout : workout // ignore: cast_nullable_to_non_nullable
as WorkoutEntity,sessions: null == sessions ? _self._sessions : sessions // ignore: cast_nullable_to_non_nullable
as List<WorkoutSessionEntity>,relativeDayNumber: null == relativeDayNumber ? _self.relativeDayNumber : relativeDayNumber // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of WorkoutWithSession
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WorkoutEntityCopyWith<$Res> get workout {
  
  return $WorkoutEntityCopyWith<$Res>(_self.workout, (value) {
    return _then(_self.copyWith(workout: value));
  });
}
}

// dart format on
