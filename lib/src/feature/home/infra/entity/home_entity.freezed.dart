// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ActiveProgramEntity {

 String get id; String get title; String? get programImage; List<String>? get mainImageList; String? get description;
/// Create a copy of ActiveProgramEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActiveProgramEntityCopyWith<ActiveProgramEntity> get copyWith => _$ActiveProgramEntityCopyWithImpl<ActiveProgramEntity>(this as ActiveProgramEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActiveProgramEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.programImage, programImage) || other.programImage == programImage)&&const DeepCollectionEquality().equals(other.mainImageList, mainImageList)&&(identical(other.description, description) || other.description == description));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,programImage,const DeepCollectionEquality().hash(mainImageList),description);

@override
String toString() {
  return 'ActiveProgramEntity(id: $id, title: $title, programImage: $programImage, mainImageList: $mainImageList, description: $description)';
}


}

/// @nodoc
abstract mixin class $ActiveProgramEntityCopyWith<$Res>  {
  factory $ActiveProgramEntityCopyWith(ActiveProgramEntity value, $Res Function(ActiveProgramEntity) _then) = _$ActiveProgramEntityCopyWithImpl;
@useResult
$Res call({
 String id, String title, String? programImage, List<String>? mainImageList, String? description
});




}
/// @nodoc
class _$ActiveProgramEntityCopyWithImpl<$Res>
    implements $ActiveProgramEntityCopyWith<$Res> {
  _$ActiveProgramEntityCopyWithImpl(this._self, this._then);

  final ActiveProgramEntity _self;
  final $Res Function(ActiveProgramEntity) _then;

/// Create a copy of ActiveProgramEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? programImage = freezed,Object? mainImageList = freezed,Object? description = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,programImage: freezed == programImage ? _self.programImage : programImage // ignore: cast_nullable_to_non_nullable
as String?,mainImageList: freezed == mainImageList ? _self.mainImageList : mainImageList // ignore: cast_nullable_to_non_nullable
as List<String>?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ActiveProgramEntity].
extension ActiveProgramEntityPatterns on ActiveProgramEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ActiveProgramEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ActiveProgramEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ActiveProgramEntity value)  $default,){
final _that = this;
switch (_that) {
case _ActiveProgramEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ActiveProgramEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ActiveProgramEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String? programImage,  List<String>? mainImageList,  String? description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ActiveProgramEntity() when $default != null:
return $default(_that.id,_that.title,_that.programImage,_that.mainImageList,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String? programImage,  List<String>? mainImageList,  String? description)  $default,) {final _that = this;
switch (_that) {
case _ActiveProgramEntity():
return $default(_that.id,_that.title,_that.programImage,_that.mainImageList,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String? programImage,  List<String>? mainImageList,  String? description)?  $default,) {final _that = this;
switch (_that) {
case _ActiveProgramEntity() when $default != null:
return $default(_that.id,_that.title,_that.programImage,_that.mainImageList,_that.description);case _:
  return null;

}
}

}

/// @nodoc


class _ActiveProgramEntity implements ActiveProgramEntity {
  const _ActiveProgramEntity({required this.id, required this.title, this.programImage, final  List<String>? mainImageList, this.description}): _mainImageList = mainImageList;
  

@override final  String id;
@override final  String title;
@override final  String? programImage;
 final  List<String>? _mainImageList;
@override List<String>? get mainImageList {
  final value = _mainImageList;
  if (value == null) return null;
  if (_mainImageList is EqualUnmodifiableListView) return _mainImageList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? description;

/// Create a copy of ActiveProgramEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ActiveProgramEntityCopyWith<_ActiveProgramEntity> get copyWith => __$ActiveProgramEntityCopyWithImpl<_ActiveProgramEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ActiveProgramEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.programImage, programImage) || other.programImage == programImage)&&const DeepCollectionEquality().equals(other._mainImageList, _mainImageList)&&(identical(other.description, description) || other.description == description));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,programImage,const DeepCollectionEquality().hash(_mainImageList),description);

@override
String toString() {
  return 'ActiveProgramEntity(id: $id, title: $title, programImage: $programImage, mainImageList: $mainImageList, description: $description)';
}


}

/// @nodoc
abstract mixin class _$ActiveProgramEntityCopyWith<$Res> implements $ActiveProgramEntityCopyWith<$Res> {
  factory _$ActiveProgramEntityCopyWith(_ActiveProgramEntity value, $Res Function(_ActiveProgramEntity) _then) = __$ActiveProgramEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String? programImage, List<String>? mainImageList, String? description
});




}
/// @nodoc
class __$ActiveProgramEntityCopyWithImpl<$Res>
    implements _$ActiveProgramEntityCopyWith<$Res> {
  __$ActiveProgramEntityCopyWithImpl(this._self, this._then);

  final _ActiveProgramEntity _self;
  final $Res Function(_ActiveProgramEntity) _then;

/// Create a copy of ActiveProgramEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? programImage = freezed,Object? mainImageList = freezed,Object? description = freezed,}) {
  return _then(_ActiveProgramEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,programImage: freezed == programImage ? _self.programImage : programImage // ignore: cast_nullable_to_non_nullable
as String?,mainImageList: freezed == mainImageList ? _self._mainImageList : mainImageList // ignore: cast_nullable_to_non_nullable
as List<String>?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$BlueprintSectionEntity {

 String get id;// sectionItemId
 String get sectionId;// sectionId
 String get title; String get content; int get orderIndex; bool get isCompleted;
/// Create a copy of BlueprintSectionEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BlueprintSectionEntityCopyWith<BlueprintSectionEntity> get copyWith => _$BlueprintSectionEntityCopyWithImpl<BlueprintSectionEntity>(this as BlueprintSectionEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BlueprintSectionEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.sectionId, sectionId) || other.sectionId == sectionId)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.orderIndex, orderIndex) || other.orderIndex == orderIndex)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted));
}


@override
int get hashCode => Object.hash(runtimeType,id,sectionId,title,content,orderIndex,isCompleted);

@override
String toString() {
  return 'BlueprintSectionEntity(id: $id, sectionId: $sectionId, title: $title, content: $content, orderIndex: $orderIndex, isCompleted: $isCompleted)';
}


}

/// @nodoc
abstract mixin class $BlueprintSectionEntityCopyWith<$Res>  {
  factory $BlueprintSectionEntityCopyWith(BlueprintSectionEntity value, $Res Function(BlueprintSectionEntity) _then) = _$BlueprintSectionEntityCopyWithImpl;
@useResult
$Res call({
 String id, String sectionId, String title, String content, int orderIndex, bool isCompleted
});




}
/// @nodoc
class _$BlueprintSectionEntityCopyWithImpl<$Res>
    implements $BlueprintSectionEntityCopyWith<$Res> {
  _$BlueprintSectionEntityCopyWithImpl(this._self, this._then);

  final BlueprintSectionEntity _self;
  final $Res Function(BlueprintSectionEntity) _then;

/// Create a copy of BlueprintSectionEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? sectionId = null,Object? title = null,Object? content = null,Object? orderIndex = null,Object? isCompleted = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sectionId: null == sectionId ? _self.sectionId : sectionId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,orderIndex: null == orderIndex ? _self.orderIndex : orderIndex // ignore: cast_nullable_to_non_nullable
as int,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [BlueprintSectionEntity].
extension BlueprintSectionEntityPatterns on BlueprintSectionEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BlueprintSectionEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BlueprintSectionEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BlueprintSectionEntity value)  $default,){
final _that = this;
switch (_that) {
case _BlueprintSectionEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BlueprintSectionEntity value)?  $default,){
final _that = this;
switch (_that) {
case _BlueprintSectionEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String sectionId,  String title,  String content,  int orderIndex,  bool isCompleted)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BlueprintSectionEntity() when $default != null:
return $default(_that.id,_that.sectionId,_that.title,_that.content,_that.orderIndex,_that.isCompleted);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String sectionId,  String title,  String content,  int orderIndex,  bool isCompleted)  $default,) {final _that = this;
switch (_that) {
case _BlueprintSectionEntity():
return $default(_that.id,_that.sectionId,_that.title,_that.content,_that.orderIndex,_that.isCompleted);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String sectionId,  String title,  String content,  int orderIndex,  bool isCompleted)?  $default,) {final _that = this;
switch (_that) {
case _BlueprintSectionEntity() when $default != null:
return $default(_that.id,_that.sectionId,_that.title,_that.content,_that.orderIndex,_that.isCompleted);case _:
  return null;

}
}

}

