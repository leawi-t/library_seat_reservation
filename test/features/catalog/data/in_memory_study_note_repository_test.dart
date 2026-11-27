import 'package:flutter_test/flutter_test.dart';
import 'package:library_seat_reservation/features/catalog/data/in_memory_study_note_repository.dart';
import 'package:library_seat_reservation/features/catalog/domain/study_note.dart';

void main() {
  group('InMemoryStudyNoteRepository', () {
    test('returns notes for user sorted newest-first', () async {
      final repo = InMemoryStudyNoteRepository();
      final notes = await repo.getNotes('dummy-user-id');

      expect(notes, hasLength(2));
      expect(notes.first.bookTitle, 'Operating System Concepts');
      expect(notes.last.bookTitle, 'Modern Operating Systems');
    });

    test('saveNote inserts a new note and deleteNote removes it', () async {
      final repo = InMemoryStudyNoteRepository(initialNotes: const []);
      final note = StudyNote(
        id: 'note-10',
        userId: 'dummy-user-id',
        isbn: '9780672329463',
        bookTitle: 'Linux Kernel Development',
        studyTopicQuery: 'CFS scheduler',
        aiSummaryMarkdown: '## Summary\nCFS details',
        createdAt: DateTime(2026, 11, 27),
      );

      await repo.saveNote(note);
      expect(await repo.getNoteById('note-10'), note);

      await repo.deleteNote('note-10');
      expect(await repo.getNoteById('note-10'), isNull);
    });

    test('throws StateError on failure path', () async {
      final repo = InMemoryStudyNoteRepository(shouldFail: true);
      expect(() => repo.getNotes('dummy-user-id'), throwsStateError);
    });
  });
}
