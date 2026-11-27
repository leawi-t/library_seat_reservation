import 'package:freezed_annotation/freezed_annotation.dart';

part 'study_note.freezed.dart';
part 'study_note.g.dart';

@freezed
abstract class StudyNote with _$StudyNote {
  const StudyNote._();

  const factory StudyNote({
    required String id,
    required String userId,
    required String isbn,
    required String bookTitle,
    required String studyTopicQuery,
    required String aiSummaryMarkdown,
    required DateTime createdAt,
  }) = _StudyNote;

  factory StudyNote.fromJson(Map<String, dynamic> json) =>
      _$StudyNoteFromJson(json);
}