/// @nodoc


class _BlueprintSectionEntity implements BlueprintSectionEntity {
  const _BlueprintSectionEntity({required this.id, required this.sectionId, required this.title, required this.content, required this.orderIndex, required this.isCompleted});
  

@override final  String id;
// sectionItemId
@override final  String sectionId;
// sectionId
@override final  String title;
@override final  String content;
@override final  int orderIndex;
@override final  bool isCompleted;

/// Create a copy of BlueprintSectionEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BlueprintSectionEntityCopyWith<_BlueprintSectionEntity> get copyWith => __$BlueprintSectionEntityCopyWithImpl<_BlueprintSectionEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BlueprintSectionEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.sectionId, sectionId) || other.sectionId == sectionId)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.orderIndex, orderIndex) || other.orderIndex == orderIndex)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted));
}


@override
int get hashCode => Object.hash(runtimeType,id,sectionId,title,content,orderIndex,isCompleted);

@override
String toString() {
  return 'BlueprintSectionEntity(id: $id, sectionId: $sectionId, title: $title, content: $content, orderIndex: $orderIndex, isCompleted: $isCompleted)';
}


}

/// @nodoc
abstract mixin class _$BlueprintSectionEntityCopyWith<$Res> implements $BlueprintSectionEntityCopyWith<$Res> {
  factory _$BlueprintSectionEntityCopyWith(_BlueprintSectionEntity value, $Res Function(_BlueprintSectionEntity) _then) = __$BlueprintSectionEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String sectionId, String title, String content, int orderIndex, bool isCompleted
});




}
/// @nodoc
class __$BlueprintSectionEntityCopyWithImpl<$Res>
    implements _$BlueprintSectionEntityCopyWith<$Res> {
  __$BlueprintSectionEntityCopyWithImpl(this._self, this._then);

  final _BlueprintSectionEntity _self;
  final $Res Function(_BlueprintSectionEntity) _then;

/// Create a copy of BlueprintSectionEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? sectionId = null,Object? title = null,Object? content = null,Object? orderIndex = null,Object? isCompleted = null,}) {
  return _then(_BlueprintSectionEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sectionId: null == sectionId ? _self.sectionId : sectionId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,orderIndex: null == orderIndex ? _self.orderIndex : orderIndex // ignore: cast_nullable_to_non_nullable
as int,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$SectionRecordEntity {

 String get id; String get userId; String get userProfileId; String get sectionId; String get sectionItemId; Map<String, dynamic>? get content; DateTime? get completedAt; String? get coachComment; RecordType? get recordType; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of SectionRecordEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SectionRecordEntityCopyWith<SectionRecordEntity> get copyWith => _$SectionRecordEntityCopyWithImpl<SectionRecordEntity>(this as SectionRecordEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SectionRecordEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.userProfileId, userProfileId) || other.userProfileId == userProfileId)&&(identical(other.sectionId, sectionId) || other.sectionId == sectionId)&&(identical(other.sectionItemId, sectionItemId) || other.sectionItemId == sectionItemId)&&const DeepCollectionEquality().equals(other.content, content)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.coachComment, coachComment) || other.coachComment == coachComment)&&(identical(other.recordType, recordType) || other.recordType == recordType)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,userId,userProfileId,sectionId,sectionItemId,const DeepCollectionEquality().hash(content),completedAt,coachComment,recordType,createdAt,updatedAt);

