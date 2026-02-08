// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppException {

 String? get message;
/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppExceptionCopyWith<AppException> get copyWith => _$AppExceptionCopyWithImpl<AppException>(this as AppException, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppException&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AppException(message: $message)';
}


}

/// @nodoc
abstract mixin class $AppExceptionCopyWith<$Res>  {
  factory $AppExceptionCopyWith(AppException value, $Res Function(AppException) _then) = _$AppExceptionCopyWithImpl;
@useResult
$Res call({
 String? message
});




}
/// @nodoc
class _$AppExceptionCopyWithImpl<$Res>
    implements $AppExceptionCopyWith<$Res> {
  _$AppExceptionCopyWithImpl(this._self, this._then);

  final AppException _self;
  final $Res Function(AppException) _then;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = freezed,}) {
  return _then(_self.copyWith(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AppException].
extension AppExceptionPatterns on AppException {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AuthException value)?  auth,TResult Function( NetworkException value)?  network,TResult Function( OrderException value)?  order,TResult Function( WorkoutException value)?  workout,TResult Function( HomeException value)?  home,TResult Function( LogException value)?  log,TResult Function( OnboardingException value)?  onboarding,TResult Function( HealthException value)?  health,TResult Function( NoDataException value)?  noData,TResult Function( PermissionException value)?  permission,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AuthException() when auth != null:
return auth(_that);case NetworkException() when network != null:
return network(_that);case OrderException() when order != null:
return order(_that);case WorkoutException() when workout != null:
return workout(_that);case HomeException() when home != null:
return home(_that);case LogException() when log != null:
return log(_that);case OnboardingException() when onboarding != null:
return onboarding(_that);case HealthException() when health != null:
return health(_that);case NoDataException() when noData != null:
return noData(_that);case PermissionException() when permission != null:
return permission(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AuthException value)  auth,required TResult Function( NetworkException value)  network,required TResult Function( OrderException value)  order,required TResult Function( WorkoutException value)  workout,required TResult Function( HomeException value)  home,required TResult Function( LogException value)  log,required TResult Function( OnboardingException value)  onboarding,required TResult Function( HealthException value)  health,required TResult Function( NoDataException value)  noData,required TResult Function( PermissionException value)  permission,}){
final _that = this;
switch (_that) {
case AuthException():
return auth(_that);case NetworkException():
return network(_that);case OrderException():
return order(_that);case WorkoutException():
return workout(_that);case HomeException():
return home(_that);case LogException():
return log(_that);case OnboardingException():
return onboarding(_that);case HealthException():
return health(_that);case NoDataException():
return noData(_that);case PermissionException():
return permission(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AuthException value)?  auth,TResult? Function( NetworkException value)?  network,TResult? Function( OrderException value)?  order,TResult? Function( WorkoutException value)?  workout,TResult? Function( HomeException value)?  home,TResult? Function( LogException value)?  log,TResult? Function( OnboardingException value)?  onboarding,TResult? Function( HealthException value)?  health,TResult? Function( NoDataException value)?  noData,TResult? Function( PermissionException value)?  permission,}){
final _that = this;
switch (_that) {
case AuthException() when auth != null:
return auth(_that);case NetworkException() when network != null:
return network(_that);case OrderException() when order != null:
return order(_that);case WorkoutException() when workout != null:
return workout(_that);case HomeException() when home != null:
return home(_that);case LogException() when log != null:
return log(_that);case OnboardingException() when onboarding != null:
return onboarding(_that);case HealthException() when health != null:
return health(_that);case NoDataException() when noData != null:
return noData(_that);case PermissionException() when permission != null:
return permission(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String? message)?  auth,TResult Function( String? message)?  network,TResult Function( String? message)?  order,TResult Function( String? message)?  workout,TResult Function( String? message)?  home,TResult Function( String? message)?  log,TResult Function( String? message)?  onboarding,TResult Function( String? message)?  health,TResult Function( String? message)?  noData,TResult Function( String? message)?  permission,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AuthException() when auth != null:
return auth(_that.message);case NetworkException() when network != null:
return network(_that.message);case OrderException() when order != null:
return order(_that.message);case WorkoutException() when workout != null:
return workout(_that.message);case HomeException() when home != null:
return home(_that.message);case LogException() when log != null:
return log(_that.message);case OnboardingException() when onboarding != null:
return onboarding(_that.message);case HealthException() when health != null:
return health(_that.message);case NoDataException() when noData != null:
return noData(_that.message);case PermissionException() when permission != null:
return permission(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String? message)  auth,required TResult Function( String? message)  network,required TResult Function( String? message)  order,required TResult Function( String? message)  workout,required TResult Function( String? message)  home,required TResult Function( String? message)  log,required TResult Function( String? message)  onboarding,required TResult Function( String? message)  health,required TResult Function( String? message)  noData,required TResult Function( String? message)  permission,}) {final _that = this;
switch (_that) {
case AuthException():
return auth(_that.message);case NetworkException():
return network(_that.message);case OrderException():
return order(_that.message);case WorkoutException():
return workout(_that.message);case HomeException():
return home(_that.message);case LogException():
return log(_that.message);case OnboardingException():
return onboarding(_that.message);case HealthException():
return health(_that.message);case NoDataException():
return noData(_that.message);case PermissionException():
return permission(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String? message)?  auth,TResult? Function( String? message)?  network,TResult? Function( String? message)?  order,TResult? Function( String? message)?  workout,TResult? Function( String? message)?  home,TResult? Function( String? message)?  log,TResult? Function( String? message)?  onboarding,TResult? Function( String? message)?  health,TResult? Function( String? message)?  noData,TResult? Function( String? message)?  permission,}) {final _that = this;
switch (_that) {
case AuthException() when auth != null:
return auth(_that.message);case NetworkException() when network != null:
return network(_that.message);case OrderException() when order != null:
return order(_that.message);case WorkoutException() when workout != null:
return workout(_that.message);case HomeException() when home != null:
return home(_that.message);case LogException() when log != null:
return log(_that.message);case OnboardingException() when onboarding != null:
return onboarding(_that.message);case HealthException() when health != null:
return health(_that.message);case NoDataException() when noData != null:
return noData(_that.message);case PermissionException() when permission != null:
return permission(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class AuthException extends AppException {
  const AuthException(this.message): super._();
  

@override final  String? message;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthExceptionCopyWith<AuthException> get copyWith => _$AuthExceptionCopyWithImpl<AuthException>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthException&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AppException.auth(message: $message)';
}


}

/// @nodoc
abstract mixin class $AuthExceptionCopyWith<$Res> implements $AppExceptionCopyWith<$Res> {
  factory $AuthExceptionCopyWith(AuthException value, $Res Function(AuthException) _then) = _$AuthExceptionCopyWithImpl;
@override @useResult
$Res call({
 String? message
});




}
/// @nodoc
class _$AuthExceptionCopyWithImpl<$Res>
    implements $AuthExceptionCopyWith<$Res> {
  _$AuthExceptionCopyWithImpl(this._self, this._then);

  final AuthException _self;
  final $Res Function(AuthException) _then;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(AuthException(
freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class NetworkException extends AppException {
  const NetworkException(this.message): super._();
  

@override final  String? message;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NetworkExceptionCopyWith<NetworkException> get copyWith => _$NetworkExceptionCopyWithImpl<NetworkException>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NetworkException&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AppException.network(message: $message)';
}


}

/// @nodoc
abstract mixin class $NetworkExceptionCopyWith<$Res> implements $AppExceptionCopyWith<$Res> {
  factory $NetworkExceptionCopyWith(NetworkException value, $Res Function(NetworkException) _then) = _$NetworkExceptionCopyWithImpl;
@override @useResult
$Res call({
 String? message
});




}
/// @nodoc
class _$NetworkExceptionCopyWithImpl<$Res>
    implements $NetworkExceptionCopyWith<$Res> {
  _$NetworkExceptionCopyWithImpl(this._self, this._then);

  final NetworkException _self;
  final $Res Function(NetworkException) _then;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(NetworkException(
freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class OrderException extends AppException {
  const OrderException(this.message): super._();
  

@override final  String? message;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderExceptionCopyWith<OrderException> get copyWith => _$OrderExceptionCopyWithImpl<OrderException>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderException&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AppException.order(message: $message)';
}


}

/// @nodoc
abstract mixin class $OrderExceptionCopyWith<$Res> implements $AppExceptionCopyWith<$Res> {
  factory $OrderExceptionCopyWith(OrderException value, $Res Function(OrderException) _then) = _$OrderExceptionCopyWithImpl;
@override @useResult
$Res call({
 String? message
});




}
/// @nodoc
class _$OrderExceptionCopyWithImpl<$Res>
    implements $OrderExceptionCopyWith<$Res> {
  _$OrderExceptionCopyWithImpl(this._self, this._then);

  final OrderException _self;
  final $Res Function(OrderException) _then;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(OrderException(
freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class WorkoutException extends AppException {
  const WorkoutException(this.message): super._();
  

@override final  String? message;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkoutExceptionCopyWith<WorkoutException> get copyWith => _$WorkoutExceptionCopyWithImpl<WorkoutException>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkoutException&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AppException.workout(message: $message)';
}


}

/// @nodoc
abstract mixin class $WorkoutExceptionCopyWith<$Res> implements $AppExceptionCopyWith<$Res> {
  factory $WorkoutExceptionCopyWith(WorkoutException value, $Res Function(WorkoutException) _then) = _$WorkoutExceptionCopyWithImpl;
@override @useResult
$Res call({
 String? message
});




}
/// @nodoc
class _$WorkoutExceptionCopyWithImpl<$Res>
    implements $WorkoutExceptionCopyWith<$Res> {
  _$WorkoutExceptionCopyWithImpl(this._self, this._then);

  final WorkoutException _self;
  final $Res Function(WorkoutException) _then;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(WorkoutException(
freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class HomeException extends AppException {
  const HomeException(this.message): super._();
  

@override final  String? message;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeExceptionCopyWith<HomeException> get copyWith => _$HomeExceptionCopyWithImpl<HomeException>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeException&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AppException.home(message: $message)';
}


}

/// @nodoc
abstract mixin class $HomeExceptionCopyWith<$Res> implements $AppExceptionCopyWith<$Res> {
  factory $HomeExceptionCopyWith(HomeException value, $Res Function(HomeException) _then) = _$HomeExceptionCopyWithImpl;
@override @useResult
$Res call({
 String? message
});




}
/// @nodoc
class _$HomeExceptionCopyWithImpl<$Res>
    implements $HomeExceptionCopyWith<$Res> {
  _$HomeExceptionCopyWithImpl(this._self, this._then);

  final HomeException _self;
  final $Res Function(HomeException) _then;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(HomeException(
freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class LogException extends AppException {
  const LogException(this.message): super._();
  

@override final  String? message;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LogExceptionCopyWith<LogException> get copyWith => _$LogExceptionCopyWithImpl<LogException>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogException&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AppException.log(message: $message)';
}


}

/// @nodoc
abstract mixin class $LogExceptionCopyWith<$Res> implements $AppExceptionCopyWith<$Res> {
  factory $LogExceptionCopyWith(LogException value, $Res Function(LogException) _then) = _$LogExceptionCopyWithImpl;
@override @useResult
$Res call({
 String? message
});




}
/// @nodoc
class _$LogExceptionCopyWithImpl<$Res>
    implements $LogExceptionCopyWith<$Res> {
  _$LogExceptionCopyWithImpl(this._self, this._then);

  final LogException _self;
  final $Res Function(LogException) _then;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(LogException(
freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class OnboardingException extends AppException {
  const OnboardingException(this.message): super._();
  

@override final  String? message;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnboardingExceptionCopyWith<OnboardingException> get copyWith => _$OnboardingExceptionCopyWithImpl<OnboardingException>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingException&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AppException.onboarding(message: $message)';
}


}

/// @nodoc
abstract mixin class $OnboardingExceptionCopyWith<$Res> implements $AppExceptionCopyWith<$Res> {
  factory $OnboardingExceptionCopyWith(OnboardingException value, $Res Function(OnboardingException) _then) = _$OnboardingExceptionCopyWithImpl;
@override @useResult
$Res call({
 String? message
});




}
/// @nodoc
class _$OnboardingExceptionCopyWithImpl<$Res>
    implements $OnboardingExceptionCopyWith<$Res> {
  _$OnboardingExceptionCopyWithImpl(this._self, this._then);

  final OnboardingException _self;
  final $Res Function(OnboardingException) _then;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(OnboardingException(
freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class HealthException extends AppException {
  const HealthException(this.message): super._();
  

@override final  String? message;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HealthExceptionCopyWith<HealthException> get copyWith => _$HealthExceptionCopyWithImpl<HealthException>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HealthException&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AppException.health(message: $message)';
}


}

/// @nodoc
abstract mixin class $HealthExceptionCopyWith<$Res> implements $AppExceptionCopyWith<$Res> {
  factory $HealthExceptionCopyWith(HealthException value, $Res Function(HealthException) _then) = _$HealthExceptionCopyWithImpl;
@override @useResult
$Res call({
 String? message
});




}
/// @nodoc
class _$HealthExceptionCopyWithImpl<$Res>
    implements $HealthExceptionCopyWith<$Res> {
  _$HealthExceptionCopyWithImpl(this._self, this._then);

  final HealthException _self;
  final $Res Function(HealthException) _then;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(HealthException(
freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class NoDataException extends AppException {
  const NoDataException(this.message): super._();
  

@override final  String? message;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NoDataExceptionCopyWith<NoDataException> get copyWith => _$NoDataExceptionCopyWithImpl<NoDataException>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NoDataException&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AppException.noData(message: $message)';
}


}

/// @nodoc
abstract mixin class $NoDataExceptionCopyWith<$Res> implements $AppExceptionCopyWith<$Res> {
  factory $NoDataExceptionCopyWith(NoDataException value, $Res Function(NoDataException) _then) = _$NoDataExceptionCopyWithImpl;
@override @useResult
$Res call({
 String? message
});




}
/// @nodoc
class _$NoDataExceptionCopyWithImpl<$Res>
    implements $NoDataExceptionCopyWith<$Res> {
  _$NoDataExceptionCopyWithImpl(this._self, this._then);

  final NoDataException _self;
  final $Res Function(NoDataException) _then;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(NoDataException(
freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class PermissionException extends AppException {
  const PermissionException(this.message): super._();
  

@override final  String? message;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PermissionExceptionCopyWith<PermissionException> get copyWith => _$PermissionExceptionCopyWithImpl<PermissionException>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PermissionException&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AppException.permission(message: $message)';
}


}

/// @nodoc
abstract mixin class $PermissionExceptionCopyWith<$Res> implements $AppExceptionCopyWith<$Res> {
  factory $PermissionExceptionCopyWith(PermissionException value, $Res Function(PermissionException) _then) = _$PermissionExceptionCopyWithImpl;
@override @useResult
$Res call({
 String? message
});




}
/// @nodoc
class _$PermissionExceptionCopyWithImpl<$Res>
    implements $PermissionExceptionCopyWith<$Res> {
  _$PermissionExceptionCopyWithImpl(this._self, this._then);

  final PermissionException _self;
  final $Res Function(PermissionException) _then;

/// Create a copy of AppException
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(PermissionException(
freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
