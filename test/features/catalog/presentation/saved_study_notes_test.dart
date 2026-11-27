import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:library_seat_reservation/core/router/app_router.dart';
import 'package:library_seat_reservation/core/theme/app_theme.dart';
import 'package:library_seat_reservation/features/catalog/data/in_memory_study_note_repository.dart';
import 'package:library_seat_reservation/features/catalog/presentation/study_note_detail_screen.dart';
import 'package:library_seat_reservation/features/catalog/presentation/study_notes_provider.dart';
import 'package:library_seat_reservation/features/reservations/presentation/my_reservations_screen.dart';

Future<void> _pumpReservationsNotes(
  WidgetTester tester,
  InMemoryStudyNoteRepository repository,
) async {
  tester.view.physicalSize = const Size(360, 800);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);

  final router = GoRouter(
    initialLocation: AppRoutes.reservations,
    routes: [
      GoRoute(
        path: AppRoutes.reservations,
        builder: (context, state) => const MyReservationsScreen(),
        routes: [
          GoRoute(
            path: 'notes/:noteId',
            builder: (context, state) => StudyNoteDetailScreen(
              noteId: state.pathParameters['noteId']!,
            ),
          ),
        ],
      ),
      GoRoute(
        path: '${AppRoutes.catalog}/:isbn',
        builder: (context, state) => const Scaffold(body: Text('Book detail')),
      ),
    ],
  );

  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        studyNoteRepositoryProvider.overrideWithValue(repository),
      ],
      child: MaterialApp.router(
        theme: AppTheme.lightTheme,
        routerConfig: router,
      ),
    ),
  );
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('shows empty state when user has no saved study notes',
      (tester) async {
    await _pumpReservationsNotes(
      tester,
      InMemoryStudyNoteRepository(initialNotes: const []),
    );

    expect(find.text('Saved study notes'), findsOneWidget);
    expect(find.text('0'), findsOneWidget);
    expect(find.textContaining('No saved study notes yet'), findsOneWidget);
  });

  testWidgets('lists saved study notes, opens detail, and deletes with confirm',
      (tester) async {
    final repo = InMemoryStudyNoteRepository();
    await _pumpReservationsNotes(tester, repo);

    expect(find.text('2'), findsOneWidget);
    expect(find.text('Operating System Concepts'), findsOneWidget);
    expect(find.text('Process scheduling · 6 Nov'), findsOneWidget);

    await tester.tap(find.text('Operating System Concepts'));
    await tester.pumpAndSettle();

    expect(find.text('Saved study note'), findsOneWidget);
    expect(find.text('AI-generated'), findsOneWidget);

    await tester.tap(find.byTooltip('Delete note'));
    await tester.pumpAndSettle();
    expect(find.text('Delete study note?'), findsOneWidget);

    await tester.tap(find.text('Delete'));
    await tester.pumpAndSettle();

    expect(find.text('1'), findsOneWidget);
    expect(find.text('Operating System Concepts'), findsNothing);
    expect(find.text('Modern Operating Systems'), findsOneWidget);
  });
}
