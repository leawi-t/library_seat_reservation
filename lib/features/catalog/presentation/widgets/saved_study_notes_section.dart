import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../domain/study_note.dart';
import '../study_notes_provider.dart';
import 'book_cover_placeholder.dart';

/// Saved AI study notes list shown on Screen 5 (My Reservations & Notes).
class SavedStudyNotesSection extends ConsumerWidget {
  const SavedStudyNotesSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notesAsync = ref.watch(studyNotesProvider);
    final textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text('Saved study notes', style: textTheme.titleLarge),
            ),
            notesAsync.maybeWhen(
              data: (notes) => Text(
                '${notes.length}',
                style: textTheme.titleMedium?.copyWith(
                  color: colors.onSurfaceVariant,
                ),
              ),
              orElse: () => const SizedBox.shrink(),
            ),
          ],
        ),
        const SizedBox(height: AppTheme.spacingSm),
        notesAsync.when(
          loading: () => const Padding(
            padding: EdgeInsets.symmetric(vertical: AppTheme.spacingMd),
            child: LinearProgressIndicator(),
          ),
          error: (error, stackTrace) => Card.outlined(
            child: Padding(
              padding: const EdgeInsets.all(AppTheme.spacingMd),
              child: Row(
                children: [
                  const Expanded(
                    child: Text('Could not load saved study notes.'),
                  ),
                  TextButton(
                    onPressed: () => ref.invalidate(studyNotesProvider),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
          ),
          data: (notes) {
            if (notes.isEmpty) {
              return Card.outlined(
                child: Padding(
                  padding: const EdgeInsets.all(AppTheme.spacingMd),
                  child: Text(
                    'No saved study notes yet. Open any book in the catalog '
                    'to generate and save an AI study summary.',
                    style: textTheme.bodyMedium?.copyWith(
                      color: colors.onSurfaceVariant,
                    ),
                  ),
                ),
              );
            }

            return Column(
              children: [
                for (var i = 0; i < notes.length; i++) ...[
                  if (i > 0) const SizedBox(height: AppTheme.spacingSm),
                  _StudyNoteTile(note: notes[i]),
                ],
              ],
            );
          },
        ),
      ],
    );
  }
}

class _StudyNoteTile extends StatelessWidget {
  const _StudyNoteTile({required this.note});

  final StudyNote note;

  static const List<String> _months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];

  String _formatDate(DateTime date) =>
      '${date.day} ${_months[date.month - 1]}';

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;

    return Card.outlined(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => context.go(AppRoutes.studyNoteDetail(note.id)),
        child: Padding(
          padding: const EdgeInsets.all(AppTheme.spacingSm + 4),
          child: Row(
            children: [
              BookCoverPlaceholder(
                title: note.bookTitle,
                width: 40,
                height: 48,
              ),
              const SizedBox(width: AppTheme.spacingMd),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      note.bookTitle,
                      style: textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '${note.studyTopicQuery} · ${_formatDate(note.createdAt)}',
                      style: textTheme.bodySmall?.copyWith(
                        color: colors.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: colors.onSurfaceVariant,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
