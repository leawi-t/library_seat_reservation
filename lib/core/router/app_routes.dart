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
}
