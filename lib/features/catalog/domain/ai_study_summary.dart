import 'package:freezed_annotation/freezed_annotation.dart';

import 'ai_study_exception.dart';

part 'ai_study_summary.freezed.dart';
part 'ai_study_summary.g.dart';

@freezed
abstract class AiStudySummary with _$AiStudySummary {
  const AiStudySummary._();

  const factory AiStudySummary({
    required String isbn,
    required String bookTitle,
    required String topic,
    required String summary,
    required List<String> keyConcepts,
    required String syllabusRelevance,
    required DateTime generatedAt,
  }) = _AiStudySummary;

  factory AiStudySummary.fromJson(Map<String, dynamic> json) =>
      _$AiStudySummaryFromJson(json);

  /// Validates a parsed AI summary and throws [AiMalformedOutputException]
  /// when required sections are missing or blank.
  AiStudySummary validated() {
    if (summary.trim().isEmpty ||
        keyConcepts.where((c) => c.trim().isNotEmpty).isEmpty ||
        syllabusRelevance.trim().isEmpty) {
      throw const AiMalformedOutputException();
    }
    return this;
  }

  /// Formats the summary into readable Markdown for persistence in [StudyNote].
  String toMarkdown() {
    final concepts = keyConcepts.map((c) => '- $c').join('\n');
    return '## Summary\n$summary\n\n'
        '## Key concepts\n$concepts\n\n'
        '## Relevance to your syllabus\n$syllabusRelevance';
  }
}
