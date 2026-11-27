// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BookItem _$BookItemFromJson(Map<String, dynamic> json) => _BookItem(
  isbn: json['isbn'] as String,
  title: json['title'] as String,
  authors: (json['authors'] as List<dynamic>).map((e) => e as String).toList(),
  publishYear: (json['publishYear'] as num).toInt(),
  edition: json['edition'] as String? ?? '',
  coverUrl: json['coverUrl'] as String,
  subjectTags: (json['subjectTags'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  availableReferenceCopies: (json['availableReferenceCopies'] as num).toInt(),
);

Map<String, dynamic> _$BookItemToJson(_BookItem instance) => <String, dynamic>{
  'isbn': instance.isbn,
  'title': instance.title,
  'authors': instance.authors,
  'publishYear': instance.publishYear,
  'edition': instance.edition,
  'coverUrl': instance.coverUrl,
  'subjectTags': instance.subjectTags,
  'availableReferenceCopies': instance.availableReferenceCopies,
};
