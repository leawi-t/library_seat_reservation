import '../domain/study_note.dart';
import '../domain/study_note_repository.dart';

class InMemoryStudyNoteRepository implements StudyNoteRepository {
  InMemoryStudyNoteRepository({
    List<StudyNote>? initialNotes,
    this.shouldFail = false,
  }) : _notes = List.of(initialNotes ?? _sampleNotes);

  final List<StudyNote> _notes;
  final bool shouldFail;

  static final List<StudyNote> _sampleNotes = [
    StudyNote(
      id: 'note-1',
      userId: 'dummy-user-id',
      isbn: '9781119320913',
      bookTitle: 'Operating System Concepts',
      studyTopicQuery: 'Process scheduling',
      aiSummaryMarkdown:
          '## Summary\nCovers CPU scheduling algorithms including FCFS, SJF, '
          'Round Robin, and multilevel feedback queues.\n\n'
          '## Key concepts\n'
          '- Preemptive vs non-preemptive scheduling\n'
          '- Turnaround time, waiting time, and response time\n'
          '- Time quantum trade-offs in Round Robin\n\n'
          '## Relevance to your syllabus\n'
          'Directly supports the Operating Systems module on CPU scheduling '
          'policies and performance metrics.',
      createdAt: DateTime(2026, 11, 6, 10, 30),
    ),
    StudyNote(
      id: 'note-2',
      userId: 'dummy-user-id',
      isbn: '9780133591620',
      bookTitle: 'Modern Operating Systems',
      studyTopicQuery: 'Memory management',
      aiSummaryMarkdown:
          '## Summary\nExplains virtual memory, paging, page replacement '
          'policies, and TLB address translation.\n\n'
          '## Key concepts\n'
          '- Page tables and multi-level translation\n'
          '- LRU, Clock, and FIFO page replacement\n'
          '- Thrashing and working-set models\n\n'
          '## Relevance to your syllabus\n'
          'Matches the virtual memory and paging lab exercises in Operating '
          'Systems.',
      createdAt: DateTime(2026, 11, 2, 15, 15),
    ),
  ];

  @override
  Future<List<StudyNote>> getNotes(String userId) async {
    if (shouldFail) {
      throw StateError('Unable to load saved study notes.');
    }
    final userNotes = _notes.where((note) => note.userId == userId).toList()
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return List.unmodifiable(userNotes);
  }

  @override
  Future<StudyNote?> getNoteById(String noteId) async {
    if (shouldFail) {
      throw StateError('Unable to load study note.');
    }
    for (final note in _notes) {
      if (note.id == noteId) return note;
    }
    return null;
  }

  @override
  Future<void> saveNote(StudyNote note) async {
    if (shouldFail) {
      throw StateError('Unable to save study note.');
    }
    final index = _notes.indexWhere((existing) => existing.id == note.id);
    if (index == -1) {
      _notes.insert(0, note);
    } else {
      _notes[index] = note;
    }
  }

  @override
  Future<void> deleteNote(String noteId) async {
    if (shouldFail) {
      throw StateError('Unable to delete study note.');
    }
    _notes.removeWhere((note) => note.id == noteId);
  }
}
