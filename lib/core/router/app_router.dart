import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/catalog/presentation/ai_study_summary_screen.dart';
import '../../features/catalog/presentation/book_catalog_screen.dart';
import '../../features/catalog/presentation/book_detail_screen.dart';
import '../../features/catalog/presentation/study_note_detail_screen.dart';
import '../../features/reservations/presentation/my_reservations_screen.dart';
import '../../features/scanner/presentation/scanner_screen.dart';
import '../../features/seats/presentation/seat_browser_screen.dart';
import '../../features/seats/presentation/seat_detail_screen.dart';
import '../widgets/main_shell.dart';

/// Centralized route paths to avoid hardcoded string typos.
class AppRoutes {
  const AppRoutes._();

  static const String seats = '/seats';
  static const String catalog = '/catalog';
  static const String scanner = '/scanner';
  static const String reservations = '/reservations';

  static String seatDetail(String seatId) => '/seats/$seatId';

  static String bookDetail(String isbn) => '/catalog/$isbn';

  static String aiSummary(String isbn, {String topic = ''}) {
    final trimmed = topic.trim();
    if (trimmed.isEmpty) return '/catalog/$isbn/summary';
    return '/catalog/$isbn/summary?topic=${Uri.encodeQueryComponent(trimmed)}';
  }

  static String studyNoteDetail(String noteId) => '/reservations/notes/$noteId';
}

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: AppRoutes.seats,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainShell(navigationShell: navigationShell);
        },
        branches: [
          // Tab 0: Seats (List + Parameterized Detail)
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.seats,
                builder: (context, state) => const SeatBrowserScreen(),
                routes: [
                  GoRoute(
                    path: ':seatId',
                    builder: (context, state) {
                      final seatId = state.pathParameters['seatId']!;
                      return SeatDetailScreen(seatId: seatId);
                    },
                  ),
                ],
              ),
            ],
          ),
          // Tab 1: Book Catalog & AI Helper
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.catalog,
                builder: (context, state) => const BookCatalogScreen(),
                routes: [
                  GoRoute(
                    path: ':isbn',
                    builder: (context, state) {
                      final isbn = state.pathParameters['isbn']!;
                      return BookDetailScreen(isbn: isbn);
                    },
                    routes: [
                      GoRoute(
                        path: 'summary',
                        builder: (context, state) {
                          final isbn = state.pathParameters['isbn']!;
                          final topic =
                              state.uri.queryParameters['topic'] ?? '';
                          return AiStudySummaryScreen(
                            isbn: isbn,
                            initialTopic: topic,
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          // Tab 2: Camera Scanner
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.scanner,
                builder: (context, state) => const ScannerScreen(),
              ),
            ],
          ),
          // Tab 3: My Reservations & Notes
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.reservations,
                builder: (context, state) => const MyReservationsScreen(),
                routes: [
                  GoRoute(
                    path: 'notes/:noteId',
                    builder: (context, state) {
                      final noteId = state.pathParameters['noteId']!;
                      return StudyNoteDetailScreen(noteId: noteId);
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
});