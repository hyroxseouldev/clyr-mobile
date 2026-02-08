// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'community_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CommunityEntity {

 String get id; String get title; String get content; String? get imageUrl; DateTime get eventDate; String get location; int get maxParticipants; String get creatorId; DateTime get createdAt; DateTime get updatedAt; CreatorProfileEntity? get creator; int get currentParticipants; bool get isUserMember;
/// Create a copy of CommunityEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommunityEntityCopyWith<CommunityEntity> get copyWith => _$CommunityEntityCopyWithImpl<CommunityEntity>(this as CommunityEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommunityEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.eventDate, eventDate) || other.eventDate == eventDate)&&(identical(other.location, location) || other.location == location)&&(identical(other.maxParticipants, maxParticipants) || other.maxParticipants == maxParticipants)&&(identical(other.creatorId, creatorId) || other.creatorId == creatorId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.creator, creator) || other.creator == creator)&&(identical(other.currentParticipants, currentParticipants) || other.currentParticipants == currentParticipants)&&(identical(other.isUserMember, isUserMember) || other.isUserMember == isUserMember));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,content,imageUrl,eventDate,location,maxParticipants,creatorId,createdAt,updatedAt,creator,currentParticipants,isUserMember);

@override
String toString() {
  return 'CommunityEntity(id: $id, title: $title, content: $content, imageUrl: $imageUrl, eventDate: $eventDate, location: $location, maxParticipants: $maxParticipants, creatorId: $creatorId, createdAt: $createdAt, updatedAt: $updatedAt, creator: $creator, currentParticipants: $currentParticipants, isUserMember: $isUserMember)';
}


}

/// @nodoc
abstract mixin class $CommunityEntityCopyWith<$Res>  {
  factory $CommunityEntityCopyWith(CommunityEntity value, $Res Function(CommunityEntity) _then) = _$CommunityEntityCopyWithImpl;
@useResult
$Res call({
 String id, String title, String content, String? imageUrl, DateTime eventDate, String location, int maxParticipants, String creatorId, DateTime createdAt, DateTime updatedAt, CreatorProfileEntity? creator, int currentParticipants, bool isUserMember
});


$CreatorProfileEntityCopyWith<$Res>? get creator;

}
/// @nodoc
class _$CommunityEntityCopyWithImpl<$Res>
    implements $CommunityEntityCopyWith<$Res> {
  _$CommunityEntityCopyWithImpl(this._self, this._then);

  final CommunityEntity _self;
  final $Res Function(CommunityEntity) _then;

/// Create a copy of CommunityEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? content = null,Object? imageUrl = freezed,Object? eventDate = null,Object? location = null,Object? maxParticipants = null,Object? creatorId = null,Object? createdAt = null,Object? updatedAt = null,Object? creator = freezed,Object? currentParticipants = null,Object? isUserMember = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,eventDate: null == eventDate ? _self.eventDate : eventDate // ignore: cast_nullable_to_non_nullable
as DateTime,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,maxParticipants: null == maxParticipants ? _self.maxParticipants : maxParticipants // ignore: cast_nullable_to_non_nullable
as int,creatorId: null == creatorId ? _self.creatorId : creatorId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,creator: freezed == creator ? _self.creator : creator // ignore: cast_nullable_to_non_nullable
as CreatorProfileEntity?,currentParticipants: null == currentParticipants ? _self.currentParticipants : currentParticipants // ignore: cast_nullable_to_non_nullable
as int,isUserMember: null == isUserMember ? _self.isUserMember : isUserMember // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of CommunityEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CreatorProfileEntityCopyWith<$Res>? get creator {
    if (_self.creator == null) {
    return null;
  }

  return $CreatorProfileEntityCopyWith<$Res>(_self.creator!, (value) {
    return _then(_self.copyWith(creator: value));
  });
}
}


