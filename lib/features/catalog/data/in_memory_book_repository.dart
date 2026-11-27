import '../domain/book_item.dart';
import '../domain/book_repository.dart';

class InMemoryBookRepository implements BookRepository {
  InMemoryBookRepository({
    List<BookItem>? initialBooks,
    this.delay = Duration.zero,
    this.shouldFail = false,
  }) : _books = List.of(initialBooks ?? _sampleBooks);

  final List<BookItem> _books;
  final Duration delay;
  final bool shouldFail;

  static const List<BookItem> _sampleBooks = [
    BookItem(
      isbn: '9781119320913',
      title: 'Operating System Concepts',
      authors: ['Silberschatz', 'Galvin', 'Gagne'],
      publishYear: 2018,
      edition: '10th ed.',
      coverUrl: '',
      subjectTags: ['OS concepts', 'Processes', 'Process scheduling'],
      availableReferenceCopies: 2,
    ),
    BookItem(
      isbn: '9780133591620',
      title: 'Modern Operating Systems',
      authors: ['A. S. Tanenbaum'],
      publishYear: 2014,
      edition: '4th ed.',
      coverUrl: '',
      subjectTags: ['OS concepts', 'Memory management', 'Concurrency'],
      availableReferenceCopies: 1,
    ),
    BookItem(
      isbn: '9781985086593',
      title: 'OS: Three Easy Pieces',
      authors: ['Arpaci-Dusseau'],
      publishYear: 2018,
      edition: '',
      coverUrl: '',
      subjectTags: ['Virtualization', 'Concurrency', 'Persistence'],
      availableReferenceCopies: 0,
    ),
    BookItem(
      isbn: '9780672329463',
      title: 'Linux Kernel Development',
      authors: ['R. Love'],
      publishYear: 2010,
      edition: '3rd ed.',
      coverUrl: '',
      subjectTags: ['Linux kernel', 'Scheduling', 'System calls'],
      availableReferenceCopies: 1,
    ),
    BookItem(
      isbn: '9780133594140',
      title: 'Computer Networking: A Top-Down Approach',
      authors: ['J. F. Kurose', 'K. W. Ross'],
      publishYear: 2017,
      edition: '7th ed.',
      coverUrl: '',
      subjectTags: ['TCP/IP', 'Routing', 'Application layer'],
      availableReferenceCopies: 3,
    ),
    BookItem(
      isbn: '9780078022159',
      title: 'Database System Concepts',
      authors: ['Silberschatz', 'Korth', 'Sudarshan'],
      publishYear: 2019,
      edition: '7th ed.',
      coverUrl: '',
      subjectTags: ['SQL', 'Transactions', 'Indexing'],
      availableReferenceCopies: 2,
    ),
    BookItem(
      isbn: '9781449373320',
      title: 'Designing Data-Intensive Applications',
      authors: ['M. Kleppmann'],
      publishYear: 2017,
      edition: '1st ed.',
      coverUrl: '',
      subjectTags: ['Distributed systems', 'Replication', 'Consistency'],
      availableReferenceCopies: 1,
    ),
    BookItem(
      isbn: '9780134494166',
      title: 'Clean Architecture',
      authors: ['R. C. Martin'],
      publishYear: 2017,
      edition: '1st ed.',
      coverUrl: '',
      subjectTags: ['Software design', 'SOLID', 'Boundaries'],
      availableReferenceCopies: 0,
    ),
  ];

  @override
  Future<List<BookItem>> searchBooks(String query) async {
    if (delay > Duration.zero) {
      await Future<void>.delayed(delay);
    }
    if (shouldFail) {
      throw StateError('Unable to fetch books from catalog.');
    }
    return List.unmodifiable(
      _books.where((book) => book.matchesQuery(query)),
    );
  }

  @override
  Future<BookItem?> getBookByIsbn(String isbn) async {
    if (delay > Duration.zero) {
      await Future<void>.delayed(delay);
    }
    if (shouldFail) {
      throw StateError('Unable to load book details.');
    }
    final target = BookItem.normalizeIsbn(isbn);
    for (final book in _books) {
      if (BookItem.normalizeIsbn(book.isbn) == target) {
        return book;
      }
    }
    return null;
  }
}
