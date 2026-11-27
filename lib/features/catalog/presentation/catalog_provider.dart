import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/in_memory_book_repository.dart';
import '../domain/book_item.dart';
import '../domain/book_repository.dart';

final bookRepositoryProvider = Provider<BookRepository>((ref) {
  return InMemoryBookRepository();
});

final bookSearchQueryProvider =
    NotifierProvider<BookSearchQueryNotifier, String>(
  BookSearchQueryNotifier.new,
);

class BookSearchQueryNotifier extends Notifier<String> {
  @override
  String build() => '';

  void setQuery(String query) {
    state = query;
  }

  void clear() {
    state = '';
  }
}

final bookCatalogProvider = FutureProvider<List<BookItem>>((ref) {
  final repository = ref.watch(bookRepositoryProvider);
  final query = ref.watch(bookSearchQueryProvider);
  return repository.searchBooks(query);
});

final bookDetailProvider = FutureProvider.family<BookItem?, String>((
  ref,
  isbn,
) {
  final repository = ref.watch(bookRepositoryProvider);
  return repository.getBookByIsbn(isbn);
});