/// Adds pattern-matching-related methods to [CommunityEntity].
extension CommunityEntityPatterns on CommunityEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CommunityEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CommunityEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CommunityEntity value)  $default,){
final _that = this;
switch (_that) {
case _CommunityEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CommunityEntity value)?  $default,){
final _that = this;
switch (_that) {
case _CommunityEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String content,  String? imageUrl,  DateTime eventDate,  String location,  int maxParticipants,  String creatorId,  DateTime createdAt,  DateTime updatedAt,  CreatorProfileEntity? creator,  int currentParticipants,  bool isUserMember)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CommunityEntity() when $default != null:
return $default(_that.id,_that.title,_that.content,_that.imageUrl,_that.eventDate,_that.location,_that.maxParticipants,_that.creatorId,_that.createdAt,_that.updatedAt,_that.creator,_that.currentParticipants,_that.isUserMember);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String content,  String? imageUrl,  DateTime eventDate,  String location,  int maxParticipants,  String creatorId,  DateTime createdAt,  DateTime updatedAt,  CreatorProfileEntity? creator,  int currentParticipants,  bool isUserMember)  $default,) {final _that = this;
switch (_that) {
case _CommunityEntity():
return $default(_that.id,_that.title,_that.content,_that.imageUrl,_that.eventDate,_that.location,_that.maxParticipants,_that.creatorId,_that.createdAt,_that.updatedAt,_that.creator,_that.currentParticipants,_that.isUserMember);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String content,  String? imageUrl,  DateTime eventDate,  String location,  int maxParticipants,  String creatorId,  DateTime createdAt,  DateTime updatedAt,  CreatorProfileEntity? creator,  int currentParticipants,  bool isUserMember)?  $default,) {final _that = this;
switch (_that) {
case _CommunityEntity() when $default != null:
return $default(_that.id,_that.title,_that.content,_that.imageUrl,_that.eventDate,_that.location,_that.maxParticipants,_that.creatorId,_that.createdAt,_that.updatedAt,_that.creator,_that.currentParticipants,_that.isUserMember);case _:
  return null;

}
}

}

/// @nodoc


class _CommunityEntity implements CommunityEntity {
  const _CommunityEntity({required this.id, required this.title, required this.content, this.imageUrl, required this.eventDate, required this.location, required this.maxParticipants, required this.creatorId, required this.createdAt, required this.updatedAt, this.creator, this.currentParticipants = 0, this.isUserMember = false});
  

@override final  String id;
@override final  String title;
@override final  String content;
@override final  String? imageUrl;
@override final  DateTime eventDate;
@override final  String location;
@override final  int maxParticipants;
@override final  String creatorId;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override final  CreatorProfileEntity? creator;
@override@JsonKey() final  int currentParticipants;
@override@JsonKey() final  bool isUserMember;

/// Create a copy of CommunityEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommunityEntityCopyWith<_CommunityEntity> get copyWith => __$CommunityEntityCopyWithImpl<_CommunityEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CommunityEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.eventDate, eventDate) || other.eventDate == eventDate)&&(identical(other.location, location) || other.location == location)&&(identical(other.maxParticipants, maxParticipants) || other.maxParticipants == maxParticipants)&&(identical(other.creatorId, creatorId) || other.creatorId == creatorId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.creator, creator) || other.creator == creator)&&(identical(other.currentParticipants, currentParticipants) || other.currentParticipants == currentParticipants)&&(identical(other.isUserMember, isUserMember) || other.isUserMember == isUserMember));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,content,imageUrl,eventDate,location,maxParticipants,creatorId,createdAt,updatedAt,creator,currentParticipants,isUserMember);

@override
String toString() {
  return 'CommunityEntity(id: $id, title: $title, content: $content, imageUrl: $imageUrl, eventDate: $eventDate, location: $location, maxParticipants: $maxParticipants, creatorId: $creatorId, createdAt: $createdAt, updatedAt: $updatedAt, creator: $creator, currentParticipants: $currentParticipants, isUserMember: $isUserMember)';
}


}

