// Placeholder for @freezed BookItem & StudyNote models
class BookItem {
  const BookItem({
    required this.isbn,
    required this.title,
    required this.authors,
    required this.publishYear,
    required this.coverUrl,
    required this.subjectTags,
    required this.availableReferenceCopies,
  });

  final String isbn;
  final String title;
  final List<String> authors;
  final int publishYear;
  final String coverUrl;
  final List<String> subjectTags;
  final int availableReferenceCopies;
}

class StudyNote {
  const StudyNote({
    required this.id,
    required this.userId,
    required this.isbn,
    required this.bookTitle,
    required this.studyTopicQuery,
    required this.aiSummaryMarkdown,
    required this.createdAt,
  });

  final String id;
  final String userId;
  final String isbn;
  final String bookTitle;
  final String studyTopicQuery;
  final String aiSummaryMarkdown;
  final DateTime createdAt;
}
