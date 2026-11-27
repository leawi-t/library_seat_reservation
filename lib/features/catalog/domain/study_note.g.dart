// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'study_note.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StudyNote _$StudyNoteFromJson(Map<String, dynamic> json) => _StudyNote(
  id: json['id'] as String,
  userId: json['userId'] as String,
  isbn: json['isbn'] as String,
  bookTitle: json['bookTitle'] as String,
  studyTopicQuery: json['studyTopicQuery'] as String,
  aiSummaryMarkdown: json['aiSummaryMarkdown'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$StudyNoteToJson(_StudyNote instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'isbn': instance.isbn,
      'bookTitle': instance.bookTitle,
      'studyTopicQuery': instance.studyTopicQuery,
      'aiSummaryMarkdown': instance.aiSummaryMarkdown,
      'createdAt': instance.createdAt.toIso8601String(),
    };
