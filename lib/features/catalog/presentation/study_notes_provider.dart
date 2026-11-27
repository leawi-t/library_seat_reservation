import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../reservations/presentation/clock_provider.dart';
import '../../reservations/presentation/reservations_provider.dart';
import '../data/in_memory_study_note_repository.dart';
import '../domain/ai_study_summary.dart';
import '../domain/study_note.dart';
import '../domain/study_note_repository.dart';

final studyNoteRepositoryProvider = Provider<StudyNoteRepository>((ref) {
  return InMemoryStudyNoteRepository();
});

final studyNotesProvider =
    AsyncNotifierProvider<StudyNotesNotifier, List<StudyNote>>(
  StudyNotesNotifier.new,
);

class StudyNotesNotifier extends AsyncNotifier<List<StudyNote>> {
  @override
  Future<List<StudyNote>> build() {
    final userId = ref.watch(currentUserIdProvider);
    return ref.watch(studyNoteRepositoryProvider).getNotes(userId);
  }

  Future<StudyNote> saveSummary(AiStudySummary summary) async {
    final now = ref.read(clockProvider)();
    final userId = ref.read(currentUserIdProvider);
    final note = StudyNote(
      id: 'note-${now.microsecondsSinceEpoch}',
      userId: userId,
      isbn: summary.isbn,
      bookTitle: summary.bookTitle,
      studyTopicQuery: summary.topic,
      aiSummaryMarkdown: summary.toMarkdown(),
      createdAt: now,
    );

    await ref.read(studyNoteRepositoryProvider).saveNote(note);
    ref.invalidateSelf();
    await future;
    return note;
  }

  Future<void> deleteNote(String noteId) async {
    await ref.read(studyNoteRepositoryProvider).deleteNote(noteId);
    ref.invalidateSelf();
    await future;
  }
}

final studyNoteDetailProvider = FutureProvider.family<StudyNote?, String>((
  ref,
  noteId,
) {
  // Watch studyNotesProvider so deletions or saves refresh open details.
  ref.watch(studyNotesProvider);
  return ref.read(studyNoteRepositoryProvider).getNoteById(noteId);
});
