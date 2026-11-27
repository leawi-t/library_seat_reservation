// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scanner_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ScannerState {

 ScannerMode get mode; CameraPermissionStatus get permission; String? get errorMessage;
/// Create a copy of ScannerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScannerStateCopyWith<ScannerState> get copyWith => _$ScannerStateCopyWithImpl<ScannerState>(this as ScannerState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ScannerState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScannerState&&(identical(other.mode, _this.mode) || other.mode == _this.mode)&&(identical(other.permission, _this.permission) || other.permission == _this.permission)&&(identical(other.errorMessage, _this.errorMessage) || other.errorMessage == _this.errorMessage));
}


@override
int get hashCode {
  final _this = this as ScannerState;
  return Object.hash(runtimeType,_this.mode,_this.permission,_this.errorMessage);
}

@override
String toString() {
  final _this = this as ScannerState;
  return 'ScannerState(mode: ${_this.mode}, permission: ${_this.permission}, errorMessage: ${_this.errorMessage})';
}


}

/// @nodoc
abstract mixin class $ScannerStateCopyWith<$Res>  {
  factory $ScannerStateCopyWith(ScannerState value, $Res Function(ScannerState) _then) = _$ScannerStateCopyWithImpl;
@useResult
$Res call({
 ScannerMode mode, CameraPermissionStatus permission, String? errorMessage
});




}
/// @nodoc
class _$ScannerStateCopyWithImpl<$Res>
    implements $ScannerStateCopyWith<$Res> {
  _$ScannerStateCopyWithImpl(this._self, this._then);

  final ScannerState _self;
  final $Res Function(ScannerState) _then;

/// Create a copy of ScannerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mode = null,Object? permission = null,Object? errorMessage = freezed,}) {
  return _then(ScannerState(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as ScannerMode,permission: null == permission ? _self.permission : permission // ignore: cast_nullable_to_non_nullable
as CameraPermissionStatus,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ScannerState].
extension ScannerStatePatterns on ScannerState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScannerState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScannerState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScannerState value)  $default,){
final _that = this;
switch (_that) {
case _ScannerState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScannerState value)?  $default,){
final _that = this;
switch (_that) {
case _ScannerState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ScannerMode mode,  CameraPermissionStatus permission,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScannerState() when $default != null:
return $default(_that.mode,_that.permission,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ScannerMode mode,  CameraPermissionStatus permission,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _ScannerState():
return $default(_that.mode,_that.permission,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ScannerMode mode,  CameraPermissionStatus permission,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _ScannerState() when $default != null:
return $default(_that.mode,_that.permission,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _ScannerState implements ScannerState {
  const _ScannerState({required this.mode, required this.permission, this.errorMessage});
  

@override final  ScannerMode mode;
@override final  CameraPermissionStatus permission;
@override final  String? errorMessage;

/// Create a copy of ScannerState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScannerStateCopyWith<_ScannerState> get copyWith => __$ScannerStateCopyWithImpl<_ScannerState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScannerState&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.permission, permission) || other.permission == permission)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode {
    return Object.hash(runtimeType,mode,permission,errorMessage);
}

@override
String toString() {
    return 'ScannerState(mode: $mode, permission: $permission, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$ScannerStateCopyWith<$Res> implements $ScannerStateCopyWith<$Res> {
  factory _$ScannerStateCopyWith(_ScannerState value, $Res Function(_ScannerState) _then) = __$ScannerStateCopyWithImpl;
@override @useResult
$Res call({
 ScannerMode mode, CameraPermissionStatus permission, String? errorMessage
});




}
/// @nodoc
class __$ScannerStateCopyWithImpl<$Res>
    implements _$ScannerStateCopyWith<$Res> {
  __$ScannerStateCopyWithImpl(this._self, this._then);

  final _ScannerState _self;
  final $Res Function(_ScannerState) _then;

/// Create a copy of ScannerState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mode = null,Object? permission = null,Object? errorMessage = freezed,}) {
  return _then(_ScannerState(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as ScannerMode,permission: null == permission ? _self.permission : permission // ignore: cast_nullable_to_non_nullable
as CameraPermissionStatus,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
