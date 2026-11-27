import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../reservations/presentation/clock_provider.dart';
import '../../reservations/domain/booking_failure.dart';
import '../../reservations/presentation/reservations_provider.dart';
import '../domain/booking_draft.dart';
import '../domain/seat.dart';

/// Form state for the seat detail screen. Resets when the screen closes.
final bookingDraftProvider =
    NotifierProvider.autoDispose<BookingDraftNotifier, BookingDraft>(
  BookingDraftNotifier.new,
);

class BookingDraftNotifier extends Notifier<BookingDraft> {
  @override
  BookingDraft build() => BookingDraft(startTime: ref.read(clockProvider)());

  void setDurationHours(int hours) {
    state = state.copyWith(durationHours: hours);
  }

  void setReminderEnabled(bool enabled) {
    state = state.copyWith(reminderEnabled: enabled);
  }

  /// Reserves [seat], starting now. Returns `null` on success.
  Future<BookingFailure?> submit(Seat seat) {
    final draft = state.copyWith(startTime: ref.read(clockProvider)());
    return ref
        .read(myReservationsProvider.notifier)
        .reserve(seat: seat, draft: draft);
  }
}
