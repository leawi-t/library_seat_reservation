import 'book_item.dart';

abstract interface class BookRepository {
  Future<List<BookItem>> searchBooks(String query);
  Future<BookItem?> getBookByIsbn(String isbn);
}
