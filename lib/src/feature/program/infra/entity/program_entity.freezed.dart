// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'program_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProgramEntity {

 String get id; String get coachId; String get title; String get slug; String get type; String? get description; bool get isPublic; bool get isForSale; num get price; int? get accessPeriodDays; String get difficulty; int get durationWeeks; int get daysPerWeek; String? get programImage; List<CurriculumItemEntity> get curriculum; CoachProfileEntity? get coach; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of ProgramEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgramEntityCopyWith<ProgramEntity> get copyWith => _$ProgramEntityCopyWithImpl<ProgramEntity>(this as ProgramEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgramEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.coachId, coachId) || other.coachId == coachId)&&(identical(other.title, title) || other.title == title)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.type, type) || other.type == type)&&(identical(other.description, description) || other.description == description)&&(identical(other.isPublic, isPublic) || other.isPublic == isPublic)&&(identical(other.isForSale, isForSale) || other.isForSale == isForSale)&&(identical(other.price, price) || other.price == price)&&(identical(other.accessPeriodDays, accessPeriodDays) || other.accessPeriodDays == accessPeriodDays)&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty)&&(identical(other.durationWeeks, durationWeeks) || other.durationWeeks == durationWeeks)&&(identical(other.daysPerWeek, daysPerWeek) || other.daysPerWeek == daysPerWeek)&&(identical(other.programImage, programImage) || other.programImage == programImage)&&const DeepCollectionEquality().equals(other.curriculum, curriculum)&&(identical(other.coach, coach) || other.coach == coach)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,coachId,title,slug,type,description,isPublic,isForSale,price,accessPeriodDays,difficulty,durationWeeks,daysPerWeek,programImage,const DeepCollectionEquality().hash(curriculum),coach,createdAt,updatedAt);

