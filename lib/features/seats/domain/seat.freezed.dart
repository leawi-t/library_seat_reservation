// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seat.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Seat {

 String get id; String get code; String get floorArea; bool get hasPowerOutlet; bool get isQuietZone; bool get isAvailable; String? get currentReservationId;
/// Create a copy of Seat
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeatCopyWith<Seat> get copyWith => _$SeatCopyWithImpl<Seat>(this as Seat, _$identity);

  /// Serializes this Seat to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Seat;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Seat&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.code, _this.code) || other.code == _this.code)&&(identical(other.floorArea, _this.floorArea) || other.floorArea == _this.floorArea)&&(identical(other.hasPowerOutlet, _this.hasPowerOutlet) || other.hasPowerOutlet == _this.hasPowerOutlet)&&(identical(other.isQuietZone, _this.isQuietZone) || other.isQuietZone == _this.isQuietZone)&&(identical(other.isAvailable, _this.isAvailable) || other.isAvailable == _this.isAvailable)&&(identical(other.currentReservationId, _this.currentReservationId) || other.currentReservationId == _this.currentReservationId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Seat;
  return Object.hash(runtimeType,_this.id,_this.code,_this.floorArea,_this.hasPowerOutlet,_this.isQuietZone,_this.isAvailable,_this.currentReservationId);
}

@override
String toString() {
  final _this = this as Seat;
  return 'Seat(id: ${_this.id}, code: ${_this.code}, floorArea: ${_this.floorArea}, hasPowerOutlet: ${_this.hasPowerOutlet}, isQuietZone: ${_this.isQuietZone}, isAvailable: ${_this.isAvailable}, currentReservationId: ${_this.currentReservationId})';
}


}

/// @nodoc
abstract mixin class $SeatCopyWith<$Res>  {
  factory $SeatCopyWith(Seat value, $Res Function(Seat) _then) = _$SeatCopyWithImpl;
@useResult
$Res call({
 String id, String code, String floorArea, bool hasPowerOutlet, bool isQuietZone, bool isAvailable, String? currentReservationId
});




}
/// @nodoc
class _$SeatCopyWithImpl<$Res>
    implements $SeatCopyWith<$Res> {
  _$SeatCopyWithImpl(this._self, this._then);

  final Seat _self;
  final $Res Function(Seat) _then;

/// Create a copy of Seat
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? code = null,Object? floorArea = null,Object? hasPowerOutlet = null,Object? isQuietZone = null,Object? isAvailable = null,Object? currentReservationId = freezed,}) {
  return _then(Seat(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,floorArea: null == floorArea ? _self.floorArea : floorArea // ignore: cast_nullable_to_non_nullable
as String,hasPowerOutlet: null == hasPowerOutlet ? _self.hasPowerOutlet : hasPowerOutlet // ignore: cast_nullable_to_non_nullable
as bool,isQuietZone: null == isQuietZone ? _self.isQuietZone : isQuietZone // ignore: cast_nullable_to_non_nullable
as bool,isAvailable: null == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool,currentReservationId: freezed == currentReservationId ? _self.currentReservationId : currentReservationId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Seat].
extension SeatPatterns on Seat {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Seat value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Seat() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Seat value)  $default,){
final _that = this;
switch (_that) {
case _Seat():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Seat value)?  $default,){
final _that = this;
switch (_that) {
case _Seat() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String code,  String floorArea,  bool hasPowerOutlet,  bool isQuietZone,  bool isAvailable,  String? currentReservationId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Seat() when $default != null:
return $default(_that.id,_that.code,_that.floorArea,_that.hasPowerOutlet,_that.isQuietZone,_that.isAvailable,_that.currentReservationId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String code,  String floorArea,  bool hasPowerOutlet,  bool isQuietZone,  bool isAvailable,  String? currentReservationId)  $default,) {final _that = this;
switch (_that) {
case _Seat():
return $default(_that.id,_that.code,_that.floorArea,_that.hasPowerOutlet,_that.isQuietZone,_that.isAvailable,_that.currentReservationId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String code,  String floorArea,  bool hasPowerOutlet,  bool isQuietZone,  bool isAvailable,  String? currentReservationId)?  $default,) {final _that = this;
switch (_that) {
case _Seat() when $default != null:
return $default(_that.id,_that.code,_that.floorArea,_that.hasPowerOutlet,_that.isQuietZone,_that.isAvailable,_that.currentReservationId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Seat implements Seat {
  const _Seat({required this.id, required this.code, required this.floorArea, required this.hasPowerOutlet, required this.isQuietZone, required this.isAvailable, this.currentReservationId});
  factory _Seat.fromJson(Map<String, dynamic> json) => _$SeatFromJson(json);

@override final  String id;
@override final  String code;
@override final  String floorArea;
@override final  bool hasPowerOutlet;
@override final  bool isQuietZone;
@override final  bool isAvailable;
@override final  String? currentReservationId;

/// Create a copy of Seat
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeatCopyWith<_Seat> get copyWith => __$SeatCopyWithImpl<_Seat>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SeatToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Seat&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.floorArea, floorArea) || other.floorArea == floorArea)&&(identical(other.hasPowerOutlet, hasPowerOutlet) || other.hasPowerOutlet == hasPowerOutlet)&&(identical(other.isQuietZone, isQuietZone) || other.isQuietZone == isQuietZone)&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable)&&(identical(other.currentReservationId, currentReservationId) || other.currentReservationId == currentReservationId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,code,floorArea,hasPowerOutlet,isQuietZone,isAvailable,currentReservationId);
}

@override
String toString() {
    return 'Seat(id: $id, code: $code, floorArea: $floorArea, hasPowerOutlet: $hasPowerOutlet, isQuietZone: $isQuietZone, isAvailable: $isAvailable, currentReservationId: $currentReservationId)';
}


}

/// @nodoc
abstract mixin class _$SeatCopyWith<$Res> implements $SeatCopyWith<$Res> {
  factory _$SeatCopyWith(_Seat value, $Res Function(_Seat) _then) = __$SeatCopyWithImpl;
@override @useResult
$Res call({
 String id, String code, String floorArea, bool hasPowerOutlet, bool isQuietZone, bool isAvailable, String? currentReservationId
});




}
/// @nodoc
class __$SeatCopyWithImpl<$Res>
    implements _$SeatCopyWith<$Res> {
  __$SeatCopyWithImpl(this._self, this._then);

  final _Seat _self;
  final $Res Function(_Seat) _then;

/// Create a copy of Seat
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? code = null,Object? floorArea = null,Object? hasPowerOutlet = null,Object? isQuietZone = null,Object? isAvailable = null,Object? currentReservationId = freezed,}) {
  return _then(_Seat(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,floorArea: null == floorArea ? _self.floorArea : floorArea // ignore: cast_nullable_to_non_nullable
as String,hasPowerOutlet: null == hasPowerOutlet ? _self.hasPowerOutlet : hasPowerOutlet // ignore: cast_nullable_to_non_nullable
as bool,isQuietZone: null == isQuietZone ? _self.isQuietZone : isQuietZone // ignore: cast_nullable_to_non_nullable
as bool,isAvailable: null == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool,currentReservationId: freezed == currentReservationId ? _self.currentReservationId : currentReservationId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
