import '../domain/book_item.dart';
import '../domain/book_repository.dart';

class InMemoryBookRepository implements BookRepository {
  final List<BookItem> _books = [];

  @override
  Future<List<BookItem>> searchBooks(String query) async => _books;

  @override
  Future<BookItem?> getBookByIsbn(String isbn) async {
    try {
      return _books.firstWhere((book) => book.isbn == isbn);
    } catch (_) {
      return null;
    }
  }
}
