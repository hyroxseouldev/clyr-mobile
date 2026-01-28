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





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActiveProgramEntity);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ActiveProgramEntity()';
}


}

/// @nodoc
class $ActiveProgramEntityCopyWith<$Res>  {
$ActiveProgramEntityCopyWith(ActiveProgramEntity _, $Res Function(ActiveProgramEntity) __);
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( ActiveProgramData value)?  $default,{TResult Function( ActiveProgramEmpty value)?  empty,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ActiveProgramData() when $default != null:
return $default(_that);case ActiveProgramEmpty() when empty != null:
return empty(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( ActiveProgramData value)  $default,{required TResult Function( ActiveProgramEmpty value)  empty,}){
final _that = this;
switch (_that) {
case ActiveProgramData():
return $default(_that);case ActiveProgramEmpty():
return empty(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( ActiveProgramData value)?  $default,{TResult? Function( ActiveProgramEmpty value)?  empty,}){
final _that = this;
switch (_that) {
case ActiveProgramData() when $default != null:
return $default(_that);case ActiveProgramEmpty() when empty != null:
return empty(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String programImage,  List<String> mainImageList,  String description,  DateTime startDate,  DateTime endDate,  String coachProfileUrl,  String coachName)?  $default,{TResult Function()?  empty,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ActiveProgramData() when $default != null:
return $default(_that.id,_that.title,_that.programImage,_that.mainImageList,_that.description,_that.startDate,_that.endDate,_that.coachProfileUrl,_that.coachName);case ActiveProgramEmpty() when empty != null:
return empty();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String programImage,  List<String> mainImageList,  String description,  DateTime startDate,  DateTime endDate,  String coachProfileUrl,  String coachName)  $default,{required TResult Function()  empty,}) {final _that = this;
switch (_that) {
case ActiveProgramData():
return $default(_that.id,_that.title,_that.programImage,_that.mainImageList,_that.description,_that.startDate,_that.endDate,_that.coachProfileUrl,_that.coachName);case ActiveProgramEmpty():
return empty();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String programImage,  List<String> mainImageList,  String description,  DateTime startDate,  DateTime endDate,  String coachProfileUrl,  String coachName)?  $default,{TResult? Function()?  empty,}) {final _that = this;
switch (_that) {
case ActiveProgramData() when $default != null:
return $default(_that.id,_that.title,_that.programImage,_that.mainImageList,_that.description,_that.startDate,_that.endDate,_that.coachProfileUrl,_that.coachName);case ActiveProgramEmpty() when empty != null:
return empty();case _:
  return null;

}
}

}

/// @nodoc


class ActiveProgramData implements ActiveProgramEntity {
  const ActiveProgramData({required this.id, required this.title, required this.programImage, required final  List<String> mainImageList, required this.description, required this.startDate, required this.endDate, required this.coachProfileUrl, required this.coachName}): _mainImageList = mainImageList;
  

 final  String id;
 final  String title;
 final  String programImage;
 final  List<String> _mainImageList;
 List<String> get mainImageList {
  if (_mainImageList is EqualUnmodifiableListView) return _mainImageList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_mainImageList);
}

 final  String description;
 final  DateTime startDate;
 final  DateTime endDate;
 final  String coachProfileUrl;
 final  String coachName;

/// Create a copy of ActiveProgramEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActiveProgramDataCopyWith<ActiveProgramData> get copyWith => _$ActiveProgramDataCopyWithImpl<ActiveProgramData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActiveProgramData&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.programImage, programImage) || other.programImage == programImage)&&const DeepCollectionEquality().equals(other._mainImageList, _mainImageList)&&(identical(other.description, description) || other.description == description)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.coachProfileUrl, coachProfileUrl) || other.coachProfileUrl == coachProfileUrl)&&(identical(other.coachName, coachName) || other.coachName == coachName));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,programImage,const DeepCollectionEquality().hash(_mainImageList),description,startDate,endDate,coachProfileUrl,coachName);

@override
String toString() {
  return 'ActiveProgramEntity(id: $id, title: $title, programImage: $programImage, mainImageList: $mainImageList, description: $description, startDate: $startDate, endDate: $endDate, coachProfileUrl: $coachProfileUrl, coachName: $coachName)';
}


}

/// @nodoc
abstract mixin class $ActiveProgramDataCopyWith<$Res> implements $ActiveProgramEntityCopyWith<$Res> {
  factory $ActiveProgramDataCopyWith(ActiveProgramData value, $Res Function(ActiveProgramData) _then) = _$ActiveProgramDataCopyWithImpl;
@useResult
$Res call({
 String id, String title, String programImage, List<String> mainImageList, String description, DateTime startDate, DateTime endDate, String coachProfileUrl, String coachName
});




}
/// @nodoc
class _$ActiveProgramDataCopyWithImpl<$Res>
    implements $ActiveProgramDataCopyWith<$Res> {
  _$ActiveProgramDataCopyWithImpl(this._self, this._then);

  final ActiveProgramData _self;
  final $Res Function(ActiveProgramData) _then;

/// Create a copy of ActiveProgramEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? programImage = null,Object? mainImageList = null,Object? description = null,Object? startDate = null,Object? endDate = null,Object? coachProfileUrl = null,Object? coachName = null,}) {
  return _then(ActiveProgramData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,programImage: null == programImage ? _self.programImage : programImage // ignore: cast_nullable_to_non_nullable
as String,mainImageList: null == mainImageList ? _self._mainImageList : mainImageList // ignore: cast_nullable_to_non_nullable
as List<String>,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,coachProfileUrl: null == coachProfileUrl ? _self.coachProfileUrl : coachProfileUrl // ignore: cast_nullable_to_non_nullable
as String,coachName: null == coachName ? _self.coachName : coachName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ActiveProgramEmpty implements ActiveProgramEntity {
  const ActiveProgramEmpty();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActiveProgramEmpty);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ActiveProgramEntity.empty()';
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( BlueprintSectionData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case BlueprintSectionData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( BlueprintSectionData value)  $default,){
final _that = this;
switch (_that) {
case BlueprintSectionData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( BlueprintSectionData value)?  $default,){
final _that = this;
switch (_that) {
case BlueprintSectionData() when $default != null:
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
case BlueprintSectionData() when $default != null:
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
case BlueprintSectionData():
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
case BlueprintSectionData() when $default != null:
return $default(_that.id,_that.sectionId,_that.title,_that.content,_that.orderIndex,_that.isCompleted);case _:
  return null;

}
}

}

/// @nodoc


class BlueprintSectionData implements BlueprintSectionEntity {
  const BlueprintSectionData({required this.id, required this.sectionId, required this.title, required this.content, required this.orderIndex, required this.isCompleted});
  

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
$BlueprintSectionDataCopyWith<BlueprintSectionData> get copyWith => _$BlueprintSectionDataCopyWithImpl<BlueprintSectionData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BlueprintSectionData&&(identical(other.id, id) || other.id == id)&&(identical(other.sectionId, sectionId) || other.sectionId == sectionId)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.orderIndex, orderIndex) || other.orderIndex == orderIndex)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted));
}


@override
int get hashCode => Object.hash(runtimeType,id,sectionId,title,content,orderIndex,isCompleted);

@override
String toString() {
  return 'BlueprintSectionEntity(id: $id, sectionId: $sectionId, title: $title, content: $content, orderIndex: $orderIndex, isCompleted: $isCompleted)';
}


}

