import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../reservations/presentation/preferences_provider.dart';
import '../data/fake_ai_study_service.dart';
import '../domain/ai_study_exception.dart';
import '../domain/ai_study_service.dart';
import '../domain/ai_study_summary.dart';
import '../domain/book_item.dart';
import 'study_notes_provider.dart';

final aiStudyServiceProvider = Provider<AiStudyService>((ref) {
  return FakeAiStudyService();
});

/// Single-source-of-truth AI consent flag shared with UserPreferences
/// (toggled in Seat Detail, Preferences on Screen 5, and the AI consent modal).
final aiConsentProvider = Provider<bool>((ref) {
  return ref.watch(
    userPreferencesProvider.select((prefs) => prefs.hasGrantedAiConsent),
  );
});

final aiStudySummaryProvider =
    NotifierProvider<AiStudySummaryNotifier, AsyncValue<AiStudySummary?>>(
  AiStudySummaryNotifier.new,
);

class AiStudySummaryNotifier extends Notifier<AsyncValue<AiStudySummary?>> {
  BookItem? _lastBook;
  String? _lastTopic;

  @override
  AsyncValue<AiStudySummary?> build() => const AsyncData(null);

  Future<void> generate({
    required BookItem book,
    required String topic,
  }) async {
    final trimmedTopic = topic.trim();
    if (trimmedTopic.isEmpty) return;

    _lastBook = book;
    _lastTopic = trimmedTopic;

    final service = ref.read(aiStudyServiceProvider);
    final hasConsent = ref.read(aiConsentProvider);
    if (service.sendsDataOffDevice && !hasConsent) {
      state = AsyncError(
        const AiSafetyBlockedException(
          'Consent is required before sending book details to Gemini.',
        ),
        StackTrace.current,
      );
      return;
    }

    state = const AsyncLoading();
    try {
      final summary = await service.generateSummary(
        book: book,
        topic: trimmedTopic,
      );
      state = AsyncData(summary);
    } on AiStudyException catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);
    } catch (_, stackTrace) {
      state = AsyncError(const AiNetworkException(), stackTrace);
    }
  }

  Future<void> retry() async {
    final book = _lastBook;
    final topic = _lastTopic;
    if (book == null || topic == null) return;
    await generate(book: book, topic: topic);
  }

  void discard() {
    state = const AsyncData(null);
  }

  Future<bool> confirmAndSave() async {
    final summary = state.value;
    if (summary == null) return false;
    await ref.read(studyNotesProvider.notifier).saveSummary(summary);
    state = const AsyncData(null);
    return true;
  }
}