@override
String toString() {
  return 'ProgramEntity(id: $id, coachId: $coachId, title: $title, slug: $slug, type: $type, description: $description, isPublic: $isPublic, isForSale: $isForSale, price: $price, accessPeriodDays: $accessPeriodDays, difficulty: $difficulty, durationWeeks: $durationWeeks, daysPerWeek: $daysPerWeek, programImage: $programImage, curriculum: $curriculum, coach: $coach, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ProgramEntityCopyWith<$Res>  {
  factory $ProgramEntityCopyWith(ProgramEntity value, $Res Function(ProgramEntity) _then) = _$ProgramEntityCopyWithImpl;
@useResult
$Res call({
 String id, String coachId, String title, String slug, String type, String? description, bool isPublic, bool isForSale, num price, int? accessPeriodDays, String difficulty, int durationWeeks, int daysPerWeek, String? programImage, List<CurriculumItemEntity> curriculum, CoachProfileEntity? coach, DateTime createdAt, DateTime updatedAt
});


$CoachProfileEntityCopyWith<$Res>? get coach;

}
/// @nodoc
class _$ProgramEntityCopyWithImpl<$Res>
    implements $ProgramEntityCopyWith<$Res> {
  _$ProgramEntityCopyWithImpl(this._self, this._then);

  final ProgramEntity _self;
  final $Res Function(ProgramEntity) _then;

/// Create a copy of ProgramEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? coachId = null,Object? title = null,Object? slug = null,Object? type = null,Object? description = freezed,Object? isPublic = null,Object? isForSale = null,Object? price = null,Object? accessPeriodDays = freezed,Object? difficulty = null,Object? durationWeeks = null,Object? daysPerWeek = null,Object? programImage = freezed,Object? curriculum = null,Object? coach = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,coachId: null == coachId ? _self.coachId : coachId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,isPublic: null == isPublic ? _self.isPublic : isPublic // ignore: cast_nullable_to_non_nullable
as bool,isForSale: null == isForSale ? _self.isForSale : isForSale // ignore: cast_nullable_to_non_nullable
as bool,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as num,accessPeriodDays: freezed == accessPeriodDays ? _self.accessPeriodDays : accessPeriodDays // ignore: cast_nullable_to_non_nullable
as int?,difficulty: null == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as String,durationWeeks: null == durationWeeks ? _self.durationWeeks : durationWeeks // ignore: cast_nullable_to_non_nullable
as int,daysPerWeek: null == daysPerWeek ? _self.daysPerWeek : daysPerWeek // ignore: cast_nullable_to_non_nullable
as int,programImage: freezed == programImage ? _self.programImage : programImage // ignore: cast_nullable_to_non_nullable
as String?,curriculum: null == curriculum ? _self.curriculum : curriculum // ignore: cast_nullable_to_non_nullable
as List<CurriculumItemEntity>,coach: freezed == coach ? _self.coach : coach // ignore: cast_nullable_to_non_nullable
as CoachProfileEntity?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of ProgramEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CoachProfileEntityCopyWith<$Res>? get coach {
    if (_self.coach == null) {
    return null;
  }

  return $CoachProfileEntityCopyWith<$Res>(_self.coach!, (value) {
    return _then(_self.copyWith(coach: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProgramEntity].
extension ProgramEntityPatterns on ProgramEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProgramEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProgramEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProgramEntity value)  $default,){
final _that = this;
switch (_that) {
case _ProgramEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProgramEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ProgramEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String coachId,  String title,  String slug,  String type,  String? description,  bool isPublic,  bool isForSale,  num price,  int? accessPeriodDays,  String difficulty,  int durationWeeks,  int daysPerWeek,  String? programImage,  List<CurriculumItemEntity> curriculum,  CoachProfileEntity? coach,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProgramEntity() when $default != null:
return $default(_that.id,_that.coachId,_that.title,_that.slug,_that.type,_that.description,_that.isPublic,_that.isForSale,_that.price,_that.accessPeriodDays,_that.difficulty,_that.durationWeeks,_that.daysPerWeek,_that.programImage,_that.curriculum,_that.coach,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String coachId,  String title,  String slug,  String type,  String? description,  bool isPublic,  bool isForSale,  num price,  int? accessPeriodDays,  String difficulty,  int durationWeeks,  int daysPerWeek,  String? programImage,  List<CurriculumItemEntity> curriculum,  CoachProfileEntity? coach,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ProgramEntity():
return $default(_that.id,_that.coachId,_that.title,_that.slug,_that.type,_that.description,_that.isPublic,_that.isForSale,_that.price,_that.accessPeriodDays,_that.difficulty,_that.durationWeeks,_that.daysPerWeek,_that.programImage,_that.curriculum,_that.coach,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String coachId,  String title,  String slug,  String type,  String? description,  bool isPublic,  bool isForSale,  num price,  int? accessPeriodDays,  String difficulty,  int durationWeeks,  int daysPerWeek,  String? programImage,  List<CurriculumItemEntity> curriculum,  CoachProfileEntity? coach,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ProgramEntity() when $default != null:
return $default(_that.id,_that.coachId,_that.title,_that.slug,_that.type,_that.description,_that.isPublic,_that.isForSale,_that.price,_that.accessPeriodDays,_that.difficulty,_that.durationWeeks,_that.daysPerWeek,_that.programImage,_that.curriculum,_that.coach,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _ProgramEntity implements ProgramEntity {
  const _ProgramEntity({required this.id, required this.coachId, required this.title, required this.slug, required this.type, this.description, required this.isPublic, required this.isForSale, required this.price, this.accessPeriodDays, required this.difficulty, required this.durationWeeks, required this.daysPerWeek, this.programImage, final  List<CurriculumItemEntity> curriculum = const [], this.coach, required this.createdAt, required this.updatedAt}): _curriculum = curriculum;
  

@override final  String id;
@override final  String coachId;
@override final  String title;
@override final  String slug;
@override final  String type;
@override final  String? description;
@override final  bool isPublic;
@override final  bool isForSale;
@override final  num price;
@override final  int? accessPeriodDays;
@override final  String difficulty;
@override final  int durationWeeks;
@override final  int daysPerWeek;
@override final  String? programImage;
 final  List<CurriculumItemEntity> _curriculum;
@override@JsonKey() List<CurriculumItemEntity> get curriculum {
  if (_curriculum is EqualUnmodifiableListView) return _curriculum;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_curriculum);
}

@override final  CoachProfileEntity? coach;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of ProgramEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProgramEntityCopyWith<_ProgramEntity> get copyWith => __$ProgramEntityCopyWithImpl<_ProgramEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProgramEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.coachId, coachId) || other.coachId == coachId)&&(identical(other.title, title) || other.title == title)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.type, type) || other.type == type)&&(identical(other.description, description) || other.description == description)&&(identical(other.isPublic, isPublic) || other.isPublic == isPublic)&&(identical(other.isForSale, isForSale) || other.isForSale == isForSale)&&(identical(other.price, price) || other.price == price)&&(identical(other.accessPeriodDays, accessPeriodDays) || other.accessPeriodDays == accessPeriodDays)&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty)&&(identical(other.durationWeeks, durationWeeks) || other.durationWeeks == durationWeeks)&&(identical(other.daysPerWeek, daysPerWeek) || other.daysPerWeek == daysPerWeek)&&(identical(other.programImage, programImage) || other.programImage == programImage)&&const DeepCollectionEquality().equals(other._curriculum, _curriculum)&&(identical(other.coach, coach) || other.coach == coach)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,coachId,title,slug,type,description,isPublic,isForSale,price,accessPeriodDays,difficulty,durationWeeks,daysPerWeek,programImage,const DeepCollectionEquality().hash(_curriculum),coach,createdAt,updatedAt);

@override
String toString() {
  return 'ProgramEntity(id: $id, coachId: $coachId, title: $title, slug: $slug, type: $type, description: $description, isPublic: $isPublic, isForSale: $isForSale, price: $price, accessPeriodDays: $accessPeriodDays, difficulty: $difficulty, durationWeeks: $durationWeeks, daysPerWeek: $daysPerWeek, programImage: $programImage, curriculum: $curriculum, coach: $coach, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ProgramEntityCopyWith<$Res> implements $ProgramEntityCopyWith<$Res> {
  factory _$ProgramEntityCopyWith(_ProgramEntity value, $Res Function(_ProgramEntity) _then) = __$ProgramEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String coachId, String title, String slug, String type, String? description, bool isPublic, bool isForSale, num price, int? accessPeriodDays, String difficulty, int durationWeeks, int daysPerWeek, String? programImage, List<CurriculumItemEntity> curriculum, CoachProfileEntity? coach, DateTime createdAt, DateTime updatedAt
});


@override $CoachProfileEntityCopyWith<$Res>? get coach;

}
/// @nodoc
class __$ProgramEntityCopyWithImpl<$Res>
    implements _$ProgramEntityCopyWith<$Res> {
  __$ProgramEntityCopyWithImpl(this._self, this._then);

  final _ProgramEntity _self;
  final $Res Function(_ProgramEntity) _then;

/// Create a copy of ProgramEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? coachId = null,Object? title = null,Object? slug = null,Object? type = null,Object? description = freezed,Object? isPublic = null,Object? isForSale = null,Object? price = null,Object? accessPeriodDays = freezed,Object? difficulty = null,Object? durationWeeks = null,Object? daysPerWeek = null,Object? programImage = freezed,Object? curriculum = null,Object? coach = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_ProgramEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,coachId: null == coachId ? _self.coachId : coachId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,isPublic: null == isPublic ? _self.isPublic : isPublic // ignore: cast_nullable_to_non_nullable
as bool,isForSale: null == isForSale ? _self.isForSale : isForSale // ignore: cast_nullable_to_non_nullable
as bool,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as num,accessPeriodDays: freezed == accessPeriodDays ? _self.accessPeriodDays : accessPeriodDays // ignore: cast_nullable_to_non_nullable
as int?,difficulty: null == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as String,durationWeeks: null == durationWeeks ? _self.durationWeeks : durationWeeks // ignore: cast_nullable_to_non_nullable
as int,daysPerWeek: null == daysPerWeek ? _self.daysPerWeek : daysPerWeek // ignore: cast_nullable_to_non_nullable
as int,programImage: freezed == programImage ? _self.programImage : programImage // ignore: cast_nullable_to_non_nullable
as String?,curriculum: null == curriculum ? _self._curriculum : curriculum // ignore: cast_nullable_to_non_nullable
as List<CurriculumItemEntity>,coach: freezed == coach ? _self.coach : coach // ignore: cast_nullable_to_non_nullable
as CoachProfileEntity?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of ProgramEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CoachProfileEntityCopyWith<$Res>? get coach {
    if (_self.coach == null) {
    return null;
  }

  return $CoachProfileEntityCopyWith<$Res>(_self.coach!, (value) {
    return _then(_self.copyWith(coach: value));
  });
}
}

