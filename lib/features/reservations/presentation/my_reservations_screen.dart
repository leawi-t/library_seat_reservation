import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_spacing.dart';
import '../../catalog/presentation/widgets/saved_study_notes_section.dart';
import 'reservations_provider.dart';
import 'widgets/active_reservation_card.dart';
import 'widgets/no_active_reservation_card.dart';
import 'widgets/reservation_preferences_section.dart';

class MyReservationsScreen extends ConsumerWidget {
  const MyReservationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reservations = ref.watch(myReservationsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('My reservations')),
      body: reservations.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(
          child: FilledButton(
            onPressed: () => ref.invalidate(myReservationsProvider),
            child: const Text('Could not load reservations. Retry'),
          ),
        ),
        data: (_) => const _ReservationsContent(),
      ),
    );
  }
}

class _ReservationsContent extends ConsumerWidget {
  const _ReservationsContent();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final active = ref.watch(activeReservationProvider);

    return ListView(
      padding: const EdgeInsets.all(AppSpacing.md),
      children: [
        if (active == null)
          const NoActiveReservationCard()
        else
          ActiveReservationCard(reservation: active),
        const SizedBox(height: AppSpacing.lg),
        const SavedStudyNotesSection(),
        const SizedBox(height: AppSpacing.lg),
        const ReservationPreferencesSection(),
      ],
    );
  }
}
