// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BookItem {

 String get isbn; String get title; List<String> get authors; int get publishYear; String get edition; String get coverUrl; List<String> get subjectTags; int get availableReferenceCopies;
/// Create a copy of BookItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookItemCopyWith<BookItem> get copyWith => _$BookItemCopyWithImpl<BookItem>(this as BookItem, _$identity);

  /// Serializes this BookItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as BookItem;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookItem&&(identical(other.isbn, _this.isbn) || other.isbn == _this.isbn)&&(identical(other.title, _this.title) || other.title == _this.title)&&const DeepCollectionEquality().equals(other.authors, _this.authors)&&(identical(other.publishYear, _this.publishYear) || other.publishYear == _this.publishYear)&&(identical(other.edition, _this.edition) || other.edition == _this.edition)&&(identical(other.coverUrl, _this.coverUrl) || other.coverUrl == _this.coverUrl)&&const DeepCollectionEquality().equals(other.subjectTags, _this.subjectTags)&&(identical(other.availableReferenceCopies, _this.availableReferenceCopies) || other.availableReferenceCopies == _this.availableReferenceCopies));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as BookItem;
  return Object.hash(runtimeType,_this.isbn,_this.title,const DeepCollectionEquality().hash(_this.authors),_this.publishYear,_this.edition,_this.coverUrl,const DeepCollectionEquality().hash(_this.subjectTags),_this.availableReferenceCopies);
}

@override
String toString() {
  final _this = this as BookItem;
  return 'BookItem(isbn: ${_this.isbn}, title: ${_this.title}, authors: ${_this.authors}, publishYear: ${_this.publishYear}, edition: ${_this.edition}, coverUrl: ${_this.coverUrl}, subjectTags: ${_this.subjectTags}, availableReferenceCopies: ${_this.availableReferenceCopies})';
}


}

/// @nodoc
abstract mixin class $BookItemCopyWith<$Res>  {
  factory $BookItemCopyWith(BookItem value, $Res Function(BookItem) _then) = _$BookItemCopyWithImpl;
@useResult
$Res call({
 String isbn, String title, List<String> authors, int publishYear, String edition, String coverUrl, List<String> subjectTags, int availableReferenceCopies
});




}
/// @nodoc
class _$BookItemCopyWithImpl<$Res>
    implements $BookItemCopyWith<$Res> {
  _$BookItemCopyWithImpl(this._self, this._then);

  final BookItem _self;
  final $Res Function(BookItem) _then;

/// Create a copy of BookItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isbn = null,Object? title = null,Object? authors = null,Object? publishYear = null,Object? edition = null,Object? coverUrl = null,Object? subjectTags = null,Object? availableReferenceCopies = null,}) {
  return _then(BookItem(
isbn: null == isbn ? _self.isbn : isbn // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,authors: null == authors ? _self.authors : authors // ignore: cast_nullable_to_non_nullable
as List<String>,publishYear: null == publishYear ? _self.publishYear : publishYear // ignore: cast_nullable_to_non_nullable
as int,edition: null == edition ? _self.edition : edition // ignore: cast_nullable_to_non_nullable
as String,coverUrl: null == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String,subjectTags: null == subjectTags ? _self.subjectTags : subjectTags // ignore: cast_nullable_to_non_nullable
as List<String>,availableReferenceCopies: null == availableReferenceCopies ? _self.availableReferenceCopies : availableReferenceCopies // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [BookItem].
extension BookItemPatterns on BookItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookItem value)  $default,){
final _that = this;
switch (_that) {
case _BookItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookItem value)?  $default,){
final _that = this;
switch (_that) {
case _BookItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String isbn,  String title,  List<String> authors,  int publishYear,  String edition,  String coverUrl,  List<String> subjectTags,  int availableReferenceCopies)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookItem() when $default != null:
return $default(_that.isbn,_that.title,_that.authors,_that.publishYear,_that.edition,_that.coverUrl,_that.subjectTags,_that.availableReferenceCopies);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String isbn,  String title,  List<String> authors,  int publishYear,  String edition,  String coverUrl,  List<String> subjectTags,  int availableReferenceCopies)  $default,) {final _that = this;
switch (_that) {
case _BookItem():
return $default(_that.isbn,_that.title,_that.authors,_that.publishYear,_that.edition,_that.coverUrl,_that.subjectTags,_that.availableReferenceCopies);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String isbn,  String title,  List<String> authors,  int publishYear,  String edition,  String coverUrl,  List<String> subjectTags,  int availableReferenceCopies)?  $default,) {final _that = this;
switch (_that) {
case _BookItem() when $default != null:
return $default(_that.isbn,_that.title,_that.authors,_that.publishYear,_that.edition,_that.coverUrl,_that.subjectTags,_that.availableReferenceCopies);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BookItem extends BookItem {
  const _BookItem({required this.isbn, required this.title, required  List<String> authors, required this.publishYear, this.edition = '', required this.coverUrl, required  List<String> subjectTags, required this.availableReferenceCopies}): _authors = authors,_subjectTags = subjectTags,super._();
  factory _BookItem.fromJson(Map<String, dynamic> json) => _$BookItemFromJson(json);

@override final  String isbn;
@override final  String title;
 final  List<String> _authors;
@override List<String> get authors {
  if (_authors is EqualUnmodifiableListView) return _authors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_authors);
}

@override final  int publishYear;
@override@JsonKey() final  String edition;
@override final  String coverUrl;
 final  List<String> _subjectTags;
@override List<String> get subjectTags {
  if (_subjectTags is EqualUnmodifiableListView) return _subjectTags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_subjectTags);
}

@override final  int availableReferenceCopies;

/// Create a copy of BookItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookItemCopyWith<_BookItem> get copyWith => __$BookItemCopyWithImpl<_BookItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookItemToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookItem&&(identical(other.isbn, isbn) || other.isbn == isbn)&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other.authors, _authors)&&(identical(other.publishYear, publishYear) || other.publishYear == publishYear)&&(identical(other.edition, edition) || other.edition == edition)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&const DeepCollectionEquality().equals(other.subjectTags, _subjectTags)&&(identical(other.availableReferenceCopies, availableReferenceCopies) || other.availableReferenceCopies == availableReferenceCopies));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,isbn,title,const DeepCollectionEquality().hash(_authors),publishYear,edition,coverUrl,const DeepCollectionEquality().hash(_subjectTags),availableReferenceCopies);
}

