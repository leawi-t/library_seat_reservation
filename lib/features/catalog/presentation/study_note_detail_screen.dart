import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/app_router.dart';
import '../../../core/theme/app_theme.dart';
import '../domain/study_note.dart';
import 'study_notes_provider.dart';
import 'widgets/ai_generated_badge.dart';

class StudyNoteDetailScreen extends ConsumerWidget {
  const StudyNoteDetailScreen({required this.noteId, super.key});

  final String noteId;

  Future<void> _confirmDelete(BuildContext context, WidgetRef ref) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete study note?'),
        content: const Text(
          'This removes the saved AI study summary from your notes.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Keep'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirmed != true || !context.mounted) return;
    await ref.read(studyNotesProvider.notifier).deleteNote(noteId);
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Study note deleted')),
    );
    context.go(AppRoutes.reservations);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final noteAsync = ref.watch(studyNoteDetailProvider(noteId));
    final loadedNote = noteAsync.value;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          tooltip: 'Back to My reservations',
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go(AppRoutes.reservations),
        ),
        title: const Text('Saved study note'),
        actions: [
          if (loadedNote != null)
            IconButton(
              tooltip: 'Delete note',
              icon: const Icon(Icons.delete_outline),
              onPressed: () => _confirmDelete(context, ref),
            ),
        ],
      ),
      body: noteAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(
          child: FilledButton(
            onPressed: () => ref.invalidate(studyNoteDetailProvider(noteId)),
            child: const Text('Could not load study note. Retry'),
          ),
        ),
        data: (note) {
          if (note == null) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(AppTheme.spacingMd),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Study note not found.'),
                    const SizedBox(height: AppTheme.spacingMd),
                    OutlinedButton(
                      onPressed: () => context.go(AppRoutes.reservations),
                      child: const Text('Back to My reservations'),
                    ),
                  ],
                ),
              ),
            );
          }

          return _StudyNoteBody(note: note);
        },
      ),
    );
  }
}

class _StudyNoteBody extends StatelessWidget {
  const _StudyNoteBody({required this.note});

  final StudyNote note;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 760),
        child: ListView(
          padding: const EdgeInsets.all(AppTheme.spacingMd),
          children: [
            Text(
              note.bookTitle,
              style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: AppTheme.spacingXs),
            Text(
              'Topic: ${note.studyTopicQuery} · ISBN ${note.isbn}',
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
                child: SelectableText(
                  note.aiSummaryMarkdown,
                  style: textTheme.bodyMedium,
                ),
              ),
            ),
            const SizedBox(height: AppTheme.spacingMd),
            OutlinedButton(
              onPressed: () => context.go(AppRoutes.bookDetail(note.isbn)),
              child: const Text('Open book details'),
            ),
          ],
        ),
      ),
    );
  }
}
