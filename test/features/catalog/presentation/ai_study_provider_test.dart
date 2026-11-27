import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:library_seat_reservation/features/catalog/data/fake_ai_study_service.dart';
import 'package:library_seat_reservation/features/catalog/data/in_memory_study_note_repository.dart';
import 'package:library_seat_reservation/features/catalog/domain/ai_study_exception.dart';
import 'package:library_seat_reservation/features/catalog/domain/book_item.dart';
import 'package:library_seat_reservation/features/catalog/presentation/ai_study_provider.dart';
import 'package:library_seat_reservation/features/catalog/presentation/study_notes_provider.dart';
import 'package:library_seat_reservation/features/reservations/presentation/clock_provider.dart';
import 'package:library_seat_reservation/features/reservations/presentation/preferences_provider.dart';

void main() {
  const sampleBook = BookItem(
    isbn: '9781119320913',
    title: 'Operating System Concepts',
    authors: ['Silberschatz', 'Galvin', 'Gagne'],
    publishYear: 2018,
    edition: '10th ed.',
    coverUrl: '',
    subjectTags: ['OS concepts', 'Process scheduling'],
    availableReferenceCopies: 2,
  );

  ProviderContainer makeContainer({
    FakeAiOutcome outcome = FakeAiOutcome.success,
    InMemoryStudyNoteRepository? noteRepo,
  }) {
    final fixedNow = DateTime(2026, 11, 27, 12, 0);
    final container = ProviderContainer(
      overrides: [
        aiStudyServiceProvider.overrideWithValue(
          FakeAiStudyService(outcome: outcome, clock: () => fixedNow),
        ),
        studyNoteRepositoryProvider.overrideWithValue(
          noteRepo ?? InMemoryStudyNoteRepository(initialNotes: const []),
        ),
        clockProvider.overrideWithValue(() => fixedNow),
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  group('AiStudySummaryNotifier', () {
    test('refuses off-device AI call when consent has not been granted',
        () async {
      final container = makeContainer();

      await container
          .read(aiStudySummaryProvider.notifier)
          .generate(book: sampleBook, topic: 'Process scheduling');

      final state = container.read(aiStudySummaryProvider);
      expect(state.hasError, isTrue);
      expect(state.error, isA<AiSafetyBlockedException>());
    });

    test('generates summary after consent and only saves on confirmation',
        () async {
      final container = makeContainer();
      container.read(userPreferencesProvider.notifier).setAiConsent(true);

      await container
          .read(aiStudySummaryProvider.notifier)
          .generate(book: sampleBook, topic: 'Process scheduling');

      final preview = container.read(aiStudySummaryProvider).value;
      expect(preview, isNotNull);
      expect(preview?.topic, 'Process scheduling');

      // Nothing saved while only previewing.
      expect(await container.read(studyNotesProvider.future), isEmpty);

      // Discarding leaves saved notes empty.
      container.read(aiStudySummaryProvider.notifier).discard();
      expect(container.read(aiStudySummaryProvider).value, isNull);
      expect(await container.read(studyNotesProvider.future), isEmpty);

      // Re-generate and confirm saving.
      await container
          .read(aiStudySummaryProvider.notifier)
          .generate(book: sampleBook, topic: 'Deadlocks');
      final saved =
          await container.read(aiStudySummaryProvider.notifier).confirmAndSave();
      expect(saved, isTrue);

      final notes = await container.read(studyNotesProvider.future);
      expect(notes, hasLength(1));
      expect(notes.first.studyTopicQuery, 'Deadlocks');
    });

    test('exposes typed AiStudyException on timeout, blocked, and malformed',
        () async {
      for (final entry in {
        FakeAiOutcome.timeout: isA<AiTimeoutException>(),
        FakeAiOutcome.safetyBlocked: isA<AiSafetyBlockedException>(),
        FakeAiOutcome.malformedOutput: isA<AiMalformedOutputException>(),
        FakeAiOutcome.networkError: isA<AiNetworkException>(),
      }.entries) {
        final container = makeContainer(outcome: entry.key);
        container.read(userPreferencesProvider.notifier).setAiConsent(true);

        await container
            .read(aiStudySummaryProvider.notifier)
            .generate(book: sampleBook, topic: 'Scheduling');

        final state = container.read(aiStudySummaryProvider);
        expect(state.hasError, isTrue);
        expect(state.error, entry.value);
      }
    });
  });
}
