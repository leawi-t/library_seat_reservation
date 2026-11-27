import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../domain/book_item.dart';

class AvailabilityBadge extends StatelessWidget {
  const AvailabilityBadge({required this.book, super.key});

  final BookItem book;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final available = book.hasAvailableCopies;
    final backgroundColor =
        available ? const Color(0xFFE3F2E6) : colors.surfaceContainerHighest;
    final foregroundColor =
        available ? const Color(0xFF1B5E20) : colors.onSurfaceVariant;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppTheme.spacingSm,
        vertical: AppTheme.spacingXs,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(
          color: available ? const Color(0xFF66BB6A) : colors.outlineVariant,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            available
                ? Icons.check_circle_outline
                : Icons.remove_circle_outline,
            size: 14,
            color: foregroundColor,
          ),
          const SizedBox(width: AppTheme.spacingXs),
          Text(
            book.availabilityLabel,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: foregroundColor,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ],
      ),
    );
  }
}
