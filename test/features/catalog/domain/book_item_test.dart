import 'package:flutter_test/flutter_test.dart';
import 'package:library_seat_reservation/features/catalog/domain/ai_study_exception.dart';
import 'package:library_seat_reservation/features/catalog/domain/ai_study_summary.dart';
import 'package:library_seat_reservation/features/catalog/domain/book_item.dart';

void main() {
  const sampleBook = BookItem(
    isbn: '9781119320913',
    title: 'Operating System Concepts',
    authors: ['Silberschatz', 'Galvin', 'Gagne'],
    publishYear: 2018,
    edition: '10th ed.',
    coverUrl: '',
    subjectTags: ['OS concepts', 'Processes'],
    availableReferenceCopies: 2,
  );

  group('BookItem', () {
    test('formats availabilityLabel for 0, 1, and multiple copies', () {
      expect(
        sampleBook.copyWith(availableReferenceCopies: 0).availabilityLabel,
        'No copies',
      );
      expect(
        sampleBook.copyWith(availableReferenceCopies: 1).availabilityLabel,
        '1 ref. copy',
      );
      expect(sampleBook.availabilityLabel, '2 ref. copies');
    });

    test('formats publicationLabel with and without edition', () {
      expect(sampleBook.publicationLabel, '10th ed. · 2018');
      expect(
        sampleBook.copyWith(edition: '').publicationLabel,
        '2018',
      );
    });

    test('normalizes ISBN hyphens, spaces, and trailing X', () {
      expect(BookItem.normalizeIsbn('978-1-119-32091-3'), '9781119320913');
      expect(BookItem.normalizeIsbn('013359162x'), '013359162X');
    });

    test('matchesQuery checks title, authors, tags, and normalized ISBN', () {
      expect(sampleBook.matchesQuery(''), isTrue);
      expect(sampleBook.matchesQuery('operating'), isTrue);
      expect(sampleBook.matchesQuery('galvin'), isTrue);
      expect(sampleBook.matchesQuery('processes'), isTrue);
      expect(sampleBook.matchesQuery('978-1119320913'), isTrue);
      expect(sampleBook.matchesQuery('quantum'), isFalse);
    });
  });

  group('AiStudySummary', () {
    final validSummary = AiStudySummary(
      isbn: '9781119320913',
      bookTitle: 'Operating System Concepts',
      topic: 'Process scheduling',
      summary: 'Explains CPU scheduling algorithms.',
      keyConcepts: ['FCFS', 'Round Robin'],
      syllabusRelevance: 'Covers Week 4 scheduling labs.',
      generatedAt: DateTime(2026, 11, 27),
    );

    test('validated rejects blank summary, empty concepts, or blank relevance',
        () {
      expect(
        () => validSummary.copyWith(summary: '   ').validated(),
        throwsA(isA<AiMalformedOutputException>()),
      );
      expect(
        () => validSummary.copyWith(keyConcepts: []).validated(),
        throwsA(isA<AiMalformedOutputException>()),
      );
      expect(
        () => validSummary.copyWith(syllabusRelevance: '').validated(),
        throwsA(isA<AiMalformedOutputException>()),
      );
    });

    test('toMarkdown includes all three structured sections', () {
      final md = validSummary.toMarkdown();
      expect(md, contains('## Summary'));
      expect(md, contains('## Key concepts'));
      expect(md, contains('- FCFS'));
      expect(md, contains('## Relevance to your syllabus'));
    });
  });
}
