import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/app_router.dart';
import '../../../core/theme/app_spacing.dart';
import '../../reservations/presentation/preferences_provider.dart';
import '../domain/booking_draft.dart';
import '../domain/seat.dart';
import 'booking_draft_provider.dart';
import 'seats_provider.dart';
import 'widgets/seat_map_placeholder.dart';

class SeatDetailScreen extends ConsumerWidget {
  const SeatDetailScreen({required this.seatId, super.key});

  final String seatId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final seatAsync = ref.watch(seatDetailProvider(seatId));
    final loadedSeat = seatAsync.value;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          tooltip: 'Back to seats',
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go(AppRoutes.seats),
        ),
        title: Text(loadedSeat == null ? 'Seat' : 'Seat ${loadedSeat.code}'),
      ),
      body: seatAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(
          child: FilledButton(
            onPressed: () => ref.invalidate(seatDetailProvider(seatId)),
            child: const Text('Could not load seat. Retry'),
          ),
        ),
        data: (seat) => seat == null
            ? const Center(child: Text('Seat not found'))
            : _SeatBookingBody(seat: seat),
      ),
    );
  }
}

class _SeatBookingBody extends ConsumerWidget {
  const _SeatBookingBody({required this.seat});

  final Seat seat;

  Future<void> _reserve(BuildContext context, WidgetRef ref) async {
    final failure = await ref.read(bookingDraftProvider.notifier).submit(seat);
    if (!context.mounted) return;
    if (failure != null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(failure.message)));
      return;
    }
    context.go(AppRoutes.reservations);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;
    final draft = ref.watch(bookingDraftProvider);
    final draftNotifier = ref.read(bookingDraftProvider.notifier);
    final leadMinutes = ref.watch(
      userPreferencesProvider.select((prefs) => prefs.reminderLeadMinutes),
    );
    final aiConsent = ref.watch(
      userPreferencesProvider.select((prefs) => prefs.hasGrantedAiConsent),
    );

    final start = TimeOfDay.fromDateTime(draft.startTime).format(context);
    final end = TimeOfDay.fromDateTime(draft.endTime).format(context);

    return ListView(
      padding: const EdgeInsets.all(AppSpacing.md),
      children: [
        SeatMapPlaceholder(seat: seat),
        const SizedBox(height: AppSpacing.md),
        Wrap(
          spacing: AppSpacing.sm,
          runSpacing: AppSpacing.sm,
          children: [
            Chip(label: Text(seat.floorArea)),
            if (seat.hasPowerOutlet)
              const Chip(
                avatar: Icon(Icons.power),
                label: Text('Power outlet'),
              ),
            if (seat.isQuietZone) const Chip(label: Text('Quiet zone')),
          ],
        ),
        const SizedBox(height: AppSpacing.lg),
        Text('Duration', style: textTheme.titleMedium),
        const SizedBox(height: AppSpacing.sm),
        SizedBox(
          width: double.infinity,
          child: SegmentedButton<int>(
            segments: [
              for (final hours in BookingDraft.allowedDurationHours)
                ButtonSegment<int>(
                  value: hours,
                  label: Text(BookingDraft.durationLabel(hours)),
                ),
            ],
            selected: {draft.durationHours},
            showSelectedIcon: false,
            onSelectionChanged: (selection) =>
                draftNotifier.setDurationHours(selection.first),
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        Text('Today · $start – $end', style: textTheme.titleMedium),
        Text(
          'Ends at $end · cancel any time',
          style: textTheme.bodyMedium
              ?.copyWith(color: colors.onSurfaceVariant),
        ),
        const Divider(height: AppSpacing.xl),
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: Text('Remind me $leadMinutes min before it ends'),
          subtitle: const Text('Local notification · needs permission'),
          value: draft.reminderEnabled,
          onChanged: draftNotifier.setReminderEnabled,
        ),
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text('Allow AI study summaries'),
          subtitle: const Text('Sends book info to Gemini · change anytime'),
          value: aiConsent,
          onChanged:
              ref.read(userPreferencesProvider.notifier).setAiConsent,
        ),
        const SizedBox(height: AppSpacing.lg),
        FilledButton(
          onPressed:
              seat.isAvailable ? () => _reserve(context, ref) : null,
          child: Text(
            seat.isAvailable
                ? 'Reserve seat ${seat.code}'
                : 'Seat unavailable',
          ),
        ),
      ],
    );
  }
}
