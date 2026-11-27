import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_router.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../domain/reservation.dart';
import '../preferences_provider.dart';
import '../reservations_provider.dart';
import 'reservation_status_chip.dart';

/// Shows the active reservation with countdown, check-in and cancel actions.
class ActiveReservationCard extends ConsumerWidget {
  const ActiveReservationCard({required this.reservation, super.key});

  final Reservation reservation;

  Future<void> _confirmCancel(BuildContext context, WidgetRef ref) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Cancel reservation?'),
        content: Text(
          'Seat ${reservation.seatCode} will be released for other students.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: const Text('Keep it'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: const Text('Yes, cancel'),
          ),
        ],
      ),
    );
    if (confirmed != true) return;

    await ref.read(myReservationsProvider.notifier).cancel(reservation.id);
    if (!context.mounted) return;
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Reservation cancelled')));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;
    final countdown = ref.watch(reservationCountdownProvider).value;
    final leadMinutes = ref.watch(
      userPreferencesProvider.select((prefs) => prefs.reminderLeadMinutes),
    );

    final start = TimeOfDay.fromDateTime(reservation.startTime).format(context);
    final end = TimeOfDay.fromDateTime(reservation.endTime).format(context);
    final reminderAt = TimeOfDay.fromDateTime(
      reservation.reminderTimeFor(leadMinutes),
    ).format(context);

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.md),
        side: BorderSide(color: colors.outline),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'ACTIVE RESERVATION',
                    style: textTheme.labelMedium
                        ?.copyWith(color: colors.onSurfaceVariant),
                  ),
                ),
                ReservationStatusChip(status: reservation.status),
              ],
            ),
            const SizedBox(height: AppSpacing.sm),
            Text('Seat ${reservation.seatCode}', style: textTheme.titleLarge),
            Text(
              '$start – $end',
              style: textTheme.bodyMedium
                  ?.copyWith(color: colors.onSurfaceVariant),
            ),
            const SizedBox(height: AppSpacing.md),
            Center(
              child: FittedBox(
                child: Text(
                  countdown?.formatted ?? '--:--:--',
                  style: textTheme.displayMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            LinearProgressIndicator(
              value: countdown?.progress ?? 0,
              semanticsLabel: 'Time remaining',
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              reservation.reminderEnabled
                  ? 'Reminder at $reminderAt (or in-app banner)'
                  : 'Reminder off',
              style: textTheme.bodySmall
                  ?.copyWith(color: colors.onSurfaceVariant),
            ),
            const SizedBox(height: AppSpacing.md),
            Wrap(
              spacing: AppSpacing.sm,
              runSpacing: AppSpacing.sm,
              children: [
                if (reservation.canCheckIn)
                  FilledButton(
                    onPressed: () => context.go(AppRoutes.scanner),
                    child: const Text('Check in (scan)'),
                  ),
                OutlinedButton(
                  onPressed: () => _confirmCancel(context, ref),
                  child: const Text('Cancel reservation'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
