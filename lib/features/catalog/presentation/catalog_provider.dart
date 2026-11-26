import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/fake_ai_study_service.dart';
import '../data/in_memory_book_repository.dart';
import '../domain/ai_study_service.dart';
import '../domain/book_item.dart';
import '../domain/book_repository.dart';

final bookRepositoryProvider = Provider<BookRepository>((ref) {
  return InMemoryBookRepository();
});

final aiStudyServiceProvider = Provider<AiStudyService>((ref) {
  return FakeAiStudyService();
});

final bookCatalogProvider = FutureProvider<List<BookItem>>((ref) async {
  final repository = ref.watch(bookRepositoryProvider);
  return repository.searchBooks('');
});
