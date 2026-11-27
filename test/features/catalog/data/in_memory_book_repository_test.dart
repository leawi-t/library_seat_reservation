import 'package:flutter_test/flutter_test.dart';
import 'package:library_seat_reservation/features/catalog/data/in_memory_book_repository.dart';

void main() {
  group('InMemoryBookRepository', () {
    test('returns seeded books when query is empty', () async {
      final repo = InMemoryBookRepository();
      final books = await repo.searchBooks('');
      expect(books, isNotEmpty);
      expect(books.first.title, 'Operating System Concepts');
    });

    test('filters books by title, author, subject tag, and ISBN', () async {
      final repo = InMemoryBookRepository();

      final byTitle = await repo.searchBooks('Linux Kernel');
      expect(byTitle.map((b) => b.title), ['Linux Kernel Development']);

      final byAuthor = await repo.searchBooks('Tanenbaum');
      expect(byAuthor.map((b) => b.title), ['Modern Operating Systems']);

      final byIsbn = await repo.searchBooks('978-1119320913');
      expect(byIsbn.map((b) => b.isbn), ['9781119320913']);
    });

    test('getBookByIsbn normalizes hyphens and returns null when missing',
        () async {
      final repo = InMemoryBookRepository();

      final found = await repo.getBookByIsbn('978-0133591620');
      expect(found?.title, 'Modern Operating Systems');

      final missing = await repo.getBookByIsbn('0000000000000');
      expect(missing, isNull);
    });

    test('throws StateError on failure path', () async {
      final repo = InMemoryBookRepository(shouldFail: true);
      expect(() => repo.searchBooks(''), throwsStateError);
      expect(() => repo.getBookByIsbn('9781119320913'), throwsStateError);
    });
  });
}
