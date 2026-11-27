import 'package:freezed_annotation/freezed_annotation.dart';

part 'book_item.freezed.dart';
part 'book_item.g.dart';

@freezed
abstract class BookItem with _$BookItem {
  const BookItem._();

  const factory BookItem({
    required String isbn,
    required String title,
    required List<String> authors,
    required int publishYear,
    @Default('') String edition,
    required String coverUrl,
    required List<String> subjectTags,
    required int availableReferenceCopies,
  }) = _BookItem;

  factory BookItem.fromJson(Map<String, dynamic> json) =>
      _$BookItemFromJson(json);

  bool get hasAvailableCopies => availableReferenceCopies > 0;

  String get authorsLabel =>
      authors.isEmpty ? 'Unknown author' : authors.join(', ');

  String get publicationLabel =>
      edition.trim().isEmpty ? '$publishYear' : '$edition · $publishYear';

  String get availabilityLabel {
    if (availableReferenceCopies <= 0) return 'No copies';
    if (availableReferenceCopies == 1) return '1 ref. copy';
    return '$availableReferenceCopies ref. copies';
  }

  /// Normalizes an ISBN by stripping hyphens and spaces and uppercasing `X`.
  static String normalizeIsbn(String raw) =>
      raw.replaceAll(RegExp(r'[\s-]'), '').trim().toUpperCase();

  /// Returns true when this book matches [rawQuery] across title, authors,
  /// subject tags, or normalized ISBN.
  bool matchesQuery(String rawQuery) {
    final query = rawQuery.trim().toLowerCase();
    if (query.isEmpty) return true;

    if (title.toLowerCase().contains(query)) return true;
    if (authors.any((author) => author.toLowerCase().contains(query))) {
      return true;
    }
    if (subjectTags.any((tag) => tag.toLowerCase().contains(query))) {
      return true;
    }

    final normalizedQuery = normalizeIsbn(rawQuery);
    if (normalizedQuery.isNotEmpty &&
        normalizeIsbn(isbn).contains(normalizedQuery)) {
      return true;
    }

    return false;
  }
}