/// @nodoc
mixin _$CoachProfileEntity {

 String get id; String? get profileImageUrl; String? get nickname;
/// Create a copy of CoachProfileEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CoachProfileEntityCopyWith<CoachProfileEntity> get copyWith => _$CoachProfileEntityCopyWithImpl<CoachProfileEntity>(this as CoachProfileEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CoachProfileEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.profileImageUrl, profileImageUrl) || other.profileImageUrl == profileImageUrl)&&(identical(other.nickname, nickname) || other.nickname == nickname));
}


@override
int get hashCode => Object.hash(runtimeType,id,profileImageUrl,nickname);

@override
String toString() {
  return 'CoachProfileEntity(id: $id, profileImageUrl: $profileImageUrl, nickname: $nickname)';
}


}

/// @nodoc
abstract mixin class $CoachProfileEntityCopyWith<$Res>  {
  factory $CoachProfileEntityCopyWith(CoachProfileEntity value, $Res Function(CoachProfileEntity) _then) = _$CoachProfileEntityCopyWithImpl;
@useResult
$Res call({
 String id, String? profileImageUrl, String? nickname
});




}
/// @nodoc
class _$CoachProfileEntityCopyWithImpl<$Res>
    implements $CoachProfileEntityCopyWith<$Res> {
  _$CoachProfileEntityCopyWithImpl(this._self, this._then);

  final CoachProfileEntity _self;
  final $Res Function(CoachProfileEntity) _then;

/// Create a copy of CoachProfileEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? profileImageUrl = freezed,Object? nickname = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,profileImageUrl: freezed == profileImageUrl ? _self.profileImageUrl : profileImageUrl // ignore: cast_nullable_to_non_nullable
as String?,nickname: freezed == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CoachProfileEntity].
extension CoachProfileEntityPatterns on CoachProfileEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CoachProfileEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CoachProfileEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CoachProfileEntity value)  $default,){
final _that = this;
switch (_that) {
case _CoachProfileEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CoachProfileEntity value)?  $default,){
final _that = this;
switch (_that) {
case _CoachProfileEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? profileImageUrl,  String? nickname)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CoachProfileEntity() when $default != null:
return $default(_that.id,_that.profileImageUrl,_that.nickname);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? profileImageUrl,  String? nickname)  $default,) {final _that = this;
switch (_that) {
case _CoachProfileEntity():
return $default(_that.id,_that.profileImageUrl,_that.nickname);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? profileImageUrl,  String? nickname)?  $default,) {final _that = this;
switch (_that) {
case _CoachProfileEntity() when $default != null:
return $default(_that.id,_that.profileImageUrl,_that.nickname);case _:
  return null;

}
}

}

