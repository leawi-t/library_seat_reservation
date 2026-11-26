import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_router.dart';
import '../../../../core/theme/app_spacing.dart';

class NoActiveReservationCard extends StatelessWidget {
  const NoActiveReservationCard({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('No active reservation', style: textTheme.titleMedium),
            const SizedBox(height: AppSpacing.xs),
            Text(
              'Find a seat with a power outlet and reserve it for 1 to 3 hours.',
              style: textTheme.bodyMedium
                  ?.copyWith(color: colors.onSurfaceVariant),
            ),
            const SizedBox(height: AppSpacing.md),
            FilledButton.tonal(
              onPressed: () => context.go(AppRoutes.seats),
              child: const Text('Browse seats'),
            ),
          ],
        ),
      ),
    );
  }
}
