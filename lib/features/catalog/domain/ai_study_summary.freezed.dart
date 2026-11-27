// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_study_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AiStudySummary {

 String get isbn; String get bookTitle; String get topic; String get summary; List<String> get keyConcepts; String get syllabusRelevance; DateTime get generatedAt;
/// Create a copy of AiStudySummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AiStudySummaryCopyWith<AiStudySummary> get copyWith => _$AiStudySummaryCopyWithImpl<AiStudySummary>(this as AiStudySummary, _$identity);

  /// Serializes this AiStudySummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AiStudySummary;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AiStudySummary&&(identical(other.isbn, _this.isbn) || other.isbn == _this.isbn)&&(identical(other.bookTitle, _this.bookTitle) || other.bookTitle == _this.bookTitle)&&(identical(other.topic, _this.topic) || other.topic == _this.topic)&&(identical(other.summary, _this.summary) || other.summary == _this.summary)&&const DeepCollectionEquality().equals(other.keyConcepts, _this.keyConcepts)&&(identical(other.syllabusRelevance, _this.syllabusRelevance) || other.syllabusRelevance == _this.syllabusRelevance)&&(identical(other.generatedAt, _this.generatedAt) || other.generatedAt == _this.generatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AiStudySummary;
  return Object.hash(runtimeType,_this.isbn,_this.bookTitle,_this.topic,_this.summary,const DeepCollectionEquality().hash(_this.keyConcepts),_this.syllabusRelevance,_this.generatedAt);
}

@override
String toString() {
  final _this = this as AiStudySummary;
  return 'AiStudySummary(isbn: ${_this.isbn}, bookTitle: ${_this.bookTitle}, topic: ${_this.topic}, summary: ${_this.summary}, keyConcepts: ${_this.keyConcepts}, syllabusRelevance: ${_this.syllabusRelevance}, generatedAt: ${_this.generatedAt})';
}


}

