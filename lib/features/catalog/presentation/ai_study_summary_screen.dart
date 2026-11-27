import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/app_router.dart';
import '../../../core/theme/app_theme.dart';
import '../domain/ai_study_exception.dart';
import '../domain/ai_study_summary.dart';
import 'ai_study_provider.dart';
import 'catalog_provider.dart';
import 'widgets/ai_generated_badge.dart';

class AiStudySummaryScreen extends ConsumerStatefulWidget {
  const AiStudySummaryScreen({
    required this.isbn,
    this.initialTopic = '',
    super.key,
  });

  final String isbn;
  final String initialTopic;

  @override
  ConsumerState<AiStudySummaryScreen> createState() =>
      _AiStudySummaryScreenState();
}

class _AiStudySummaryScreenState extends ConsumerState<AiStudySummaryScreen> {
  bool _requestedOnOpen = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _maybeGenerateFromDeepLink();
    });
  }

  Future<void> _maybeGenerateFromDeepLink() async {
    if (_requestedOnOpen || !mounted) return;
    _requestedOnOpen = true;

    final current = ref.read(aiStudySummaryProvider);
    final topic = widget.initialTopic.trim();
    if (current.isLoading ||
        current.hasError ||
        current.value != null ||
        topic.isEmpty) {
      return;
    }

    final book = await ref.read(bookDetailProvider(widget.isbn).future);
    if (!mounted || book == null) return;
    await ref
        .read(aiStudySummaryProvider.notifier)
        .generate(book: book, topic: topic);
  }

  void _discard() {
    ref.read(aiStudySummaryProvider.notifier).discard();
    context.go(AppRoutes.bookDetail(widget.isbn));
  }

  Future<void> _confirmAndSave() async {
    final saved =
        await ref.read(aiStudySummaryProvider.notifier).confirmAndSave();
    if (!mounted) return;
    if (saved) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Saved to study notes'),
          action: SnackBarAction(
            label: 'View',
            onPressed: () => context.go(AppRoutes.reservations),
          ),
        ),
      );
      context.go(AppRoutes.bookDetail(widget.isbn));
    }
  }

  @override
  Widget build(BuildContext context) {
    final summaryAsync = ref.watch(aiStudySummaryProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          tooltip: 'Back to book details',
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go(AppRoutes.bookDetail(widget.isbn)),
        ),
        title: const Text('AI study summary'),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 760),
          child: summaryAsync.when(
            loading: () => const Center(
              child: Padding(
                padding: EdgeInsets.all(AppTheme.spacingLg),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: AppTheme.spacingMd),
                    Text('Generating AI study summary...'),
                  ],
                ),
              ),
            ),
            error: (error, stackTrace) => _ErrorView(
              error: error,
              onRetry: () =>
                  ref.read(aiStudySummaryProvider.notifier).retry(),
              onBackToBook: () =>
                  context.go(AppRoutes.bookDetail(widget.isbn)),
            ),
            data: (summary) {
              if (summary == null) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(AppTheme.spacingMd),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Enter a study topic on the book page to generate '
                          'a summary.',
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: AppTheme.spacingMd),
                        FilledButton(
                          onPressed: () =>
                              context.go(AppRoutes.bookDetail(widget.isbn)),
                          child: const Text('Go to book details'),
                        ),
                      ],
                    ),
                  ),
                );
              }

              return _SummaryPreviewBody(
                summary: summary,
                onDiscard: _discard,
                onConfirmAndSave: _confirmAndSave,
              );
            },
          ),
        ),
      ),
    );
  }
}

class _SummaryPreviewBody extends StatelessWidget {
  const _SummaryPreviewBody({
    required this.summary,
    required this.onDiscard,
    required this.onConfirmAndSave,
  });

  final AiStudySummary summary;
  final VoidCallback onDiscard;
  final VoidCallback onConfirmAndSave;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;

