import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/app_router.dart';
import '../../../core/theme/app_theme.dart';
import '../../reservations/presentation/preferences_provider.dart';
import '../domain/book_item.dart';
import 'ai_study_provider.dart';
import 'catalog_provider.dart';
import 'widgets/ai_consent_dialog.dart';
import 'widgets/availability_badge.dart';
import 'widgets/book_cover_placeholder.dart';

class BookDetailScreen extends ConsumerWidget {
  const BookDetailScreen({required this.isbn, super.key});

  final String isbn;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookAsync = ref.watch(bookDetailProvider(isbn));

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          tooltip: 'Back to catalog',
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go(AppRoutes.catalog),
        ),
        title: const Text('Book details'),
      ),
      body: bookAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Could not load book details.'),
              const SizedBox(height: AppTheme.spacingSm),
              FilledButton(
                onPressed: () => ref.invalidate(bookDetailProvider(isbn)),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
        data: (book) {
          if (book == null) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(AppTheme.spacingMd),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Book not found for ISBN $isbn.',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: AppTheme.spacingMd),
                    OutlinedButton(
                      onPressed: () => context.go(AppRoutes.catalog),
                      child: const Text('Back to catalog'),
                    ),
                  ],
                ),
              ),
            );
          }

          return _BookDetailBody(book: book);
        },
      ),
    );
  }
}

class _BookDetailBody extends ConsumerStatefulWidget {
  const _BookDetailBody({required this.book});

  final BookItem book;

  @override
  ConsumerState<_BookDetailBody> createState() => _BookDetailBodyState();
}

class _BookDetailBodyState extends ConsumerState<_BookDetailBody> {
  final TextEditingController _topicController = TextEditingController();
  String? _topicError;

  @override
  void initState() {
    super.initState();
    if (widget.book.subjectTags.isNotEmpty) {
      _topicController.text = widget.book.subjectTags.last;
    }
  }

  @override
  void dispose() {
    _topicController.dispose();
    super.dispose();
  }

  Future<void> _requestSummary() async {
    final topic = _topicController.text.trim();
    if (topic.isEmpty) {
      setState(() {
        _topicError = 'Enter a study topic first.';
      });
      return;
    }

    final service = ref.read(aiStudyServiceProvider);
    var hasConsent = ref.read(aiConsentProvider);

    if (service.sendsDataOffDevice && !hasConsent) {
      final agreed = await AiConsentDialog.show(context);
      if (!mounted) return;
      if (!agreed) return;
      ref.read(userPreferencesProvider.notifier).setAiConsent(true);
      hasConsent = true;
    }

    if (!hasConsent && service.sendsDataOffDevice) return;

    ref.read(aiStudySummaryProvider.notifier).generate(
          book: widget.book,
          topic: topic,
        );
    context.go(AppRoutes.aiSummary(widget.book.isbn, topic: topic));
  }

  @override
  Widget build(BuildContext context) {
    final book = widget.book;
    final textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 760),
        child: ListView(
          padding: const EdgeInsets.all(AppTheme.spacingMd),
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BookCoverPlaceholder(
                  title: book.title,
                  width: 84,
                  height: 120,
                ),
                const SizedBox(width: AppTheme.spacingMd),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        book.title,
                        style: textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: AppTheme.spacingXs),
                      Text(
                        book.authorsLabel,
                        style: textTheme.bodyMedium?.copyWith(
                          color: colors.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        book.publicationLabel,
                        style: textTheme.bodySmall?.copyWith(
                          color: colors.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(height: AppTheme.spacingSm),
                      AvailabilityBadge(book: book),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppTheme.spacingMd),
            if (book.subjectTags.isNotEmpty) ...[
              Wrap(
                spacing: AppTheme.spacingSm,
                runSpacing: AppTheme.spacingSm,
                children: [
                  for (final tag in book.subjectTags)
                    ActionChip(
                      label: Text(tag),
                      onPressed: () {
                        setState(() {
                          _topicController.text = tag;
                          _topicError = null;
                        });
                      },
                    ),
                ],
              ),
              const SizedBox(height: AppTheme.spacingMd),
            ],
            Text(
              'ISBN ${book.isbn}',
              style: textTheme.bodySmall?.copyWith(
                color: colors.onSurfaceVariant,
              ),
            ),
            const Divider(height: AppTheme.spacingXl),
            Text(
              'Study topic for AI summary',
              style: textTheme.titleMedium,
            ),
            const SizedBox(height: AppTheme.spacingSm),
            TextField(
              controller: _topicController,
              textInputAction: TextInputAction.done,
              onSubmitted: (_) => _requestSummary(),
              onChanged: (_) {
                if (_topicError != null) {
                  setState(() {
                    _topicError = null;
                  });
                }
              },
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'Course topic',
                hintText: 'e.g. Process scheduling',
                errorText: _topicError,
              ),
            ),
            const SizedBox(height: AppTheme.spacingMd),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: _requestSummary,
                icon: const Icon(Icons.auto_awesome),
                label: const Text('Generate AI study summary'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
