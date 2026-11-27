import '../domain/ai_study_exception.dart';
import '../domain/ai_study_service.dart';
import '../domain/ai_study_summary.dart';
import '../domain/book_item.dart';

enum FakeAiOutcome {
  success,
  timeout,
  safetyBlocked,
  malformedOutput,
  networkError,
}

class FakeAiStudyService implements AiStudyService {
  FakeAiStudyService({
    this.outcome = FakeAiOutcome.success,
    this.delay = Duration.zero,
    this.sendsDataOffDevice = true,
    DateTime Function()? clock,
  }) : _clock = clock ?? DateTime.now;

  final FakeAiOutcome outcome;
  final Duration delay;

  @override
  final bool sendsDataOffDevice;

  final DateTime Function() _clock;

  @override
  Future<AiStudySummary> generateSummary({
    required BookItem book,
    required String topic,
  }) async {
    if (delay > Duration.zero) {
      await Future<void>.delayed(delay);
    }

    switch (outcome) {
      case FakeAiOutcome.timeout:
        throw const AiTimeoutException();
      case FakeAiOutcome.safetyBlocked:
        throw const AiSafetyBlockedException();
      case FakeAiOutcome.networkError:
        throw const AiNetworkException();
      case FakeAiOutcome.malformedOutput:
        // Exercise the domain validation guard directly.
        return AiStudySummary(
          isbn: book.isbn,
          bookTitle: book.title,
          topic: topic.trim(),
          summary: '',
          keyConcepts: const [],
          syllabusRelevance: '',
          generatedAt: _clock(),
        ).validated();
      case FakeAiOutcome.success:
        final cleanTopic = topic.trim();
        final tagsText = book.subjectTags.isEmpty
            ? 'core course themes'
            : book.subjectTags.take(3).join(', ');

        return AiStudySummary(
          isbn: book.isbn,
          bookTitle: book.title,
          topic: cleanTopic,
          summary:
              '${book.title} (${book.authorsLabel}) introduces $cleanTopic '
              'with concrete examples, formal definitions, and worked '
              'trade-offs suitable for exam revision.',
          keyConcepts: [
            'Core principles and terminology of $cleanTopic',
            'Design trade-offs and edge cases in $tagsText',
            'Worked examples and review questions from ${book.publicationLabel}',
          ],
          syllabusRelevance:
              'Relevant to coursework covering $cleanTopic and $tagsText. '
              'Useful as a reference text when preparing for labs and exams.',
          generatedAt: _clock(),
        ).validated();
    }
  }
}
