// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'study_note.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StudyNote {

 String get id; String get userId; String get isbn; String get bookTitle; String get studyTopicQuery; String get aiSummaryMarkdown; DateTime get createdAt;
/// Create a copy of StudyNote
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StudyNoteCopyWith<StudyNote> get copyWith => _$StudyNoteCopyWithImpl<StudyNote>(this as StudyNote, _$identity);

  /// Serializes this StudyNote to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as StudyNote;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StudyNote&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.userId, _this.userId) || other.userId == _this.userId)&&(identical(other.isbn, _this.isbn) || other.isbn == _this.isbn)&&(identical(other.bookTitle, _this.bookTitle) || other.bookTitle == _this.bookTitle)&&(identical(other.studyTopicQuery, _this.studyTopicQuery) || other.studyTopicQuery == _this.studyTopicQuery)&&(identical(other.aiSummaryMarkdown, _this.aiSummaryMarkdown) || other.aiSummaryMarkdown == _this.aiSummaryMarkdown)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as StudyNote;
  return Object.hash(runtimeType,_this.id,_this.userId,_this.isbn,_this.bookTitle,_this.studyTopicQuery,_this.aiSummaryMarkdown,_this.createdAt);
}

@override
String toString() {
  final _this = this as StudyNote;
  return 'StudyNote(id: ${_this.id}, userId: ${_this.userId}, isbn: ${_this.isbn}, bookTitle: ${_this.bookTitle}, studyTopicQuery: ${_this.studyTopicQuery}, aiSummaryMarkdown: ${_this.aiSummaryMarkdown}, createdAt: ${_this.createdAt})';
}


}

/// @nodoc
abstract mixin class $StudyNoteCopyWith<$Res>  {
  factory $StudyNoteCopyWith(StudyNote value, $Res Function(StudyNote) _then) = _$StudyNoteCopyWithImpl;
@useResult
$Res call({
 String id, String userId, String isbn, String bookTitle, String studyTopicQuery, String aiSummaryMarkdown, DateTime createdAt
});




}
/// @nodoc
class _$StudyNoteCopyWithImpl<$Res>
    implements $StudyNoteCopyWith<$Res> {
  _$StudyNoteCopyWithImpl(this._self, this._then);

  final StudyNote _self;
  final $Res Function(StudyNote) _then;

/// Create a copy of StudyNote
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? isbn = null,Object? bookTitle = null,Object? studyTopicQuery = null,Object? aiSummaryMarkdown = null,Object? createdAt = null,}) {
  return _then(StudyNote(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,isbn: null == isbn ? _self.isbn : isbn // ignore: cast_nullable_to_non_nullable
as String,bookTitle: null == bookTitle ? _self.bookTitle : bookTitle // ignore: cast_nullable_to_non_nullable
as String,studyTopicQuery: null == studyTopicQuery ? _self.studyTopicQuery : studyTopicQuery // ignore: cast_nullable_to_non_nullable
as String,aiSummaryMarkdown: null == aiSummaryMarkdown ? _self.aiSummaryMarkdown : aiSummaryMarkdown // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [StudyNote].
extension StudyNotePatterns on StudyNote {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StudyNote value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StudyNote() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StudyNote value)  $default,){
final _that = this;
switch (_that) {
case _StudyNote():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StudyNote value)?  $default,){
final _that = this;
switch (_that) {
case _StudyNote() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  String isbn,  String bookTitle,  String studyTopicQuery,  String aiSummaryMarkdown,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StudyNote() when $default != null:
return $default(_that.id,_that.userId,_that.isbn,_that.bookTitle,_that.studyTopicQuery,_that.aiSummaryMarkdown,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  String isbn,  String bookTitle,  String studyTopicQuery,  String aiSummaryMarkdown,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _StudyNote():
return $default(_that.id,_that.userId,_that.isbn,_that.bookTitle,_that.studyTopicQuery,_that.aiSummaryMarkdown,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  String isbn,  String bookTitle,  String studyTopicQuery,  String aiSummaryMarkdown,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _StudyNote() when $default != null:
return $default(_that.id,_that.userId,_that.isbn,_that.bookTitle,_that.studyTopicQuery,_that.aiSummaryMarkdown,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StudyNote extends StudyNote {
  const _StudyNote({required this.id, required this.userId, required this.isbn, required this.bookTitle, required this.studyTopicQuery, required this.aiSummaryMarkdown, required this.createdAt}): super._();
  factory _StudyNote.fromJson(Map<String, dynamic> json) => _$StudyNoteFromJson(json);

@override final  String id;
@override final  String userId;
@override final  String isbn;
@override final  String bookTitle;
@override final  String studyTopicQuery;
@override final  String aiSummaryMarkdown;
@override final  DateTime createdAt;

/// Create a copy of StudyNote
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StudyNoteCopyWith<_StudyNote> get copyWith => __$StudyNoteCopyWithImpl<_StudyNote>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StudyNoteToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _StudyNote&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.isbn, isbn) || other.isbn == isbn)&&(identical(other.bookTitle, bookTitle) || other.bookTitle == bookTitle)&&(identical(other.studyTopicQuery, studyTopicQuery) || other.studyTopicQuery == studyTopicQuery)&&(identical(other.aiSummaryMarkdown, aiSummaryMarkdown) || other.aiSummaryMarkdown == aiSummaryMarkdown)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,userId,isbn,bookTitle,studyTopicQuery,aiSummaryMarkdown,createdAt);
}

@override
String toString() {
    return 'StudyNote(id: $id, userId: $userId, isbn: $isbn, bookTitle: $bookTitle, studyTopicQuery: $studyTopicQuery, aiSummaryMarkdown: $aiSummaryMarkdown, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$StudyNoteCopyWith<$Res> implements $StudyNoteCopyWith<$Res> {
  factory _$StudyNoteCopyWith(_StudyNote value, $Res Function(_StudyNote) _then) = __$StudyNoteCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, String isbn, String bookTitle, String studyTopicQuery, String aiSummaryMarkdown, DateTime createdAt
});




}
/// @nodoc
class __$StudyNoteCopyWithImpl<$Res>
    implements _$StudyNoteCopyWith<$Res> {
  __$StudyNoteCopyWithImpl(this._self, this._then);

  final _StudyNote _self;
  final $Res Function(_StudyNote) _then;

/// Create a copy of StudyNote
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? isbn = null,Object? bookTitle = null,Object? studyTopicQuery = null,Object? aiSummaryMarkdown = null,Object? createdAt = null,}) {
  return _then(_StudyNote(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,isbn: null == isbn ? _self.isbn : isbn // ignore: cast_nullable_to_non_nullable
as String,bookTitle: null == bookTitle ? _self.bookTitle : bookTitle // ignore: cast_nullable_to_non_nullable
as String,studyTopicQuery: null == studyTopicQuery ? _self.studyTopicQuery : studyTopicQuery // ignore: cast_nullable_to_non_nullable
as String,aiSummaryMarkdown: null == aiSummaryMarkdown ? _self.aiSummaryMarkdown : aiSummaryMarkdown // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
