// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_study_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AiStudySummary _$AiStudySummaryFromJson(Map<String, dynamic> json) =>
    _AiStudySummary(
      isbn: json['isbn'] as String,
      bookTitle: json['bookTitle'] as String,
      topic: json['topic'] as String,
      summary: json['summary'] as String,
      keyConcepts: (json['keyConcepts'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      syllabusRelevance: json['syllabusRelevance'] as String,
      generatedAt: DateTime.parse(json['generatedAt'] as String),
    );

Map<String, dynamic> _$AiStudySummaryToJson(_AiStudySummary instance) =>
    <String, dynamic>{
      'isbn': instance.isbn,
      'bookTitle': instance.bookTitle,
      'topic': instance.topic,
      'summary': instance.summary,
      'keyConcepts': instance.keyConcepts,
      'syllabusRelevance': instance.syllabusRelevance,
      'generatedAt': instance.generatedAt.toIso8601String(),
    };
