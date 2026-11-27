import 'study_note.dart';

abstract interface class StudyNoteRepository {
  Future<List<StudyNote>> getNotes(String userId);
  Future<StudyNote?> getNoteById(String noteId);
  Future<void> saveNote(StudyNote note);
  Future<void> deleteNote(String noteId);
}