/// @nodoc
abstract mixin class $AiStudySummaryCopyWith<$Res>  {
  factory $AiStudySummaryCopyWith(AiStudySummary value, $Res Function(AiStudySummary) _then) = _$AiStudySummaryCopyWithImpl;
@useResult
$Res call({
 String isbn, String bookTitle, String topic, String summary, List<String> keyConcepts, String syllabusRelevance, DateTime generatedAt
});




}
/// @nodoc
class _$AiStudySummaryCopyWithImpl<$Res>
    implements $AiStudySummaryCopyWith<$Res> {
  _$AiStudySummaryCopyWithImpl(this._self, this._then);

  final AiStudySummary _self;
  final $Res Function(AiStudySummary) _then;

/// Create a copy of AiStudySummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isbn = null,Object? bookTitle = null,Object? topic = null,Object? summary = null,Object? keyConcepts = null,Object? syllabusRelevance = null,Object? generatedAt = null,}) {
  return _then(AiStudySummary(
isbn: null == isbn ? _self.isbn : isbn // ignore: cast_nullable_to_non_nullable
as String,bookTitle: null == bookTitle ? _self.bookTitle : bookTitle // ignore: cast_nullable_to_non_nullable
as String,topic: null == topic ? _self.topic : topic // ignore: cast_nullable_to_non_nullable
as String,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String,keyConcepts: null == keyConcepts ? _self.keyConcepts : keyConcepts // ignore: cast_nullable_to_non_nullable
as List<String>,syllabusRelevance: null == syllabusRelevance ? _self.syllabusRelevance : syllabusRelevance // ignore: cast_nullable_to_non_nullable
as String,generatedAt: null == generatedAt ? _self.generatedAt : generatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [AiStudySummary].
extension AiStudySummaryPatterns on AiStudySummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AiStudySummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AiStudySummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AiStudySummary value)  $default,){
final _that = this;
switch (_that) {
case _AiStudySummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AiStudySummary value)?  $default,){
final _that = this;
switch (_that) {
case _AiStudySummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String isbn,  String bookTitle,  String topic,  String summary,  List<String> keyConcepts,  String syllabusRelevance,  DateTime generatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AiStudySummary() when $default != null:
return $default(_that.isbn,_that.bookTitle,_that.topic,_that.summary,_that.keyConcepts,_that.syllabusRelevance,_that.generatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String isbn,  String bookTitle,  String topic,  String summary,  List<String> keyConcepts,  String syllabusRelevance,  DateTime generatedAt)  $default,) {final _that = this;
switch (_that) {
case _AiStudySummary():
return $default(_that.isbn,_that.bookTitle,_that.topic,_that.summary,_that.keyConcepts,_that.syllabusRelevance,_that.generatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String isbn,  String bookTitle,  String topic,  String summary,  List<String> keyConcepts,  String syllabusRelevance,  DateTime generatedAt)?  $default,) {final _that = this;
switch (_that) {
case _AiStudySummary() when $default != null:
return $default(_that.isbn,_that.bookTitle,_that.topic,_that.summary,_that.keyConcepts,_that.syllabusRelevance,_that.generatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AiStudySummary extends AiStudySummary {
  const _AiStudySummary({required this.isbn, required this.bookTitle, required this.topic, required this.summary, required  List<String> keyConcepts, required this.syllabusRelevance, required this.generatedAt}): _keyConcepts = keyConcepts,super._();
  factory _AiStudySummary.fromJson(Map<String, dynamic> json) => _$AiStudySummaryFromJson(json);

@override final  String isbn;
@override final  String bookTitle;
@override final  String topic;
@override final  String summary;
 final  List<String> _keyConcepts;
@override List<String> get keyConcepts {
  if (_keyConcepts is EqualUnmodifiableListView) return _keyConcepts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_keyConcepts);
}

@override final  String syllabusRelevance;
@override final  DateTime generatedAt;

/// Create a copy of AiStudySummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AiStudySummaryCopyWith<_AiStudySummary> get copyWith => __$AiStudySummaryCopyWithImpl<_AiStudySummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AiStudySummaryToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AiStudySummary&&(identical(other.isbn, isbn) || other.isbn == isbn)&&(identical(other.bookTitle, bookTitle) || other.bookTitle == bookTitle)&&(identical(other.topic, topic) || other.topic == topic)&&(identical(other.summary, summary) || other.summary == summary)&&const DeepCollectionEquality().equals(other.keyConcepts, _keyConcepts)&&(identical(other.syllabusRelevance, syllabusRelevance) || other.syllabusRelevance == syllabusRelevance)&&(identical(other.generatedAt, generatedAt) || other.generatedAt == generatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,isbn,bookTitle,topic,summary,const DeepCollectionEquality().hash(_keyConcepts),syllabusRelevance,generatedAt);
}

@override
String toString() {
    return 'AiStudySummary(isbn: $isbn, bookTitle: $bookTitle, topic: $topic, summary: $summary, keyConcepts: $keyConcepts, syllabusRelevance: $syllabusRelevance, generatedAt: $generatedAt)';
}


}

/// @nodoc
abstract mixin class _$AiStudySummaryCopyWith<$Res> implements $AiStudySummaryCopyWith<$Res> {
  factory _$AiStudySummaryCopyWith(_AiStudySummary value, $Res Function(_AiStudySummary) _then) = __$AiStudySummaryCopyWithImpl;
@override @useResult
$Res call({
 String isbn, String bookTitle, String topic, String summary, List<String> keyConcepts, String syllabusRelevance, DateTime generatedAt
});




}
/// @nodoc
class __$AiStudySummaryCopyWithImpl<$Res>
    implements _$AiStudySummaryCopyWith<$Res> {
  __$AiStudySummaryCopyWithImpl(this._self, this._then);

  final _AiStudySummary _self;
  final $Res Function(_AiStudySummary) _then;

/// Create a copy of AiStudySummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isbn = null,Object? bookTitle = null,Object? topic = null,Object? summary = null,Object? keyConcepts = null,Object? syllabusRelevance = null,Object? generatedAt = null,}) {
  return _then(_AiStudySummary(
isbn: null == isbn ? _self.isbn : isbn // ignore: cast_nullable_to_non_nullable
as String,bookTitle: null == bookTitle ? _self.bookTitle : bookTitle // ignore: cast_nullable_to_non_nullable
as String,topic: null == topic ? _self.topic : topic // ignore: cast_nullable_to_non_nullable
as String,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String,keyConcepts: null == keyConcepts ? _self._keyConcepts : keyConcepts // ignore: cast_nullable_to_non_nullable
as List<String>,syllabusRelevance: null == syllabusRelevance ? _self.syllabusRelevance : syllabusRelevance // ignore: cast_nullable_to_non_nullable
as String,generatedAt: null == generatedAt ? _self.generatedAt : generatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