/// @nodoc
abstract mixin class _$CommunityEntityCopyWith<$Res> implements $CommunityEntityCopyWith<$Res> {
  factory _$CommunityEntityCopyWith(_CommunityEntity value, $Res Function(_CommunityEntity) _then) = __$CommunityEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String content, String? imageUrl, DateTime eventDate, String location, int maxParticipants, String creatorId, DateTime createdAt, DateTime updatedAt, CreatorProfileEntity? creator, int currentParticipants, bool isUserMember
});


@override $CreatorProfileEntityCopyWith<$Res>? get creator;

}
/// @nodoc
class __$CommunityEntityCopyWithImpl<$Res>
    implements _$CommunityEntityCopyWith<$Res> {
  __$CommunityEntityCopyWithImpl(this._self, this._then);

  final _CommunityEntity _self;
  final $Res Function(_CommunityEntity) _then;

/// Create a copy of CommunityEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? content = null,Object? imageUrl = freezed,Object? eventDate = null,Object? location = null,Object? maxParticipants = null,Object? creatorId = null,Object? createdAt = null,Object? updatedAt = null,Object? creator = freezed,Object? currentParticipants = null,Object? isUserMember = null,}) {
  return _then(_CommunityEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,eventDate: null == eventDate ? _self.eventDate : eventDate // ignore: cast_nullable_to_non_nullable
as DateTime,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,maxParticipants: null == maxParticipants ? _self.maxParticipants : maxParticipants // ignore: cast_nullable_to_non_nullable
as int,creatorId: null == creatorId ? _self.creatorId : creatorId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,creator: freezed == creator ? _self.creator : creator // ignore: cast_nullable_to_non_nullable
as CreatorProfileEntity?,currentParticipants: null == currentParticipants ? _self.currentParticipants : currentParticipants // ignore: cast_nullable_to_non_nullable
as int,isUserMember: null == isUserMember ? _self.isUserMember : isUserMember // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of CommunityEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CreatorProfileEntityCopyWith<$Res>? get creator {
    if (_self.creator == null) {
    return null;
  }

  return $CreatorProfileEntityCopyWith<$Res>(_self.creator!, (value) {
    return _then(_self.copyWith(creator: value));
  });
}
}

/// @nodoc
mixin _$CreatorProfileEntity {

 String get id; String get fullName; String? get avatarUrl;
/// Create a copy of CreatorProfileEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreatorProfileEntityCopyWith<CreatorProfileEntity> get copyWith => _$CreatorProfileEntityCopyWithImpl<CreatorProfileEntity>(this as CreatorProfileEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatorProfileEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl));
}


@override
int get hashCode => Object.hash(runtimeType,id,fullName,avatarUrl);

@override
String toString() {
  return 'CreatorProfileEntity(id: $id, fullName: $fullName, avatarUrl: $avatarUrl)';
}


}

/// @nodoc
abstract mixin class $CreatorProfileEntityCopyWith<$Res>  {
  factory $CreatorProfileEntityCopyWith(CreatorProfileEntity value, $Res Function(CreatorProfileEntity) _then) = _$CreatorProfileEntityCopyWithImpl;
@useResult
$Res call({
 String id, String fullName, String? avatarUrl
});




}
/// @nodoc
class _$CreatorProfileEntityCopyWithImpl<$Res>
    implements $CreatorProfileEntityCopyWith<$Res> {
  _$CreatorProfileEntityCopyWithImpl(this._self, this._then);

  final CreatorProfileEntity _self;
  final $Res Function(CreatorProfileEntity) _then;

/// Create a copy of CreatorProfileEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? fullName = null,Object? avatarUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreatorProfileEntity].
extension CreatorProfileEntityPatterns on CreatorProfileEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreatorProfileEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreatorProfileEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreatorProfileEntity value)  $default,){
final _that = this;
switch (_that) {
case _CreatorProfileEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreatorProfileEntity value)?  $default,){
final _that = this;
switch (_that) {
case _CreatorProfileEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String fullName,  String? avatarUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreatorProfileEntity() when $default != null:
return $default(_that.id,_that.fullName,_that.avatarUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String fullName,  String? avatarUrl)  $default,) {final _that = this;
switch (_that) {
case _CreatorProfileEntity():
return $default(_that.id,_that.fullName,_that.avatarUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String fullName,  String? avatarUrl)?  $default,) {final _that = this;
switch (_that) {
case _CreatorProfileEntity() when $default != null:
return $default(_that.id,_that.fullName,_that.avatarUrl);case _:
  return null;

}
}

}

/// @nodoc


class _CreatorProfileEntity implements CreatorProfileEntity {
  const _CreatorProfileEntity({required this.id, required this.fullName, this.avatarUrl});
  

@override final  String id;
@override final  String fullName;
@override final  String? avatarUrl;

/// Create a copy of CreatorProfileEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreatorProfileEntityCopyWith<_CreatorProfileEntity> get copyWith => __$CreatorProfileEntityCopyWithImpl<_CreatorProfileEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreatorProfileEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl));
}


@override
int get hashCode => Object.hash(runtimeType,id,fullName,avatarUrl);

@override
String toString() {
  return 'CreatorProfileEntity(id: $id, fullName: $fullName, avatarUrl: $avatarUrl)';
}


}

