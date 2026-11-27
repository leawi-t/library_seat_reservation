import 'package:flutter/material.dart';

import '../../../../core/theme/app_spacing.dart';
import '../../domain/seat.dart';

/// Stand-in for the seat photo / floor map from the sketch.
class SeatMapPlaceholder extends StatelessWidget {
  const SeatMapPlaceholder({required this.seat, super.key});

  final Seat seat;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return AspectRatio(
      aspectRatio: 16 / 7,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: colors.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(AppSpacing.md),
        ),
        child: Stack(
          children: [
            Center(
              child: FractionallySizedBox(
                heightFactor: 0.5,
                child: FittedBox(
                  child: Icon(
                    Icons.event_seat,
                    color: colors.onSurfaceVariant,
                    semanticLabel: 'Seat ${seat.code}',
                  ),
                ),
              ),
            ),
            if (seat.hasPowerOutlet)
              Positioned(
                top: AppSpacing.md,
                right: AppSpacing.md,
                child: Column(
                  children: [
                    Icon(Icons.power, color: colors.onSurfaceVariant),
                    Text(
                      'wall outlet',
                      style: textTheme.labelSmall
                          ?.copyWith(color: colors.onSurfaceVariant),
                    ),
                  ],
                ),
              ),
            Positioned(
              left: AppSpacing.md,
              bottom: AppSpacing.sm,
              child: Text(
                '[ photo / floor map ]',
                style: textTheme.labelSmall?.copyWith(
                  color: colors.onSurfaceVariant,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
