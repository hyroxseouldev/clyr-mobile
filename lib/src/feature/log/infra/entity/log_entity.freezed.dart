// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'log_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LeaderboardEntryEntity {

 String get userId; String get userName; String? get userProfileImageUrl; DateTime get completedAt; Map<String, dynamic>? get content; int get rank;
/// Create a copy of LeaderboardEntryEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LeaderboardEntryEntityCopyWith<LeaderboardEntryEntity> get copyWith => _$LeaderboardEntryEntityCopyWithImpl<LeaderboardEntryEntity>(this as LeaderboardEntryEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LeaderboardEntryEntity&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.userProfileImageUrl, userProfileImageUrl) || other.userProfileImageUrl == userProfileImageUrl)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&const DeepCollectionEquality().equals(other.content, content)&&(identical(other.rank, rank) || other.rank == rank));
}


@override
int get hashCode => Object.hash(runtimeType,userId,userName,userProfileImageUrl,completedAt,const DeepCollectionEquality().hash(content),rank);

@override
String toString() {
  return 'LeaderboardEntryEntity(userId: $userId, userName: $userName, userProfileImageUrl: $userProfileImageUrl, completedAt: $completedAt, content: $content, rank: $rank)';
}


}

/// @nodoc
abstract mixin class $LeaderboardEntryEntityCopyWith<$Res>  {
  factory $LeaderboardEntryEntityCopyWith(LeaderboardEntryEntity value, $Res Function(LeaderboardEntryEntity) _then) = _$LeaderboardEntryEntityCopyWithImpl;
@useResult
$Res call({
 String userId, String userName, String? userProfileImageUrl, DateTime completedAt, Map<String, dynamic>? content, int rank
});




}
/// @nodoc
class _$LeaderboardEntryEntityCopyWithImpl<$Res>
    implements $LeaderboardEntryEntityCopyWith<$Res> {
  _$LeaderboardEntryEntityCopyWithImpl(this._self, this._then);

  final LeaderboardEntryEntity _self;
  final $Res Function(LeaderboardEntryEntity) _then;

/// Create a copy of LeaderboardEntryEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? userName = null,Object? userProfileImageUrl = freezed,Object? completedAt = null,Object? content = freezed,Object? rank = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,userProfileImageUrl: freezed == userProfileImageUrl ? _self.userProfileImageUrl : userProfileImageUrl // ignore: cast_nullable_to_non_nullable
as String?,completedAt: null == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,rank: null == rank ? _self.rank : rank // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [LeaderboardEntryEntity].
extension LeaderboardEntryEntityPatterns on LeaderboardEntryEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LeaderboardEntryEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LeaderboardEntryEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LeaderboardEntryEntity value)  $default,){
final _that = this;
switch (_that) {
case _LeaderboardEntryEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LeaderboardEntryEntity value)?  $default,){
final _that = this;
switch (_that) {
case _LeaderboardEntryEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  String userName,  String? userProfileImageUrl,  DateTime completedAt,  Map<String, dynamic>? content,  int rank)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LeaderboardEntryEntity() when $default != null:
return $default(_that.userId,_that.userName,_that.userProfileImageUrl,_that.completedAt,_that.content,_that.rank);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  String userName,  String? userProfileImageUrl,  DateTime completedAt,  Map<String, dynamic>? content,  int rank)  $default,) {final _that = this;
switch (_that) {
case _LeaderboardEntryEntity():
return $default(_that.userId,_that.userName,_that.userProfileImageUrl,_that.completedAt,_that.content,_that.rank);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId,  String userName,  String? userProfileImageUrl,  DateTime completedAt,  Map<String, dynamic>? content,  int rank)?  $default,) {final _that = this;
switch (_that) {
case _LeaderboardEntryEntity() when $default != null:
return $default(_that.userId,_that.userName,_that.userProfileImageUrl,_that.completedAt,_that.content,_that.rank);case _:
  return null;

}
}

}

/// @nodoc


class _LeaderboardEntryEntity implements LeaderboardEntryEntity {
  const _LeaderboardEntryEntity({required this.userId, required this.userName, required this.userProfileImageUrl, required this.completedAt, required final  Map<String, dynamic>? content, required this.rank}): _content = content;
  

@override final  String userId;
@override final  String userName;
@override final  String? userProfileImageUrl;
@override final  DateTime completedAt;
 final  Map<String, dynamic>? _content;
@override Map<String, dynamic>? get content {
  final value = _content;
  if (value == null) return null;
  if (_content is EqualUnmodifiableMapView) return _content;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override final  int rank;

/// Create a copy of LeaderboardEntryEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LeaderboardEntryEntityCopyWith<_LeaderboardEntryEntity> get copyWith => __$LeaderboardEntryEntityCopyWithImpl<_LeaderboardEntryEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LeaderboardEntryEntity&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.userProfileImageUrl, userProfileImageUrl) || other.userProfileImageUrl == userProfileImageUrl)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&const DeepCollectionEquality().equals(other._content, _content)&&(identical(other.rank, rank) || other.rank == rank));
}


@override
int get hashCode => Object.hash(runtimeType,userId,userName,userProfileImageUrl,completedAt,const DeepCollectionEquality().hash(_content),rank);

@override
String toString() {
  return 'LeaderboardEntryEntity(userId: $userId, userName: $userName, userProfileImageUrl: $userProfileImageUrl, completedAt: $completedAt, content: $content, rank: $rank)';
}


}

/// @nodoc
abstract mixin class _$LeaderboardEntryEntityCopyWith<$Res> implements $LeaderboardEntryEntityCopyWith<$Res> {
  factory _$LeaderboardEntryEntityCopyWith(_LeaderboardEntryEntity value, $Res Function(_LeaderboardEntryEntity) _then) = __$LeaderboardEntryEntityCopyWithImpl;
@override @useResult
$Res call({
 String userId, String userName, String? userProfileImageUrl, DateTime completedAt, Map<String, dynamic>? content, int rank
});




}
/// @nodoc
class __$LeaderboardEntryEntityCopyWithImpl<$Res>
    implements _$LeaderboardEntryEntityCopyWith<$Res> {
  __$LeaderboardEntryEntityCopyWithImpl(this._self, this._then);

  final _LeaderboardEntryEntity _self;
  final $Res Function(_LeaderboardEntryEntity) _then;

/// Create a copy of LeaderboardEntryEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? userName = null,Object? userProfileImageUrl = freezed,Object? completedAt = null,Object? content = freezed,Object? rank = null,}) {
  return _then(_LeaderboardEntryEntity(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,userProfileImageUrl: freezed == userProfileImageUrl ? _self.userProfileImageUrl : userProfileImageUrl // ignore: cast_nullable_to_non_nullable
as String?,completedAt: null == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime,content: freezed == content ? _self._content : content // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,rank: null == rank ? _self.rank : rank // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