/// @nodoc
abstract mixin class _$CreatorProfileEntityCopyWith<$Res> implements $CreatorProfileEntityCopyWith<$Res> {
  factory _$CreatorProfileEntityCopyWith(_CreatorProfileEntity value, $Res Function(_CreatorProfileEntity) _then) = __$CreatorProfileEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String fullName, String? avatarUrl
});




}
/// @nodoc
class __$CreatorProfileEntityCopyWithImpl<$Res>
    implements _$CreatorProfileEntityCopyWith<$Res> {
  __$CreatorProfileEntityCopyWithImpl(this._self, this._then);

  final _CreatorProfileEntity _self;
  final $Res Function(_CreatorProfileEntity) _then;

/// Create a copy of CreatorProfileEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? fullName = null,Object? avatarUrl = freezed,}) {
  return _then(_CreatorProfileEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$CommunityParticipantEntity {

 String get id; String get communityId; String get userId; DateTime get joinedAt; String? get userName; String? get userAvatarUrl;
/// Create a copy of CommunityParticipantEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommunityParticipantEntityCopyWith<CommunityParticipantEntity> get copyWith => _$CommunityParticipantEntityCopyWithImpl<CommunityParticipantEntity>(this as CommunityParticipantEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommunityParticipantEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.communityId, communityId) || other.communityId == communityId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.joinedAt, joinedAt) || other.joinedAt == joinedAt)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.userAvatarUrl, userAvatarUrl) || other.userAvatarUrl == userAvatarUrl));
}


@override
int get hashCode => Object.hash(runtimeType,id,communityId,userId,joinedAt,userName,userAvatarUrl);

@override
String toString() {
  return 'CommunityParticipantEntity(id: $id, communityId: $communityId, userId: $userId, joinedAt: $joinedAt, userName: $userName, userAvatarUrl: $userAvatarUrl)';
}


}

/// @nodoc
abstract mixin class $CommunityParticipantEntityCopyWith<$Res>  {
  factory $CommunityParticipantEntityCopyWith(CommunityParticipantEntity value, $Res Function(CommunityParticipantEntity) _then) = _$CommunityParticipantEntityCopyWithImpl;
@useResult
$Res call({
 String id, String communityId, String userId, DateTime joinedAt, String? userName, String? userAvatarUrl
});




}
/// @nodoc
class _$CommunityParticipantEntityCopyWithImpl<$Res>
    implements $CommunityParticipantEntityCopyWith<$Res> {
  _$CommunityParticipantEntityCopyWithImpl(this._self, this._then);

  final CommunityParticipantEntity _self;
  final $Res Function(CommunityParticipantEntity) _then;

/// Create a copy of CommunityParticipantEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? communityId = null,Object? userId = null,Object? joinedAt = null,Object? userName = freezed,Object? userAvatarUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,communityId: null == communityId ? _self.communityId : communityId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,joinedAt: null == joinedAt ? _self.joinedAt : joinedAt // ignore: cast_nullable_to_non_nullable
as DateTime,userName: freezed == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String?,userAvatarUrl: freezed == userAvatarUrl ? _self.userAvatarUrl : userAvatarUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CommunityParticipantEntity].
extension CommunityParticipantEntityPatterns on CommunityParticipantEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CommunityParticipantEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CommunityParticipantEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CommunityParticipantEntity value)  $default,){
final _that = this;
switch (_that) {
case _CommunityParticipantEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CommunityParticipantEntity value)?  $default,){
final _that = this;
switch (_that) {
case _CommunityParticipantEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String communityId,  String userId,  DateTime joinedAt,  String? userName,  String? userAvatarUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CommunityParticipantEntity() when $default != null:
return $default(_that.id,_that.communityId,_that.userId,_that.joinedAt,_that.userName,_that.userAvatarUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String communityId,  String userId,  DateTime joinedAt,  String? userName,  String? userAvatarUrl)  $default,) {final _that = this;
switch (_that) {
case _CommunityParticipantEntity():
return $default(_that.id,_that.communityId,_that.userId,_that.joinedAt,_that.userName,_that.userAvatarUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String communityId,  String userId,  DateTime joinedAt,  String? userName,  String? userAvatarUrl)?  $default,) {final _that = this;
switch (_that) {
case _CommunityParticipantEntity() when $default != null:
return $default(_that.id,_that.communityId,_that.userId,_that.joinedAt,_that.userName,_that.userAvatarUrl);case _:
  return null;

}
}

}

/// @nodoc


class _CommunityParticipantEntity implements CommunityParticipantEntity {
  const _CommunityParticipantEntity({required this.id, required this.communityId, required this.userId, required this.joinedAt, this.userName, this.userAvatarUrl});
  

@override final  String id;
@override final  String communityId;
@override final  String userId;
@override final  DateTime joinedAt;
@override final  String? userName;
@override final  String? userAvatarUrl;

/// Create a copy of CommunityParticipantEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommunityParticipantEntityCopyWith<_CommunityParticipantEntity> get copyWith => __$CommunityParticipantEntityCopyWithImpl<_CommunityParticipantEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CommunityParticipantEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.communityId, communityId) || other.communityId == communityId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.joinedAt, joinedAt) || other.joinedAt == joinedAt)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.userAvatarUrl, userAvatarUrl) || other.userAvatarUrl == userAvatarUrl));
}


@override
int get hashCode => Object.hash(runtimeType,id,communityId,userId,joinedAt,userName,userAvatarUrl);

@override
String toString() {
  return 'CommunityParticipantEntity(id: $id, communityId: $communityId, userId: $userId, joinedAt: $joinedAt, userName: $userName, userAvatarUrl: $userAvatarUrl)';
}


}

