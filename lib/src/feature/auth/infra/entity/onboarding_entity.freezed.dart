// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OnboardingEntity {

 Gender get gender; ExerciseType get exerciseType; ExperienceLevel get experience;
/// Create a copy of OnboardingEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnboardingEntityCopyWith<OnboardingEntity> get copyWith => _$OnboardingEntityCopyWithImpl<OnboardingEntity>(this as OnboardingEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingEntity&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.exerciseType, exerciseType) || other.exerciseType == exerciseType)&&(identical(other.experience, experience) || other.experience == experience));
}


@override
int get hashCode => Object.hash(runtimeType,gender,exerciseType,experience);

@override
String toString() {
  return 'OnboardingEntity(gender: $gender, exerciseType: $exerciseType, experience: $experience)';
}


}

/// @nodoc
abstract mixin class $OnboardingEntityCopyWith<$Res>  {
  factory $OnboardingEntityCopyWith(OnboardingEntity value, $Res Function(OnboardingEntity) _then) = _$OnboardingEntityCopyWithImpl;
@useResult
$Res call({
 Gender gender, ExerciseType exerciseType, ExperienceLevel experience
});




}
/// @nodoc
class _$OnboardingEntityCopyWithImpl<$Res>
    implements $OnboardingEntityCopyWith<$Res> {
  _$OnboardingEntityCopyWithImpl(this._self, this._then);

  final OnboardingEntity _self;
  final $Res Function(OnboardingEntity) _then;

/// Create a copy of OnboardingEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? gender = null,Object? exerciseType = null,Object? experience = null,}) {
  return _then(_self.copyWith(
gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as Gender,exerciseType: null == exerciseType ? _self.exerciseType : exerciseType // ignore: cast_nullable_to_non_nullable
as ExerciseType,experience: null == experience ? _self.experience : experience // ignore: cast_nullable_to_non_nullable
as ExperienceLevel,
  ));
}

}


/// Adds pattern-matching-related methods to [OnboardingEntity].
extension OnboardingEntityPatterns on OnboardingEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OnboardingEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OnboardingEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OnboardingEntity value)  $default,){
final _that = this;
switch (_that) {
case _OnboardingEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OnboardingEntity value)?  $default,){
final _that = this;
switch (_that) {
case _OnboardingEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Gender gender,  ExerciseType exerciseType,  ExperienceLevel experience)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OnboardingEntity() when $default != null:
return $default(_that.gender,_that.exerciseType,_that.experience);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Gender gender,  ExerciseType exerciseType,  ExperienceLevel experience)  $default,) {final _that = this;
switch (_that) {
case _OnboardingEntity():
return $default(_that.gender,_that.exerciseType,_that.experience);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Gender gender,  ExerciseType exerciseType,  ExperienceLevel experience)?  $default,) {final _that = this;
switch (_that) {
case _OnboardingEntity() when $default != null:
return $default(_that.gender,_that.exerciseType,_that.experience);case _:
  return null;

}
}

}

/// @nodoc


class _OnboardingEntity extends OnboardingEntity {
  const _OnboardingEntity({required this.gender, required this.exerciseType, required this.experience}): super._();
  

@override final  Gender gender;
@override final  ExerciseType exerciseType;
@override final  ExperienceLevel experience;

/// Create a copy of OnboardingEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OnboardingEntityCopyWith<_OnboardingEntity> get copyWith => __$OnboardingEntityCopyWithImpl<_OnboardingEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnboardingEntity&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.exerciseType, exerciseType) || other.exerciseType == exerciseType)&&(identical(other.experience, experience) || other.experience == experience));
}


@override
int get hashCode => Object.hash(runtimeType,gender,exerciseType,experience);

@override
String toString() {
  return 'OnboardingEntity(gender: $gender, exerciseType: $exerciseType, experience: $experience)';
}


}

/// @nodoc
abstract mixin class _$OnboardingEntityCopyWith<$Res> implements $OnboardingEntityCopyWith<$Res> {
  factory _$OnboardingEntityCopyWith(_OnboardingEntity value, $Res Function(_OnboardingEntity) _then) = __$OnboardingEntityCopyWithImpl;
@override @useResult
$Res call({
 Gender gender, ExerciseType exerciseType, ExperienceLevel experience
});




}
/// @nodoc
class __$OnboardingEntityCopyWithImpl<$Res>
    implements _$OnboardingEntityCopyWith<$Res> {
  __$OnboardingEntityCopyWithImpl(this._self, this._then);

  final _OnboardingEntity _self;
  final $Res Function(_OnboardingEntity) _then;

/// Create a copy of OnboardingEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? gender = null,Object? exerciseType = null,Object? experience = null,}) {
  return _then(_OnboardingEntity(
gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as Gender,exerciseType: null == exerciseType ? _self.exerciseType : exerciseType // ignore: cast_nullable_to_non_nullable
as ExerciseType,experience: null == experience ? _self.experience : experience // ignore: cast_nullable_to_non_nullable
as ExperienceLevel,
  ));
}


}

// dart format on