/// @nodoc
abstract mixin class $BlueprintSectionDataCopyWith<$Res> implements $BlueprintSectionEntityCopyWith<$Res> {
  factory $BlueprintSectionDataCopyWith(BlueprintSectionData value, $Res Function(BlueprintSectionData) _then) = _$BlueprintSectionDataCopyWithImpl;
@override @useResult
$Res call({
 String id, String sectionId, String title, String content, int orderIndex, bool isCompleted
});




}
/// @nodoc
class _$BlueprintSectionDataCopyWithImpl<$Res>
    implements $BlueprintSectionDataCopyWith<$Res> {
  _$BlueprintSectionDataCopyWithImpl(this._self, this._then);

  final BlueprintSectionData _self;
  final $Res Function(BlueprintSectionData) _then;

/// Create a copy of BlueprintSectionEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? sectionId = null,Object? title = null,Object? content = null,Object? orderIndex = null,Object? isCompleted = null,}) {
  return _then(BlueprintSectionData(
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( SectionRecordData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case SectionRecordData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( SectionRecordData value)  $default,){
final _that = this;
switch (_that) {
case SectionRecordData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( SectionRecordData value)?  $default,){
final _that = this;
switch (_that) {
case SectionRecordData() when $default != null:
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
case SectionRecordData() when $default != null:
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
case SectionRecordData():
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
case SectionRecordData() when $default != null:
return $default(_that.id,_that.userId,_that.userProfileId,_that.sectionId,_that.sectionItemId,_that.content,_that.completedAt,_that.coachComment,_that.recordType,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class SectionRecordData implements SectionRecordEntity {
  const SectionRecordData({required this.id, required this.userId, required this.userProfileId, required this.sectionId, required this.sectionItemId, final  Map<String, dynamic>? content, this.completedAt, this.coachComment, this.recordType, this.createdAt, this.updatedAt}): _content = content;
  

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
$SectionRecordDataCopyWith<SectionRecordData> get copyWith => _$SectionRecordDataCopyWithImpl<SectionRecordData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SectionRecordData&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.userProfileId, userProfileId) || other.userProfileId == userProfileId)&&(identical(other.sectionId, sectionId) || other.sectionId == sectionId)&&(identical(other.sectionItemId, sectionItemId) || other.sectionItemId == sectionItemId)&&const DeepCollectionEquality().equals(other._content, _content)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.coachComment, coachComment) || other.coachComment == coachComment)&&(identical(other.recordType, recordType) || other.recordType == recordType)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,userId,userProfileId,sectionId,sectionItemId,const DeepCollectionEquality().hash(_content),completedAt,coachComment,recordType,createdAt,updatedAt);

@override
String toString() {
  return 'SectionRecordEntity(id: $id, userId: $userId, userProfileId: $userProfileId, sectionId: $sectionId, sectionItemId: $sectionItemId, content: $content, completedAt: $completedAt, coachComment: $coachComment, recordType: $recordType, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $SectionRecordDataCopyWith<$Res> implements $SectionRecordEntityCopyWith<$Res> {
  factory $SectionRecordDataCopyWith(SectionRecordData value, $Res Function(SectionRecordData) _then) = _$SectionRecordDataCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, String userProfileId, String sectionId, String sectionItemId, Map<String, dynamic>? content, DateTime? completedAt, String? coachComment, RecordType? recordType, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$SectionRecordDataCopyWithImpl<$Res>
    implements $SectionRecordDataCopyWith<$Res> {
  _$SectionRecordDataCopyWithImpl(this._self, this._then);

  final SectionRecordData _self;
  final $Res Function(SectionRecordData) _then;

/// Create a copy of SectionRecordEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? userProfileId = null,Object? sectionId = null,Object? sectionItemId = null,Object? content = freezed,Object? completedAt = freezed,Object? coachComment = freezed,Object? recordType = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(SectionRecordData(
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

/// @nodoc
mixin _$TodaysSessionState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TodaysSessionState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TodaysSessionState()';
}


}

/// @nodoc
class $TodaysSessionStateCopyWith<$Res>  {
$TodaysSessionStateCopyWith(TodaysSessionState _, $Res Function(TodaysSessionState) __);
}


/// Adds pattern-matching-related methods to [TodaysSessionState].
extension TodaysSessionStatePatterns on TodaysSessionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TodaysSessionEmpty value)?  empty,TResult Function( TodaysSessionTrainingDay value)?  trainingDay,TResult Function( TodaysSessionRestDay value)?  restDay,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TodaysSessionEmpty() when empty != null:
return empty(_that);case TodaysSessionTrainingDay() when trainingDay != null:
return trainingDay(_that);case TodaysSessionRestDay() when restDay != null:
return restDay(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TodaysSessionEmpty value)  empty,required TResult Function( TodaysSessionTrainingDay value)  trainingDay,required TResult Function( TodaysSessionRestDay value)  restDay,}){
final _that = this;
switch (_that) {
case TodaysSessionEmpty():
return empty(_that);case TodaysSessionTrainingDay():
return trainingDay(_that);case TodaysSessionRestDay():
return restDay(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TodaysSessionEmpty value)?  empty,TResult? Function( TodaysSessionTrainingDay value)?  trainingDay,TResult? Function( TodaysSessionRestDay value)?  restDay,}){
final _that = this;
switch (_that) {
case TodaysSessionEmpty() when empty != null:
return empty(_that);case TodaysSessionTrainingDay() when trainingDay != null:
return trainingDay(_that);case TodaysSessionRestDay() when restDay != null:
return restDay(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  empty,TResult Function( List<BlueprintSectionEntity> sections,  String coachQuote,  String coachName)?  trainingDay,TResult Function()?  restDay,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TodaysSessionEmpty() when empty != null:
return empty();case TodaysSessionTrainingDay() when trainingDay != null:
return trainingDay(_that.sections,_that.coachQuote,_that.coachName);case TodaysSessionRestDay() when restDay != null:
return restDay();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  empty,required TResult Function( List<BlueprintSectionEntity> sections,  String coachQuote,  String coachName)  trainingDay,required TResult Function()  restDay,}) {final _that = this;
switch (_that) {
case TodaysSessionEmpty():
return empty();case TodaysSessionTrainingDay():
return trainingDay(_that.sections,_that.coachQuote,_that.coachName);case TodaysSessionRestDay():
return restDay();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  empty,TResult? Function( List<BlueprintSectionEntity> sections,  String coachQuote,  String coachName)?  trainingDay,TResult? Function()?  restDay,}) {final _that = this;
switch (_that) {
case TodaysSessionEmpty() when empty != null:
return empty();case TodaysSessionTrainingDay() when trainingDay != null:
return trainingDay(_that.sections,_that.coachQuote,_that.coachName);case TodaysSessionRestDay() when restDay != null:
return restDay();case _:
  return null;

}
}

}