/// @nodoc
abstract mixin class _$CommunityParticipantEntityCopyWith<$Res> implements $CommunityParticipantEntityCopyWith<$Res> {
  factory _$CommunityParticipantEntityCopyWith(_CommunityParticipantEntity value, $Res Function(_CommunityParticipantEntity) _then) = __$CommunityParticipantEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String communityId, String userId, DateTime joinedAt, String? userName, String? userAvatarUrl
});




}
/// @nodoc
class __$CommunityParticipantEntityCopyWithImpl<$Res>
    implements _$CommunityParticipantEntityCopyWith<$Res> {
  __$CommunityParticipantEntityCopyWithImpl(this._self, this._then);

  final _CommunityParticipantEntity _self;
  final $Res Function(_CommunityParticipantEntity) _then;

/// Create a copy of CommunityParticipantEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? communityId = null,Object? userId = null,Object? joinedAt = null,Object? userName = freezed,Object? userAvatarUrl = freezed,}) {
  return _then(_CommunityParticipantEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,communityId: null == communityId ? _self.communityId : communityId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,joinedAt: null == joinedAt ? _self.joinedAt : joinedAt // ignore: cast_nullable_to_non_nullable
as DateTime,userName: freezed == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String?,userAvatarUrl: freezed == userAvatarUrl ? _self.userAvatarUrl : userAvatarUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