@override
String toString() {
  return 'SectionRecordEntity(id: $id, userId: $userId, userProfileId: $userProfileId, sectionId: $sectionId, sectionItemId: $sectionItemId, content: $content, completedAt: $completedAt, coachComment: $coachComment, recordType: $recordType, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $SectionRecordEntityCopyWith<$Res>  {
  factory $SectionRecordEntityCopyWith(SectionRecordEntity value, $Res Function(SectionRecordEntity) _then) = _$SectionRecordEntityCopyWithImpl;
@useResult
$Res call({
 String id, String userId, String userProfileId, String sectionId, String sectionItemId, Map<String, dynamic>? content, DateTime? completedAt, String? coachComment, RecordType? recordType, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$SectionRecordEntityCopyWithImpl<$Res>
    implements $SectionRecordEntityCopyWith<$Res> {
  _$SectionRecordEntityCopyWithImpl(this._self, this._then);

  final SectionRecordEntity _self;
  final $Res Function(SectionRecordEntity) _then;

/// Create a copy of SectionRecordEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? userProfileId = null,Object? sectionId = null,Object? sectionItemId = null,Object? content = freezed,Object? completedAt = freezed,Object? coachComment = freezed,Object? recordType = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,userProfileId: null == userProfileId ? _self.userProfileId : userProfileId // ignore: cast_nullable_to_non_nullable
as String,sectionId: null == sectionId ? _self.sectionId : sectionId // ignore: cast_nullable_to_non_nullable
as String,sectionItemId: null == sectionItemId ? _self.sectionItemId : sectionItemId // ignore: cast_nullable_to_non_nullable
as String,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,coachComment: freezed == coachComment ? _self.coachComment : coachComment // ignore: cast_nullable_to_non_nullable
as String?,recordType: freezed == recordType ? _self.recordType : recordType // ignore: cast_nullable_to_non_nullable
as RecordType?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [SectionRecordEntity].
extension SectionRecordEntityPatterns on SectionRecordEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SectionRecordEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SectionRecordEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SectionRecordEntity value)  $default,){
final _that = this;
switch (_that) {
case _SectionRecordEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SectionRecordEntity value)?  $default,){
final _that = this;
switch (_that) {
case _SectionRecordEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  String userProfileId,  String sectionId,  String sectionItemId,  Map<String, dynamic>? content,  DateTime? completedAt,  String? coachComment,  RecordType? recordType,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SectionRecordEntity() when $default != null:
return $default(_that.id,_that.userId,_that.userProfileId,_that.sectionId,_that.sectionItemId,_that.content,_that.completedAt,_that.coachComment,_that.recordType,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  String userProfileId,  String sectionId,  String sectionItemId,  Map<String, dynamic>? content,  DateTime? completedAt,  String? coachComment,  RecordType? recordType,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _SectionRecordEntity():
return $default(_that.id,_that.userId,_that.userProfileId,_that.sectionId,_that.sectionItemId,_that.content,_that.completedAt,_that.coachComment,_that.recordType,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  String userProfileId,  String sectionId,  String sectionItemId,  Map<String, dynamic>? content,  DateTime? completedAt,  String? coachComment,  RecordType? recordType,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _SectionRecordEntity() when $default != null:
return $default(_that.id,_that.userId,_that.userProfileId,_that.sectionId,_that.sectionItemId,_that.content,_that.completedAt,_that.coachComment,_that.recordType,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _SectionRecordEntity implements SectionRecordEntity {
  const _SectionRecordEntity({required this.id, required this.userId, required this.userProfileId, required this.sectionId, required this.sectionItemId, final  Map<String, dynamic>? content, this.completedAt, this.coachComment, this.recordType, this.createdAt, this.updatedAt}): _content = content;
  

@override final  String id;
@override final  String userId;
@override final  String userProfileId;
@override final  String sectionId;
@override final  String sectionItemId;
 final  Map<String, dynamic>? _content;
@override Map<String, dynamic>? get content {
  final value = _content;
  if (value == null) return null;
  if (_content is EqualUnmodifiableMapView) return _content;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override final  DateTime? completedAt;
@override final  String? coachComment;
@override final  RecordType? recordType;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of SectionRecordEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SectionRecordEntityCopyWith<_SectionRecordEntity> get copyWith => __$SectionRecordEntityCopyWithImpl<_SectionRecordEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SectionRecordEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.userProfileId, userProfileId) || other.userProfileId == userProfileId)&&(identical(other.sectionId, sectionId) || other.sectionId == sectionId)&&(identical(other.sectionItemId, sectionItemId) || other.sectionItemId == sectionItemId)&&const DeepCollectionEquality().equals(other._content, _content)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.coachComment, coachComment) || other.coachComment == coachComment)&&(identical(other.recordType, recordType) || other.recordType == recordType)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,userId,userProfileId,sectionId,sectionItemId,const DeepCollectionEquality().hash(_content),completedAt,coachComment,recordType,createdAt,updatedAt);

@override
String toString() {
  return 'SectionRecordEntity(id: $id, userId: $userId, userProfileId: $userProfileId, sectionId: $sectionId, sectionItemId: $sectionItemId, content: $content, completedAt: $completedAt, coachComment: $coachComment, recordType: $recordType, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$SectionRecordEntityCopyWith<$Res> implements $SectionRecordEntityCopyWith<$Res> {
  factory _$SectionRecordEntityCopyWith(_SectionRecordEntity value, $Res Function(_SectionRecordEntity) _then) = __$SectionRecordEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, String userProfileId, String sectionId, String sectionItemId, Map<String, dynamic>? content, DateTime? completedAt, String? coachComment, RecordType? recordType, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class __$SectionRecordEntityCopyWithImpl<$Res>
    implements _$SectionRecordEntityCopyWith<$Res> {
  __$SectionRecordEntityCopyWithImpl(this._self, this._then);

  final _SectionRecordEntity _self;
  final $Res Function(_SectionRecordEntity) _then;

/// Create a copy of SectionRecordEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? userProfileId = null,Object? sectionId = null,Object? sectionItemId = null,Object? content = freezed,Object? completedAt = freezed,Object? coachComment = freezed,Object? recordType = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_SectionRecordEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,userProfileId: null == userProfileId ? _self.userProfileId : userProfileId // ignore: cast_nullable_to_non_nullable
as String,sectionId: null == sectionId ? _self.sectionId : sectionId // ignore: cast_nullable_to_non_nullable
as String,sectionItemId: null == sectionItemId ? _self.sectionItemId : sectionItemId // ignore: cast_nullable_to_non_nullable
as String,content: freezed == content ? _self._content : content // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,coachComment: freezed == coachComment ? _self.coachComment : coachComment // ignore: cast_nullable_to_non_nullable
as String?,recordType: freezed == recordType ? _self.recordType : recordType // ignore: cast_nullable_to_non_nullable
as RecordType?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
