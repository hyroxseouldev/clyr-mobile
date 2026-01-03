// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserProfileEntity {

 String get accountId; String get nickname; String get bio; String get profileImageUrl; String get phoneNumber; List<String> get fitnessGoals; String get fitnessLevel; DateTime get updatedAt;
/// Create a copy of UserProfileEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserProfileEntityCopyWith<UserProfileEntity> get copyWith => _$UserProfileEntityCopyWithImpl<UserProfileEntity>(this as UserProfileEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserProfileEntity&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.profileImageUrl, profileImageUrl) || other.profileImageUrl == profileImageUrl)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&const DeepCollectionEquality().equals(other.fitnessGoals, fitnessGoals)&&(identical(other.fitnessLevel, fitnessLevel) || other.fitnessLevel == fitnessLevel)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,accountId,nickname,bio,profileImageUrl,phoneNumber,const DeepCollectionEquality().hash(fitnessGoals),fitnessLevel,updatedAt);

@override
String toString() {
  return 'UserProfileEntity(accountId: $accountId, nickname: $nickname, bio: $bio, profileImageUrl: $profileImageUrl, phoneNumber: $phoneNumber, fitnessGoals: $fitnessGoals, fitnessLevel: $fitnessLevel, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $UserProfileEntityCopyWith<$Res>  {
  factory $UserProfileEntityCopyWith(UserProfileEntity value, $Res Function(UserProfileEntity) _then) = _$UserProfileEntityCopyWithImpl;
@useResult
$Res call({
 String accountId, String nickname, String bio, String profileImageUrl, String phoneNumber, List<String> fitnessGoals, String fitnessLevel, DateTime updatedAt
});




}
/// @nodoc
class _$UserProfileEntityCopyWithImpl<$Res>
    implements $UserProfileEntityCopyWith<$Res> {
  _$UserProfileEntityCopyWithImpl(this._self, this._then);

  final UserProfileEntity _self;
  final $Res Function(UserProfileEntity) _then;

/// Create a copy of UserProfileEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accountId = null,Object? nickname = null,Object? bio = null,Object? profileImageUrl = null,Object? phoneNumber = null,Object? fitnessGoals = null,Object? fitnessLevel = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as String,nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,bio: null == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String,profileImageUrl: null == profileImageUrl ? _self.profileImageUrl : profileImageUrl // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,fitnessGoals: null == fitnessGoals ? _self.fitnessGoals : fitnessGoals // ignore: cast_nullable_to_non_nullable
as List<String>,fitnessLevel: null == fitnessLevel ? _self.fitnessLevel : fitnessLevel // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [UserProfileEntity].
extension UserProfileEntityPatterns on UserProfileEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserProfileEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserProfileEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserProfileEntity value)  $default,){
final _that = this;
switch (_that) {
case _UserProfileEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserProfileEntity value)?  $default,){
final _that = this;
switch (_that) {
case _UserProfileEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String accountId,  String nickname,  String bio,  String profileImageUrl,  String phoneNumber,  List<String> fitnessGoals,  String fitnessLevel,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserProfileEntity() when $default != null:
return $default(_that.accountId,_that.nickname,_that.bio,_that.profileImageUrl,_that.phoneNumber,_that.fitnessGoals,_that.fitnessLevel,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String accountId,  String nickname,  String bio,  String profileImageUrl,  String phoneNumber,  List<String> fitnessGoals,  String fitnessLevel,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _UserProfileEntity():
return $default(_that.accountId,_that.nickname,_that.bio,_that.profileImageUrl,_that.phoneNumber,_that.fitnessGoals,_that.fitnessLevel,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String accountId,  String nickname,  String bio,  String profileImageUrl,  String phoneNumber,  List<String> fitnessGoals,  String fitnessLevel,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _UserProfileEntity() when $default != null:
return $default(_that.accountId,_that.nickname,_that.bio,_that.profileImageUrl,_that.phoneNumber,_that.fitnessGoals,_that.fitnessLevel,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _UserProfileEntity implements UserProfileEntity {
  const _UserProfileEntity({required this.accountId, required this.nickname, required this.bio, required this.profileImageUrl, required this.phoneNumber, required final  List<String> fitnessGoals, required this.fitnessLevel, required this.updatedAt}): _fitnessGoals = fitnessGoals;
  

@override final  String accountId;
@override final  String nickname;
@override final  String bio;
@override final  String profileImageUrl;
@override final  String phoneNumber;
 final  List<String> _fitnessGoals;
@override List<String> get fitnessGoals {
  if (_fitnessGoals is EqualUnmodifiableListView) return _fitnessGoals;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_fitnessGoals);
}

@override final  String fitnessLevel;
@override final  DateTime updatedAt;

/// Create a copy of UserProfileEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserProfileEntityCopyWith<_UserProfileEntity> get copyWith => __$UserProfileEntityCopyWithImpl<_UserProfileEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserProfileEntity&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.profileImageUrl, profileImageUrl) || other.profileImageUrl == profileImageUrl)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&const DeepCollectionEquality().equals(other._fitnessGoals, _fitnessGoals)&&(identical(other.fitnessLevel, fitnessLevel) || other.fitnessLevel == fitnessLevel)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,accountId,nickname,bio,profileImageUrl,phoneNumber,const DeepCollectionEquality().hash(_fitnessGoals),fitnessLevel,updatedAt);

@override
String toString() {
  return 'UserProfileEntity(accountId: $accountId, nickname: $nickname, bio: $bio, profileImageUrl: $profileImageUrl, phoneNumber: $phoneNumber, fitnessGoals: $fitnessGoals, fitnessLevel: $fitnessLevel, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$UserProfileEntityCopyWith<$Res> implements $UserProfileEntityCopyWith<$Res> {
  factory _$UserProfileEntityCopyWith(_UserProfileEntity value, $Res Function(_UserProfileEntity) _then) = __$UserProfileEntityCopyWithImpl;
@override @useResult
$Res call({
 String accountId, String nickname, String bio, String profileImageUrl, String phoneNumber, List<String> fitnessGoals, String fitnessLevel, DateTime updatedAt
});




}
/// @nodoc
class __$UserProfileEntityCopyWithImpl<$Res>
    implements _$UserProfileEntityCopyWith<$Res> {
  __$UserProfileEntityCopyWithImpl(this._self, this._then);

  final _UserProfileEntity _self;
  final $Res Function(_UserProfileEntity) _then;

/// Create a copy of UserProfileEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accountId = null,Object? nickname = null,Object? bio = null,Object? profileImageUrl = null,Object? phoneNumber = null,Object? fitnessGoals = null,Object? fitnessLevel = null,Object? updatedAt = null,}) {
  return _then(_UserProfileEntity(
accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as String,nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,bio: null == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String,profileImageUrl: null == profileImageUrl ? _self.profileImageUrl : profileImageUrl // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,fitnessGoals: null == fitnessGoals ? _self._fitnessGoals : fitnessGoals // ignore: cast_nullable_to_non_nullable
as List<String>,fitnessLevel: null == fitnessLevel ? _self.fitnessLevel : fitnessLevel // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
