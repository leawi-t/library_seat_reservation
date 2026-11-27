import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:library_seat_reservation/core/router/app_router.dart';
import 'package:library_seat_reservation/core/theme/app_theme.dart';
import 'package:library_seat_reservation/features/catalog/data/fake_ai_study_service.dart';
import 'package:library_seat_reservation/features/catalog/data/in_memory_study_note_repository.dart';
import 'package:library_seat_reservation/features/catalog/presentation/ai_study_provider.dart';
import 'package:library_seat_reservation/features/catalog/presentation/ai_study_summary_screen.dart';
import 'package:library_seat_reservation/features/catalog/presentation/book_detail_screen.dart';
import 'package:library_seat_reservation/features/catalog/presentation/study_notes_provider.dart';
import 'package:library_seat_reservation/features/reservations/presentation/preferences_provider.dart';

Future<ProviderContainer> _pumpBookFlow(
  WidgetTester tester, {
  FakeAiOutcome aiOutcome = FakeAiOutcome.success,
  bool initialConsent = false,
  InMemoryStudyNoteRepository? noteRepository,
}) async {
  tester.view.physicalSize = const Size(360, 800);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);

  final router = GoRouter(
    initialLocation: AppRoutes.bookDetail('9781119320913'),
    routes: [
      GoRoute(
        path: AppRoutes.catalog,
        builder: (context, state) => const Scaffold(body: Text('Catalog')),
        routes: [
          GoRoute(
            path: ':isbn',
            builder: (context, state) => BookDetailScreen(
              isbn: state.pathParameters['isbn']!,
            ),
            routes: [
              GoRoute(
                path: 'summary',
                builder: (context, state) => AiStudySummaryScreen(
                  isbn: state.pathParameters['isbn']!,
                  initialTopic: state.uri.queryParameters['topic'] ?? '',
                ),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.reservations,
        builder: (context, state) => const Scaffold(body: Text('Reservations')),
      ),
    ],
  );

  final container = ProviderContainer(
    overrides: [
      aiStudyServiceProvider.overrideWithValue(
        FakeAiStudyService(outcome: aiOutcome),
      ),
      studyNoteRepositoryProvider.overrideWithValue(
        noteRepository ?? InMemoryStudyNoteRepository(initialNotes: const []),
      ),
    ],
  );
  addTearDown(container.dispose);

  if (initialConsent) {
    container.read(userPreferencesProvider.notifier).setAiConsent(true);
  }

  await tester.pumpWidget(
    UncontrolledProviderScope(
      container: container,
      child: MaterialApp.router(
        theme: AppTheme.lightTheme,
        routerConfig: router,
      ),
    ),
  );
  await tester.pumpAndSettle();
  return container;
}

void main() {
  testWidgets('requires consent on first request and stays put on Cancel',
      (tester) async {
    final container = await _pumpBookFlow(tester);

    await tester.tap(find.text('Generate AI study summary'));
    await tester.pumpAndSettle();

    expect(find.text('Before we use AI'), findsOneWidget);
    await tester.tap(find.text('Cancel'));
    await tester.pumpAndSettle();

    expect(container.read(aiConsentProvider), isFalse);
    expect(find.byType(BookDetailScreen), findsOneWidget);
  });

  testWidgets('accepting consent shows AI summary preview and saves on confirm',
      (tester) async {
    final noteRepo = InMemoryStudyNoteRepository(initialNotes: const []);
    final container = await _pumpBookFlow(tester, noteRepository: noteRepo);

    await tester.tap(find.text('Generate AI study summary'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('I agree'));
    await tester.pumpAndSettle();

    expect(container.read(aiConsentProvider), isTrue);
    expect(find.text('AI study summary'), findsOneWidget);
    expect(find.text('AI-generated'), findsOneWidget);
    expect(find.text('Summary'), findsOneWidget);
    expect(find.text('Key concepts'), findsOneWidget);
    expect(find.text('Relevance to your syllabus'), findsOneWidget);

    // Discard should not save.
    await tester.scrollUntilVisible(
      find.text('Discard'),
      200,
      scrollable: find.byType(Scrollable).last,
    );
    await tester.ensureVisible(find.text('Discard'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Discard'));
    await tester.pumpAndSettle();
    expect(await noteRepo.getNotes('dummy-user-id'), isEmpty);

    // Second request skips modal because consent is already granted.
    await tester.scrollUntilVisible(
      find.text('Generate AI study summary'),
      200,
      scrollable: find.byType(Scrollable).last,
    );
    await tester.ensureVisible(find.text('Generate AI study summary'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Generate AI study summary'));
    await tester.pumpAndSettle();
    expect(find.text('Before we use AI'), findsNothing);
    expect(find.text('AI study summary'), findsOneWidget);

    await tester.scrollUntilVisible(
      find.text('Confirm & Save to Notes'),
      200,
      scrollable: find.byType(Scrollable).last,
    );
    await tester.ensureVisible(find.text('Confirm & Save to Notes'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Confirm & Save to Notes'));
    await tester.pumpAndSettle();

    final saved = await noteRepo.getNotes('dummy-user-id');
    expect(saved, hasLength(1));
    expect(saved.first.bookTitle, 'Operating System Concepts');
  });

  testWidgets('renders distinct failure views for timeout, blocked, and malformed',
      (tester) async {
    await _pumpBookFlow(
      tester,
      aiOutcome: FakeAiOutcome.timeout,
      initialConsent: true,
    );
    await tester.tap(find.text('Generate AI study summary'));
    await tester.pumpAndSettle();
    expect(find.text('Response timed out'), findsOneWidget);
    expect(find.text('Retry'), findsOneWidget);

    await _pumpBookFlow(
      tester,
      aiOutcome: FakeAiOutcome.safetyBlocked,
      initialConsent: true,
    );
    await tester.tap(find.text('Generate AI study summary'));
    await tester.pumpAndSettle();
    expect(find.text('Prompt blocked by safety filter'), findsOneWidget);
    expect(find.text('Retry'), findsNothing);

    await _pumpBookFlow(
      tester,
      aiOutcome: FakeAiOutcome.malformedOutput,
      initialConsent: true,
    );
    await tester.tap(find.text('Generate AI study summary'));
    await tester.pumpAndSettle();
    expect(find.text('Unreadable AI output'), findsOneWidget);
    expect(find.text('Retry'), findsOneWidget);
  });
}
