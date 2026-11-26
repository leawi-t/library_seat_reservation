// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_draft.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BookingDraft {

 DateTime get startTime; int get durationHours; bool get reminderEnabled;
/// Create a copy of BookingDraft
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingDraftCopyWith<BookingDraft> get copyWith => _$BookingDraftCopyWithImpl<BookingDraft>(this as BookingDraft, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as BookingDraft;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingDraft&&(identical(other.startTime, _this.startTime) || other.startTime == _this.startTime)&&(identical(other.durationHours, _this.durationHours) || other.durationHours == _this.durationHours)&&(identical(other.reminderEnabled, _this.reminderEnabled) || other.reminderEnabled == _this.reminderEnabled));
}


@override
int get hashCode {
  final _this = this as BookingDraft;
  return Object.hash(runtimeType,_this.startTime,_this.durationHours,_this.reminderEnabled);
}

@override
String toString() {
  final _this = this as BookingDraft;
  return 'BookingDraft(startTime: ${_this.startTime}, durationHours: ${_this.durationHours}, reminderEnabled: ${_this.reminderEnabled})';
}


}

/// @nodoc
abstract mixin class $BookingDraftCopyWith<$Res>  {
  factory $BookingDraftCopyWith(BookingDraft value, $Res Function(BookingDraft) _then) = _$BookingDraftCopyWithImpl;
@useResult
$Res call({
 DateTime startTime, int durationHours, bool reminderEnabled
});




}
/// @nodoc
class _$BookingDraftCopyWithImpl<$Res>
    implements $BookingDraftCopyWith<$Res> {
  _$BookingDraftCopyWithImpl(this._self, this._then);

  final BookingDraft _self;
  final $Res Function(BookingDraft) _then;

/// Create a copy of BookingDraft
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? startTime = null,Object? durationHours = null,Object? reminderEnabled = null,}) {
  return _then(BookingDraft(
startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime,durationHours: null == durationHours ? _self.durationHours : durationHours // ignore: cast_nullable_to_non_nullable
as int,reminderEnabled: null == reminderEnabled ? _self.reminderEnabled : reminderEnabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [BookingDraft].
extension BookingDraftPatterns on BookingDraft {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookingDraft value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookingDraft() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookingDraft value)  $default,){
final _that = this;
switch (_that) {
case _BookingDraft():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookingDraft value)?  $default,){
final _that = this;
switch (_that) {
case _BookingDraft() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime startTime,  int durationHours,  bool reminderEnabled)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookingDraft() when $default != null:
return $default(_that.startTime,_that.durationHours,_that.reminderEnabled);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime startTime,  int durationHours,  bool reminderEnabled)  $default,) {final _that = this;
switch (_that) {
case _BookingDraft():
return $default(_that.startTime,_that.durationHours,_that.reminderEnabled);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime startTime,  int durationHours,  bool reminderEnabled)?  $default,) {final _that = this;
switch (_that) {
case _BookingDraft() when $default != null:
return $default(_that.startTime,_that.durationHours,_that.reminderEnabled);case _:
  return null;

}
}

}

/// @nodoc


class _BookingDraft extends BookingDraft {
  const _BookingDraft({required this.startTime, this.durationHours = 2, this.reminderEnabled = true}): super._();
  

@override final  DateTime startTime;
@override@JsonKey() final  int durationHours;
@override@JsonKey() final  bool reminderEnabled;

/// Create a copy of BookingDraft
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingDraftCopyWith<_BookingDraft> get copyWith => __$BookingDraftCopyWithImpl<_BookingDraft>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingDraft&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.durationHours, durationHours) || other.durationHours == durationHours)&&(identical(other.reminderEnabled, reminderEnabled) || other.reminderEnabled == reminderEnabled));
}


@override
int get hashCode {
    return Object.hash(runtimeType,startTime,durationHours,reminderEnabled);
}

@override
String toString() {
    return 'BookingDraft(startTime: $startTime, durationHours: $durationHours, reminderEnabled: $reminderEnabled)';
}


}

/// @nodoc
abstract mixin class _$BookingDraftCopyWith<$Res> implements $BookingDraftCopyWith<$Res> {
  factory _$BookingDraftCopyWith(_BookingDraft value, $Res Function(_BookingDraft) _then) = __$BookingDraftCopyWithImpl;
@override @useResult
$Res call({
 DateTime startTime, int durationHours, bool reminderEnabled
});




}
/// @nodoc
class __$BookingDraftCopyWithImpl<$Res>
    implements _$BookingDraftCopyWith<$Res> {
  __$BookingDraftCopyWithImpl(this._self, this._then);

  final _BookingDraft _self;
  final $Res Function(_BookingDraft) _then;

/// Create a copy of BookingDraft
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? startTime = null,Object? durationHours = null,Object? reminderEnabled = null,}) {
  return _then(_BookingDraft(
startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime,durationHours: null == durationHours ? _self.durationHours : durationHours // ignore: cast_nullable_to_non_nullable
as int,reminderEnabled: null == reminderEnabled ? _self.reminderEnabled : reminderEnabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
