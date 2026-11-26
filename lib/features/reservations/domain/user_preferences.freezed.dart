// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_preferences.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserPreferences {

 bool get hasGrantedAiConsent; int get reminderLeadMinutes;
/// Create a copy of UserPreferences
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserPreferencesCopyWith<UserPreferences> get copyWith => _$UserPreferencesCopyWithImpl<UserPreferences>(this as UserPreferences, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as UserPreferences;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserPreferences&&(identical(other.hasGrantedAiConsent, _this.hasGrantedAiConsent) || other.hasGrantedAiConsent == _this.hasGrantedAiConsent)&&(identical(other.reminderLeadMinutes, _this.reminderLeadMinutes) || other.reminderLeadMinutes == _this.reminderLeadMinutes));
}


@override
int get hashCode {
  final _this = this as UserPreferences;
  return Object.hash(runtimeType,_this.hasGrantedAiConsent,_this.reminderLeadMinutes);
}

@override
String toString() {
  final _this = this as UserPreferences;
  return 'UserPreferences(hasGrantedAiConsent: ${_this.hasGrantedAiConsent}, reminderLeadMinutes: ${_this.reminderLeadMinutes})';
}


}

/// @nodoc
abstract mixin class $UserPreferencesCopyWith<$Res>  {
  factory $UserPreferencesCopyWith(UserPreferences value, $Res Function(UserPreferences) _then) = _$UserPreferencesCopyWithImpl;
@useResult
$Res call({
 bool hasGrantedAiConsent, int reminderLeadMinutes
});




}
/// @nodoc
class _$UserPreferencesCopyWithImpl<$Res>
    implements $UserPreferencesCopyWith<$Res> {
  _$UserPreferencesCopyWithImpl(this._self, this._then);

  final UserPreferences _self;
  final $Res Function(UserPreferences) _then;

/// Create a copy of UserPreferences
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hasGrantedAiConsent = null,Object? reminderLeadMinutes = null,}) {
  return _then(UserPreferences(
hasGrantedAiConsent: null == hasGrantedAiConsent ? _self.hasGrantedAiConsent : hasGrantedAiConsent // ignore: cast_nullable_to_non_nullable
as bool,reminderLeadMinutes: null == reminderLeadMinutes ? _self.reminderLeadMinutes : reminderLeadMinutes // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [UserPreferences].
extension UserPreferencesPatterns on UserPreferences {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserPreferences value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserPreferences() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserPreferences value)  $default,){
final _that = this;
switch (_that) {
case _UserPreferences():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserPreferences value)?  $default,){
final _that = this;
switch (_that) {
case _UserPreferences() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool hasGrantedAiConsent,  int reminderLeadMinutes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserPreferences() when $default != null:
return $default(_that.hasGrantedAiConsent,_that.reminderLeadMinutes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool hasGrantedAiConsent,  int reminderLeadMinutes)  $default,) {final _that = this;
switch (_that) {
case _UserPreferences():
return $default(_that.hasGrantedAiConsent,_that.reminderLeadMinutes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool hasGrantedAiConsent,  int reminderLeadMinutes)?  $default,) {final _that = this;
switch (_that) {
case _UserPreferences() when $default != null:
return $default(_that.hasGrantedAiConsent,_that.reminderLeadMinutes);case _:
  return null;

}
}

}

/// @nodoc


class _UserPreferences extends UserPreferences {
  const _UserPreferences({this.hasGrantedAiConsent = false, this.reminderLeadMinutes = 10}): super._();
  

@override@JsonKey() final  bool hasGrantedAiConsent;
@override@JsonKey() final  int reminderLeadMinutes;

/// Create a copy of UserPreferences
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserPreferencesCopyWith<_UserPreferences> get copyWith => __$UserPreferencesCopyWithImpl<_UserPreferences>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserPreferences&&(identical(other.hasGrantedAiConsent, hasGrantedAiConsent) || other.hasGrantedAiConsent == hasGrantedAiConsent)&&(identical(other.reminderLeadMinutes, reminderLeadMinutes) || other.reminderLeadMinutes == reminderLeadMinutes));
}


@override
int get hashCode {
    return Object.hash(runtimeType,hasGrantedAiConsent,reminderLeadMinutes);
}

@override
String toString() {
    return 'UserPreferences(hasGrantedAiConsent: $hasGrantedAiConsent, reminderLeadMinutes: $reminderLeadMinutes)';
}


}

/// @nodoc
abstract mixin class _$UserPreferencesCopyWith<$Res> implements $UserPreferencesCopyWith<$Res> {
  factory _$UserPreferencesCopyWith(_UserPreferences value, $Res Function(_UserPreferences) _then) = __$UserPreferencesCopyWithImpl;
@override @useResult
$Res call({
 bool hasGrantedAiConsent, int reminderLeadMinutes
});




}
/// @nodoc
class __$UserPreferencesCopyWithImpl<$Res>
    implements _$UserPreferencesCopyWith<$Res> {
  __$UserPreferencesCopyWithImpl(this._self, this._then);

  final _UserPreferences _self;
  final $Res Function(_UserPreferences) _then;

/// Create a copy of UserPreferences
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hasGrantedAiConsent = null,Object? reminderLeadMinutes = null,}) {
  return _then(_UserPreferences(
hasGrantedAiConsent: null == hasGrantedAiConsent ? _self.hasGrantedAiConsent : hasGrantedAiConsent // ignore: cast_nullable_to_non_nullable
as bool,reminderLeadMinutes: null == reminderLeadMinutes ? _self.reminderLeadMinutes : reminderLeadMinutes // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
