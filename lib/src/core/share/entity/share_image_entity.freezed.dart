// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'share_image_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ShareImageEntity {

/// Generated image bytes (PNG format)
 Uint8List get imageBytes;/// Image style variant
 ShareImageStyle get style;
/// Create a copy of ShareImageEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShareImageEntityCopyWith<ShareImageEntity> get copyWith => _$ShareImageEntityCopyWithImpl<ShareImageEntity>(this as ShareImageEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShareImageEntity&&const DeepCollectionEquality().equals(other.imageBytes, imageBytes)&&(identical(other.style, style) || other.style == style));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(imageBytes),style);

@override
String toString() {
  return 'ShareImageEntity(imageBytes: $imageBytes, style: $style)';
}


}

/// @nodoc
abstract mixin class $ShareImageEntityCopyWith<$Res>  {
  factory $ShareImageEntityCopyWith(ShareImageEntity value, $Res Function(ShareImageEntity) _then) = _$ShareImageEntityCopyWithImpl;
@useResult
$Res call({
 Uint8List imageBytes, ShareImageStyle style
});




}
/// @nodoc
class _$ShareImageEntityCopyWithImpl<$Res>
    implements $ShareImageEntityCopyWith<$Res> {
  _$ShareImageEntityCopyWithImpl(this._self, this._then);

  final ShareImageEntity _self;
  final $Res Function(ShareImageEntity) _then;

/// Create a copy of ShareImageEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? imageBytes = null,Object? style = null,}) {
  return _then(_self.copyWith(
imageBytes: null == imageBytes ? _self.imageBytes : imageBytes // ignore: cast_nullable_to_non_nullable
as Uint8List,style: null == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as ShareImageStyle,
  ));
}

}


/// Adds pattern-matching-related methods to [ShareImageEntity].
extension ShareImageEntityPatterns on ShareImageEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShareImageEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShareImageEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShareImageEntity value)  $default,){
final _that = this;
switch (_that) {
case _ShareImageEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShareImageEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ShareImageEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Uint8List imageBytes,  ShareImageStyle style)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShareImageEntity() when $default != null:
return $default(_that.imageBytes,_that.style);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Uint8List imageBytes,  ShareImageStyle style)  $default,) {final _that = this;
switch (_that) {
case _ShareImageEntity():
return $default(_that.imageBytes,_that.style);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Uint8List imageBytes,  ShareImageStyle style)?  $default,) {final _that = this;
switch (_that) {
case _ShareImageEntity() when $default != null:
return $default(_that.imageBytes,_that.style);case _:
  return null;

}
}

}

/// @nodoc


class _ShareImageEntity extends ShareImageEntity {
  const _ShareImageEntity({required this.imageBytes, required this.style}): super._();
  

/// Generated image bytes (PNG format)
@override final  Uint8List imageBytes;
/// Image style variant
@override final  ShareImageStyle style;

/// Create a copy of ShareImageEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShareImageEntityCopyWith<_ShareImageEntity> get copyWith => __$ShareImageEntityCopyWithImpl<_ShareImageEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShareImageEntity&&const DeepCollectionEquality().equals(other.imageBytes, imageBytes)&&(identical(other.style, style) || other.style == style));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(imageBytes),style);

@override
String toString() {
  return 'ShareImageEntity(imageBytes: $imageBytes, style: $style)';
}


}

/// @nodoc
abstract mixin class _$ShareImageEntityCopyWith<$Res> implements $ShareImageEntityCopyWith<$Res> {
  factory _$ShareImageEntityCopyWith(_ShareImageEntity value, $Res Function(_ShareImageEntity) _then) = __$ShareImageEntityCopyWithImpl;
@override @useResult
$Res call({
 Uint8List imageBytes, ShareImageStyle style
});




}
/// @nodoc
class __$ShareImageEntityCopyWithImpl<$Res>
    implements _$ShareImageEntityCopyWith<$Res> {
  __$ShareImageEntityCopyWithImpl(this._self, this._then);

  final _ShareImageEntity _self;
  final $Res Function(_ShareImageEntity) _then;

/// Create a copy of ShareImageEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? imageBytes = null,Object? style = null,}) {
  return _then(_ShareImageEntity(
imageBytes: null == imageBytes ? _self.imageBytes : imageBytes // ignore: cast_nullable_to_non_nullable
as Uint8List,style: null == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as ShareImageStyle,
  ));
}


}

// dart format on
