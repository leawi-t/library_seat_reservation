import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:library_seat_reservation/core/theme/app_theme.dart';
import 'package:library_seat_reservation/features/catalog/data/in_memory_book_repository.dart';
import 'package:library_seat_reservation/features/catalog/domain/book_item.dart';
import 'package:library_seat_reservation/features/catalog/domain/book_repository.dart';
import 'package:library_seat_reservation/features/catalog/presentation/book_catalog_screen.dart';
import 'package:library_seat_reservation/features/catalog/presentation/catalog_provider.dart';

class _ControlledBookRepository implements BookRepository {
  _ControlledBookRepository(this.completer);

  final Completer<List<BookItem>> completer;

  @override
  Future<List<BookItem>> searchBooks(String query) => completer.future;

  @override
  Future<BookItem?> getBookByIsbn(String isbn) async => null;
}

Future<void> _pumpCatalog(
  WidgetTester tester, {
  required BookRepository repository,
  Size viewport = const Size(360, 800),
}) async {
  tester.view.physicalSize = viewport;
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);

  final router = GoRouter(
    initialLocation: '/catalog',
    routes: [
      GoRoute(
        path: '/catalog',
        builder: (context, state) => const BookCatalogScreen(),
        routes: [
          GoRoute(
            path: ':isbn',
            builder: (context, state) => Scaffold(
              body: Text('opened ${state.pathParameters['isbn']}'),
            ),
          ),
        ],
      ),
    ],
  );

  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        bookRepositoryProvider.overrideWithValue(repository),
      ],
      child: MaterialApp.router(
        theme: AppTheme.lightTheme,
        routerConfig: router,
      ),
    ),
  );
}

void main() {
  testWidgets('shows loading indicator while fetching books', (tester) async {
    final completer = Completer<List<BookItem>>();
    await _pumpCatalog(tester, repository: _ControlledBookRepository(completer));
    await tester.pump();

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('shows error state and retries cleanly', (tester) async {
    await _pumpCatalog(
      tester,
      repository: InMemoryBookRepository(shouldFail: true),
    );
    await tester.pumpAndSettle();

    expect(find.text('Could not load book catalog.'), findsOneWidget);
    expect(find.text('Retry'), findsOneWidget);
  });

  testWidgets('renders books, filters by query, handles empty, and navigates',
      (tester) async {
    await _pumpCatalog(tester, repository: InMemoryBookRepository());
    await tester.pumpAndSettle();

    expect(find.text('Operating System Concepts'), findsOneWidget);
    expect(find.text('2 ref. copies'), findsOneWidget);
    expect(find.text('No copies'), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'Tanenbaum');
    await tester.pumpAndSettle();

    expect(find.text('Modern Operating Systems'), findsOneWidget);
    expect(find.text('Operating System Concepts'), findsNothing);

    await tester.enterText(find.byType(TextField), 'nonexistent-topic-xyz');
    await tester.pumpAndSettle();

    expect(find.text('No books match "nonexistent-topic-xyz".'), findsOneWidget);
    await tester.tap(find.text('Clear search'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Operating System Concepts'));
    await tester.pumpAndSettle();

    expect(find.text('opened 9781119320913'), findsOneWidget);
  });

  testWidgets('renders without overflow at 900 px wide tablet viewport',
      (tester) async {
    await _pumpCatalog(
      tester,
      repository: InMemoryBookRepository(),
      viewport: const Size(900, 800),
    );
    await tester.pumpAndSettle();

    expect(find.text('Operating System Concepts'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
