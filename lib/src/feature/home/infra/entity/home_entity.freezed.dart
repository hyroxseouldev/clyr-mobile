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

 String get id; String get title; String? get thumbnailUrl; String? get shortDescription; String? get description;
/// Create a copy of ActiveProgramEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActiveProgramEntityCopyWith<ActiveProgramEntity> get copyWith => _$ActiveProgramEntityCopyWithImpl<ActiveProgramEntity>(this as ActiveProgramEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActiveProgramEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.shortDescription, shortDescription) || other.shortDescription == shortDescription)&&(identical(other.description, description) || other.description == description));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,thumbnailUrl,shortDescription,description);

@override
String toString() {
  return 'ActiveProgramEntity(id: $id, title: $title, thumbnailUrl: $thumbnailUrl, shortDescription: $shortDescription, description: $description)';
}


}

/// @nodoc
abstract mixin class $ActiveProgramEntityCopyWith<$Res>  {
  factory $ActiveProgramEntityCopyWith(ActiveProgramEntity value, $Res Function(ActiveProgramEntity) _then) = _$ActiveProgramEntityCopyWithImpl;
@useResult
$Res call({
 String id, String title, String? thumbnailUrl, String? shortDescription, String? description
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? thumbnailUrl = freezed,Object? shortDescription = freezed,Object? description = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,thumbnailUrl: freezed == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String?,shortDescription: freezed == shortDescription ? _self.shortDescription : shortDescription // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String? thumbnailUrl,  String? shortDescription,  String? description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ActiveProgramEntity() when $default != null:
return $default(_that.id,_that.title,_that.thumbnailUrl,_that.shortDescription,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String? thumbnailUrl,  String? shortDescription,  String? description)  $default,) {final _that = this;
switch (_that) {
case _ActiveProgramEntity():
return $default(_that.id,_that.title,_that.thumbnailUrl,_that.shortDescription,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String? thumbnailUrl,  String? shortDescription,  String? description)?  $default,) {final _that = this;
switch (_that) {
case _ActiveProgramEntity() when $default != null:
return $default(_that.id,_that.title,_that.thumbnailUrl,_that.shortDescription,_that.description);case _:
  return null;

}
}

}

/// @nodoc


class _ActiveProgramEntity implements ActiveProgramEntity {
  const _ActiveProgramEntity({required this.id, required this.title, this.thumbnailUrl, this.shortDescription, this.description});
  

@override final  String id;
@override final  String title;
@override final  String? thumbnailUrl;
@override final  String? shortDescription;
@override final  String? description;

/// Create a copy of ActiveProgramEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ActiveProgramEntityCopyWith<_ActiveProgramEntity> get copyWith => __$ActiveProgramEntityCopyWithImpl<_ActiveProgramEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ActiveProgramEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.shortDescription, shortDescription) || other.shortDescription == shortDescription)&&(identical(other.description, description) || other.description == description));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,thumbnailUrl,shortDescription,description);

@override
String toString() {
  return 'ActiveProgramEntity(id: $id, title: $title, thumbnailUrl: $thumbnailUrl, shortDescription: $shortDescription, description: $description)';
}


}

/// @nodoc
abstract mixin class _$ActiveProgramEntityCopyWith<$Res> implements $ActiveProgramEntityCopyWith<$Res> {
  factory _$ActiveProgramEntityCopyWith(_ActiveProgramEntity value, $Res Function(_ActiveProgramEntity) _then) = __$ActiveProgramEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String? thumbnailUrl, String? shortDescription, String? description
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? thumbnailUrl = freezed,Object? shortDescription = freezed,Object? description = freezed,}) {
  return _then(_ActiveProgramEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,thumbnailUrl: freezed == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String?,shortDescription: freezed == shortDescription ? _self.shortDescription : shortDescription // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$BlueprintSectionEntity {

 String get id; String get title; String get content; int get orderIndex; bool get isCompleted;
/// Create a copy of BlueprintSectionEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BlueprintSectionEntityCopyWith<BlueprintSectionEntity> get copyWith => _$BlueprintSectionEntityCopyWithImpl<BlueprintSectionEntity>(this as BlueprintSectionEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BlueprintSectionEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.orderIndex, orderIndex) || other.orderIndex == orderIndex)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,content,orderIndex,isCompleted);

@override
String toString() {
  return 'BlueprintSectionEntity(id: $id, title: $title, content: $content, orderIndex: $orderIndex, isCompleted: $isCompleted)';
}


}

/// @nodoc
abstract mixin class $BlueprintSectionEntityCopyWith<$Res>  {
  factory $BlueprintSectionEntityCopyWith(BlueprintSectionEntity value, $Res Function(BlueprintSectionEntity) _then) = _$BlueprintSectionEntityCopyWithImpl;
@useResult
$Res call({
 String id, String title, String content, int orderIndex, bool isCompleted
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? content = null,Object? orderIndex = null,Object? isCompleted = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String content,  int orderIndex,  bool isCompleted)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BlueprintSectionEntity() when $default != null:
return $default(_that.id,_that.title,_that.content,_that.orderIndex,_that.isCompleted);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String content,  int orderIndex,  bool isCompleted)  $default,) {final _that = this;
switch (_that) {
case _BlueprintSectionEntity():
return $default(_that.id,_that.title,_that.content,_that.orderIndex,_that.isCompleted);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String content,  int orderIndex,  bool isCompleted)?  $default,) {final _that = this;
switch (_that) {
case _BlueprintSectionEntity() when $default != null:
return $default(_that.id,_that.title,_that.content,_that.orderIndex,_that.isCompleted);case _:
  return null;

}
}

}

/// @nodoc


class _BlueprintSectionEntity implements BlueprintSectionEntity {
  const _BlueprintSectionEntity({required this.id, required this.title, required this.content, required this.orderIndex, required this.isCompleted});
  

@override final  String id;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BlueprintSectionEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.orderIndex, orderIndex) || other.orderIndex == orderIndex)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,content,orderIndex,isCompleted);

@override
String toString() {
  return 'BlueprintSectionEntity(id: $id, title: $title, content: $content, orderIndex: $orderIndex, isCompleted: $isCompleted)';
}


}

/// @nodoc
abstract mixin class _$BlueprintSectionEntityCopyWith<$Res> implements $BlueprintSectionEntityCopyWith<$Res> {
  factory _$BlueprintSectionEntityCopyWith(_BlueprintSectionEntity value, $Res Function(_BlueprintSectionEntity) _then) = __$BlueprintSectionEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String content, int orderIndex, bool isCompleted
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? content = null,Object? orderIndex = null,Object? isCompleted = null,}) {
  return _then(_BlueprintSectionEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,orderIndex: null == orderIndex ? _self.orderIndex : orderIndex // ignore: cast_nullable_to_non_nullable
as int,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