/// @nodoc


class _CoachProfileEntity implements CoachProfileEntity {
  const _CoachProfileEntity({required this.id, this.profileImageUrl, this.nickname});
  

@override final  String id;
@override final  String? profileImageUrl;
@override final  String? nickname;

/// Create a copy of CoachProfileEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CoachProfileEntityCopyWith<_CoachProfileEntity> get copyWith => __$CoachProfileEntityCopyWithImpl<_CoachProfileEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CoachProfileEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.profileImageUrl, profileImageUrl) || other.profileImageUrl == profileImageUrl)&&(identical(other.nickname, nickname) || other.nickname == nickname));
}


@override
int get hashCode => Object.hash(runtimeType,id,profileImageUrl,nickname);

@override
String toString() {
  return 'CoachProfileEntity(id: $id, profileImageUrl: $profileImageUrl, nickname: $nickname)';
}


}

/// @nodoc
abstract mixin class _$CoachProfileEntityCopyWith<$Res> implements $CoachProfileEntityCopyWith<$Res> {
  factory _$CoachProfileEntityCopyWith(_CoachProfileEntity value, $Res Function(_CoachProfileEntity) _then) = __$CoachProfileEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String? profileImageUrl, String? nickname
});




}
/// @nodoc
class __$CoachProfileEntityCopyWithImpl<$Res>
    implements _$CoachProfileEntityCopyWith<$Res> {
  __$CoachProfileEntityCopyWithImpl(this._self, this._then);

  final _CoachProfileEntity _self;
  final $Res Function(_CoachProfileEntity) _then;

/// Create a copy of CoachProfileEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? profileImageUrl = freezed,Object? nickname = freezed,}) {
  return _then(_CoachProfileEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,profileImageUrl: freezed == profileImageUrl ? _self.profileImageUrl : profileImageUrl // ignore: cast_nullable_to_non_nullable
as String?,nickname: freezed == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$CurriculumItemEntity {

 String get title; String get description;
/// Create a copy of CurriculumItemEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CurriculumItemEntityCopyWith<CurriculumItemEntity> get copyWith => _$CurriculumItemEntityCopyWithImpl<CurriculumItemEntity>(this as CurriculumItemEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CurriculumItemEntity&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description));
}


@override
int get hashCode => Object.hash(runtimeType,title,description);

@override
String toString() {
  return 'CurriculumItemEntity(title: $title, description: $description)';
}


}

/// @nodoc
abstract mixin class $CurriculumItemEntityCopyWith<$Res>  {
  factory $CurriculumItemEntityCopyWith(CurriculumItemEntity value, $Res Function(CurriculumItemEntity) _then) = _$CurriculumItemEntityCopyWithImpl;
@useResult
$Res call({
 String title, String description
});




}
/// @nodoc
class _$CurriculumItemEntityCopyWithImpl<$Res>
    implements $CurriculumItemEntityCopyWith<$Res> {
  _$CurriculumItemEntityCopyWithImpl(this._self, this._then);

  final CurriculumItemEntity _self;
  final $Res Function(CurriculumItemEntity) _then;

/// Create a copy of CurriculumItemEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? description = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CurriculumItemEntity].
extension CurriculumItemEntityPatterns on CurriculumItemEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CurriculumItemEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CurriculumItemEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CurriculumItemEntity value)  $default,){
final _that = this;
switch (_that) {
case _CurriculumItemEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CurriculumItemEntity value)?  $default,){
final _that = this;
switch (_that) {
case _CurriculumItemEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CurriculumItemEntity() when $default != null:
return $default(_that.title,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String description)  $default,) {final _that = this;
switch (_that) {
case _CurriculumItemEntity():
return $default(_that.title,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String description)?  $default,) {final _that = this;
switch (_that) {
case _CurriculumItemEntity() when $default != null:
return $default(_that.title,_that.description);case _:
  return null;

}
}

}

/// @nodoc


class _CurriculumItemEntity implements CurriculumItemEntity {
  const _CurriculumItemEntity({required this.title, required this.description});
  

@override final  String title;
@override final  String description;

/// Create a copy of CurriculumItemEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CurriculumItemEntityCopyWith<_CurriculumItemEntity> get copyWith => __$CurriculumItemEntityCopyWithImpl<_CurriculumItemEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CurriculumItemEntity&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description));
}


@override
int get hashCode => Object.hash(runtimeType,title,description);

@override
String toString() {
  return 'CurriculumItemEntity(title: $title, description: $description)';
}


}

/// @nodoc
abstract mixin class _$CurriculumItemEntityCopyWith<$Res> implements $CurriculumItemEntityCopyWith<$Res> {
  factory _$CurriculumItemEntityCopyWith(_CurriculumItemEntity value, $Res Function(_CurriculumItemEntity) _then) = __$CurriculumItemEntityCopyWithImpl;
@override @useResult
$Res call({
 String title, String description
});




}
/// @nodoc
class __$CurriculumItemEntityCopyWithImpl<$Res>
    implements _$CurriculumItemEntityCopyWith<$Res> {
  __$CurriculumItemEntityCopyWithImpl(this._self, this._then);

  final _CurriculumItemEntity _self;
  final $Res Function(_CurriculumItemEntity) _then;

/// Create a copy of CurriculumItemEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? description = null,}) {
  return _then(_CurriculumItemEntity(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
