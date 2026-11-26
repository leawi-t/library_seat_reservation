// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reservation_countdown.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ReservationCountdown {

 Duration get remaining; Duration get total;
/// Create a copy of ReservationCountdown
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReservationCountdownCopyWith<ReservationCountdown> get copyWith => _$ReservationCountdownCopyWithImpl<ReservationCountdown>(this as ReservationCountdown, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ReservationCountdown;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReservationCountdown&&(identical(other.remaining, _this.remaining) || other.remaining == _this.remaining)&&(identical(other.total, _this.total) || other.total == _this.total));
}


@override
int get hashCode {
  final _this = this as ReservationCountdown;
  return Object.hash(runtimeType,_this.remaining,_this.total);
}

@override
String toString() {
  final _this = this as ReservationCountdown;
  return 'ReservationCountdown(remaining: ${_this.remaining}, total: ${_this.total})';
}


}

/// @nodoc
abstract mixin class $ReservationCountdownCopyWith<$Res>  {
  factory $ReservationCountdownCopyWith(ReservationCountdown value, $Res Function(ReservationCountdown) _then) = _$ReservationCountdownCopyWithImpl;
@useResult
$Res call({
 Duration remaining, Duration total
});




}
/// @nodoc
class _$ReservationCountdownCopyWithImpl<$Res>
    implements $ReservationCountdownCopyWith<$Res> {
  _$ReservationCountdownCopyWithImpl(this._self, this._then);

  final ReservationCountdown _self;
  final $Res Function(ReservationCountdown) _then;

/// Create a copy of ReservationCountdown
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? remaining = null,Object? total = null,}) {
  return _then(ReservationCountdown(
remaining: null == remaining ? _self.remaining : remaining // ignore: cast_nullable_to_non_nullable
as Duration,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}

}


/// Adds pattern-matching-related methods to [ReservationCountdown].
extension ReservationCountdownPatterns on ReservationCountdown {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReservationCountdown value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReservationCountdown() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReservationCountdown value)  $default,){
final _that = this;
switch (_that) {
case _ReservationCountdown():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReservationCountdown value)?  $default,){
final _that = this;
switch (_that) {
case _ReservationCountdown() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Duration remaining,  Duration total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReservationCountdown() when $default != null:
return $default(_that.remaining,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Duration remaining,  Duration total)  $default,) {final _that = this;
switch (_that) {
case _ReservationCountdown():
return $default(_that.remaining,_that.total);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Duration remaining,  Duration total)?  $default,) {final _that = this;
switch (_that) {
case _ReservationCountdown() when $default != null:
return $default(_that.remaining,_that.total);case _:
  return null;

}
}

}

/// @nodoc


class _ReservationCountdown extends ReservationCountdown {
  const _ReservationCountdown({required this.remaining, required this.total}): super._();
  

@override final  Duration remaining;
@override final  Duration total;

/// Create a copy of ReservationCountdown
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReservationCountdownCopyWith<_ReservationCountdown> get copyWith => __$ReservationCountdownCopyWithImpl<_ReservationCountdown>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReservationCountdown&&(identical(other.remaining, remaining) || other.remaining == remaining)&&(identical(other.total, total) || other.total == total));
}


@override
int get hashCode {
    return Object.hash(runtimeType,remaining,total);
}

@override
String toString() {
    return 'ReservationCountdown(remaining: $remaining, total: $total)';
}


}

/// @nodoc
abstract mixin class _$ReservationCountdownCopyWith<$Res> implements $ReservationCountdownCopyWith<$Res> {
  factory _$ReservationCountdownCopyWith(_ReservationCountdown value, $Res Function(_ReservationCountdown) _then) = __$ReservationCountdownCopyWithImpl;
@override @useResult
$Res call({
 Duration remaining, Duration total
});




}
/// @nodoc
class __$ReservationCountdownCopyWithImpl<$Res>
    implements _$ReservationCountdownCopyWith<$Res> {
  __$ReservationCountdownCopyWithImpl(this._self, this._then);

  final _ReservationCountdown _self;
  final $Res Function(_ReservationCountdown) _then;

/// Create a copy of ReservationCountdown
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? remaining = null,Object? total = null,}) {
  return _then(_ReservationCountdown(
remaining: null == remaining ? _self.remaining : remaining // ignore: cast_nullable_to_non_nullable
as Duration,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}


}

// dart format on
