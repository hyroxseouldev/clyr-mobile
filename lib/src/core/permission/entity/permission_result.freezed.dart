// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'permission_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PermissionResult {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PermissionResult);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PermissionResult()';
}


}

/// @nodoc
class $PermissionResultCopyWith<$Res>  {
$PermissionResultCopyWith(PermissionResult _, $Res Function(PermissionResult) __);
}


/// Adds pattern-matching-related methods to [PermissionResult].
extension PermissionResultPatterns on PermissionResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GrantedPermission value)?  granted,TResult Function( DeniedPermission value)?  denied,TResult Function( PermanentlyDeniedPermission value)?  permanentlyDenied,TResult Function( LimitedPermission value)?  limited,TResult Function( ProvisionalPermission value)?  provisional,TResult Function( RestrictedPermission value)?  restricted,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GrantedPermission() when granted != null:
return granted(_that);case DeniedPermission() when denied != null:
return denied(_that);case PermanentlyDeniedPermission() when permanentlyDenied != null:
return permanentlyDenied(_that);case LimitedPermission() when limited != null:
return limited(_that);case ProvisionalPermission() when provisional != null:
return provisional(_that);case RestrictedPermission() when restricted != null:
return restricted(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GrantedPermission value)  granted,required TResult Function( DeniedPermission value)  denied,required TResult Function( PermanentlyDeniedPermission value)  permanentlyDenied,required TResult Function( LimitedPermission value)  limited,required TResult Function( ProvisionalPermission value)  provisional,required TResult Function( RestrictedPermission value)  restricted,}){
final _that = this;
switch (_that) {
case GrantedPermission():
return granted(_that);case DeniedPermission():
return denied(_that);case PermanentlyDeniedPermission():
return permanentlyDenied(_that);case LimitedPermission():
return limited(_that);case ProvisionalPermission():
return provisional(_that);case RestrictedPermission():
return restricted(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GrantedPermission value)?  granted,TResult? Function( DeniedPermission value)?  denied,TResult? Function( PermanentlyDeniedPermission value)?  permanentlyDenied,TResult? Function( LimitedPermission value)?  limited,TResult? Function( ProvisionalPermission value)?  provisional,TResult? Function( RestrictedPermission value)?  restricted,}){
final _that = this;
switch (_that) {
case GrantedPermission() when granted != null:
return granted(_that);case DeniedPermission() when denied != null:
return denied(_that);case PermanentlyDeniedPermission() when permanentlyDenied != null:
return permanentlyDenied(_that);case LimitedPermission() when limited != null:
return limited(_that);case ProvisionalPermission() when provisional != null:
return provisional(_that);case RestrictedPermission() when restricted != null:
return restricted(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  granted,TResult Function()?  denied,TResult Function()?  permanentlyDenied,TResult Function()?  limited,TResult Function()?  provisional,TResult Function()?  restricted,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GrantedPermission() when granted != null:
return granted();case DeniedPermission() when denied != null:
return denied();case PermanentlyDeniedPermission() when permanentlyDenied != null:
return permanentlyDenied();case LimitedPermission() when limited != null:
return limited();case ProvisionalPermission() when provisional != null:
return provisional();case RestrictedPermission() when restricted != null:
return restricted();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  granted,required TResult Function()  denied,required TResult Function()  permanentlyDenied,required TResult Function()  limited,required TResult Function()  provisional,required TResult Function()  restricted,}) {final _that = this;
switch (_that) {
case GrantedPermission():
return granted();case DeniedPermission():
return denied();case PermanentlyDeniedPermission():
return permanentlyDenied();case LimitedPermission():
return limited();case ProvisionalPermission():
return provisional();case RestrictedPermission():
return restricted();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  granted,TResult? Function()?  denied,TResult? Function()?  permanentlyDenied,TResult? Function()?  limited,TResult? Function()?  provisional,TResult? Function()?  restricted,}) {final _that = this;
switch (_that) {
case GrantedPermission() when granted != null:
return granted();case DeniedPermission() when denied != null:
return denied();case PermanentlyDeniedPermission() when permanentlyDenied != null:
return permanentlyDenied();case LimitedPermission() when limited != null:
return limited();case ProvisionalPermission() when provisional != null:
return provisional();case RestrictedPermission() when restricted != null:
return restricted();case _:
  return null;

}
}

}

/// @nodoc


class GrantedPermission extends PermissionResult {
  const GrantedPermission(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GrantedPermission);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PermissionResult.granted()';
}


}




/// @nodoc


class DeniedPermission extends PermissionResult {
  const DeniedPermission(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeniedPermission);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PermissionResult.denied()';
}


}




/// @nodoc


class PermanentlyDeniedPermission extends PermissionResult {
  const PermanentlyDeniedPermission(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PermanentlyDeniedPermission);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PermissionResult.permanentlyDenied()';
}


}




/// @nodoc


class LimitedPermission extends PermissionResult {
  const LimitedPermission(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LimitedPermission);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PermissionResult.limited()';
}


}




/// @nodoc


class ProvisionalPermission extends PermissionResult {
  const ProvisionalPermission(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProvisionalPermission);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PermissionResult.provisional()';
}


}




/// @nodoc


class RestrictedPermission extends PermissionResult {
  const RestrictedPermission(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RestrictedPermission);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PermissionResult.restricted()';
}


}




// dart format on