@override
String toString() {
    return 'BookItem(isbn: $isbn, title: $title, authors: $authors, publishYear: $publishYear, edition: $edition, coverUrl: $coverUrl, subjectTags: $subjectTags, availableReferenceCopies: $availableReferenceCopies)';
}


}

/// @nodoc
abstract mixin class _$BookItemCopyWith<$Res> implements $BookItemCopyWith<$Res> {
  factory _$BookItemCopyWith(_BookItem value, $Res Function(_BookItem) _then) = __$BookItemCopyWithImpl;
@override @useResult
$Res call({
 String isbn, String title, List<String> authors, int publishYear, String edition, String coverUrl, List<String> subjectTags, int availableReferenceCopies
});




}
/// @nodoc
class __$BookItemCopyWithImpl<$Res>
    implements _$BookItemCopyWith<$Res> {
  __$BookItemCopyWithImpl(this._self, this._then);

  final _BookItem _self;
  final $Res Function(_BookItem) _then;

/// Create a copy of BookItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isbn = null,Object? title = null,Object? authors = null,Object? publishYear = null,Object? edition = null,Object? coverUrl = null,Object? subjectTags = null,Object? availableReferenceCopies = null,}) {
  return _then(_BookItem(
isbn: null == isbn ? _self.isbn : isbn // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,authors: null == authors ? _self._authors : authors // ignore: cast_nullable_to_non_nullable
as List<String>,publishYear: null == publishYear ? _self.publishYear : publishYear // ignore: cast_nullable_to_non_nullable
as int,edition: null == edition ? _self.edition : edition // ignore: cast_nullable_to_non_nullable
as String,coverUrl: null == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String,subjectTags: null == subjectTags ? _self._subjectTags : subjectTags // ignore: cast_nullable_to_non_nullable
as List<String>,availableReferenceCopies: null == availableReferenceCopies ? _self.availableReferenceCopies : availableReferenceCopies // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
