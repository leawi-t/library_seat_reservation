/// Centralized route paths to avoid hardcoded string typos.
///
/// Kept in its own file (no imports) so features can use it without
/// importing the router, which imports every screen.
class AppRoutes {
  const AppRoutes._();

  static const String seats = '/seats';
  static const String catalog = '/catalog';
  static const String scanner = '/scanner';
  static const String reservations = '/reservations';

  static String seatDetail(String seatId) => '/seats/$seatId';

  static String bookDetail(String isbn) => '/catalog/$isbn';

  static String aiSummary(String isbn, {String? topic}) {
    final base = '/catalog/$isbn/summary';
    if (topic == null || topic.trim().isEmpty) return base;
    return Uri(path: base, queryParameters: {'topic': topic}).toString();
  }

  static String studyNoteDetail(String noteId) => '/reservations/notes/$noteId';
}