    return ListView(
      padding: const EdgeInsets.all(AppTheme.spacingMd),
      children: [
        Text(
          summary.bookTitle,
          style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: AppTheme.spacingXs),
        Text(
          'Topic: ${summary.topic}',
          style: textTheme.bodyMedium?.copyWith(
            color: colors.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: AppTheme.spacingSm),
        const AiGeneratedBadge(),
        const SizedBox(height: AppTheme.spacingMd),
        Card.outlined(
          child: Padding(
            padding: const EdgeInsets.all(AppTheme.spacingMd),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Summary',
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: AppTheme.spacingXs),
                Text(summary.summary, style: textTheme.bodyMedium),
                const SizedBox(height: AppTheme.spacingMd),
                Text(
                  'Key concepts',
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: AppTheme.spacingXs),
                for (final concept in summary.keyConcepts) ...[
                  Padding(
                    padding: const EdgeInsets.only(bottom: AppTheme.spacingXs),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('• '),
                        Expanded(child: Text(concept)),
                      ],
                    ),
                  ),
                ],
                const SizedBox(height: AppTheme.spacingSm),
                Text(
                  'Relevance to your syllabus',
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: AppTheme.spacingXs),
                Text(summary.syllabusRelevance, style: textTheme.bodyMedium),
              ],
            ),
          ),
        ),
        const SizedBox(height: AppTheme.spacingSm),
        Text(
          'May contain inaccuracies. Review before saving.',
          textAlign: TextAlign.center,
          style: textTheme.bodySmall?.copyWith(
            color: colors.onSurfaceVariant,
            fontStyle: FontStyle.italic,
          ),
        ),
        const SizedBox(height: AppTheme.spacingMd),
        Wrap(
          spacing: AppTheme.spacingSm,
          runSpacing: AppTheme.spacingSm,
          alignment: WrapAlignment.end,
          children: [
            OutlinedButton(
              onPressed: onDiscard,
              child: const Text('Discard'),
            ),
            FilledButton(
              onPressed: onConfirmAndSave,
              child: const Text('Confirm & Save to Notes'),
            ),
          ],
        ),
      ],
    );
  }
}

class _ErrorView extends StatelessWidget {
  const _ErrorView({
    required this.error,
    required this.onRetry,
    required this.onBackToBook,
  });

  final Object error;
  final VoidCallback onRetry;
  final VoidCallback onBackToBook;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final (IconData icon, String title, String message, bool canRetry) =
        switch (error) {
      AiTimeoutException e => (
          Icons.schedule_outlined,
          'Response timed out',
          e.message,
          e.canRetry,
        ),
      AiSafetyBlockedException e => (
          Icons.shield_outlined,
          'Prompt blocked by safety filter',
          e.message,
          e.canRetry,
        ),
      AiMalformedOutputException e => (
          Icons.warning_amber_rounded,
          'Unreadable AI output',
          e.message,
          e.canRetry,
        ),
      AiNetworkException e => (
          Icons.wifi_off_outlined,
          'Connection error',
          e.message,
          e.canRetry,
        ),
      _ => (
          Icons.error_outline,
          'Could not generate summary',
          error.toString(),
          true,
        ),
    };

    return Padding(
      padding: const EdgeInsets.all(AppTheme.spacingMd),
      child: Center(
        child: Card.outlined(
          child: Padding(
            padding: const EdgeInsets.all(AppTheme.spacingLg),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, size: 40, color: colors.error),
                const SizedBox(height: AppTheme.spacingSm),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: AppTheme.spacingXs),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: textTheme.bodyMedium?.copyWith(
                    color: colors.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: AppTheme.spacingMd),
                Wrap(
                  spacing: AppTheme.spacingSm,
                  runSpacing: AppTheme.spacingSm,
                  alignment: WrapAlignment.center,
                  children: [
                    OutlinedButton(
                      onPressed: onBackToBook,
                      child: const Text('Edit topic'),
                    ),
                    if (canRetry)
                      FilledButton(
                        onPressed: onRetry,
                        child: const Text('Retry'),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
