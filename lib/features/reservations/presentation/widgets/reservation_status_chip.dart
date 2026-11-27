import 'package:flutter/material.dart';

import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_status_colors.dart';
import '../../domain/reservation.dart';

class ReservationStatusChip extends StatelessWidget {
  const ReservationStatusChip({required this.status, super.key});

  final ReservationStatus status;

  @override
  Widget build(BuildContext context) {
    final palette = AppStatusColors.of(context);
    final (label, background, foreground) = switch (status) {
      ReservationStatus.reserved => (
          'Reserved',
          palette.reserved,
          palette.onReserved,
        ),
      ReservationStatus.checkedIn => (
          'Checked in',
          palette.checkedIn,
          palette.onCheckedIn,
        ),
      ReservationStatus.cancelled => (
          'Cancelled',
          palette.cancelled,
          palette.onCancelled,
        ),
      ReservationStatus.expired => (
          'Expired',
          palette.expired,
          palette.onExpired,
        ),
    };

    return DecoratedBox(
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(AppSpacing.md),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm + AppSpacing.xs,
          vertical: AppSpacing.xs,
        ),
        child: Text(
          label,
          style: Theme.of(context)
              .textTheme
              .labelMedium
              ?.copyWith(color: foreground, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