/// @nodoc


class TodaysSessionEmpty implements TodaysSessionState {
  const TodaysSessionEmpty();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TodaysSessionEmpty);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TodaysSessionState.empty()';
}


}




/// @nodoc


class TodaysSessionTrainingDay implements TodaysSessionState {
  const TodaysSessionTrainingDay(final  List<BlueprintSectionEntity> sections, this.coachQuote, this.coachName): _sections = sections;
  

 final  List<BlueprintSectionEntity> _sections;
 List<BlueprintSectionEntity> get sections {
  if (_sections is EqualUnmodifiableListView) return _sections;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sections);
}

 final  String coachQuote;
 final  String coachName;

/// Create a copy of TodaysSessionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TodaysSessionTrainingDayCopyWith<TodaysSessionTrainingDay> get copyWith => _$TodaysSessionTrainingDayCopyWithImpl<TodaysSessionTrainingDay>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TodaysSessionTrainingDay&&const DeepCollectionEquality().equals(other._sections, _sections)&&(identical(other.coachQuote, coachQuote) || other.coachQuote == coachQuote)&&(identical(other.coachName, coachName) || other.coachName == coachName));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_sections),coachQuote,coachName);

@override
String toString() {
  return 'TodaysSessionState.trainingDay(sections: $sections, coachQuote: $coachQuote, coachName: $coachName)';
}


}

/// @nodoc
abstract mixin class $TodaysSessionTrainingDayCopyWith<$Res> implements $TodaysSessionStateCopyWith<$Res> {
  factory $TodaysSessionTrainingDayCopyWith(TodaysSessionTrainingDay value, $Res Function(TodaysSessionTrainingDay) _then) = _$TodaysSessionTrainingDayCopyWithImpl;
@useResult
$Res call({
 List<BlueprintSectionEntity> sections, String coachQuote, String coachName
});




}
/// @nodoc
class _$TodaysSessionTrainingDayCopyWithImpl<$Res>
    implements $TodaysSessionTrainingDayCopyWith<$Res> {
  _$TodaysSessionTrainingDayCopyWithImpl(this._self, this._then);

  final TodaysSessionTrainingDay _self;
  final $Res Function(TodaysSessionTrainingDay) _then;

/// Create a copy of TodaysSessionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? sections = null,Object? coachQuote = null,Object? coachName = null,}) {
  return _then(TodaysSessionTrainingDay(
null == sections ? _self._sections : sections // ignore: cast_nullable_to_non_nullable
as List<BlueprintSectionEntity>,null == coachQuote ? _self.coachQuote : coachQuote // ignore: cast_nullable_to_non_nullable
as String,null == coachName ? _self.coachName : coachName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class TodaysSessionRestDay implements TodaysSessionState {
  const TodaysSessionRestDay();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TodaysSessionRestDay);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TodaysSessionState.restDay()';
}


}




// dart format on
