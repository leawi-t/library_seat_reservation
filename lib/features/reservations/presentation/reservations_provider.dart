import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'clock_provider.dart';
import '../../seats/domain/booking_draft.dart';
import '../../seats/domain/seat.dart';
import '../../seats/presentation/seats_provider.dart';
import '../data/in_memory_reservation_repository.dart';
import '../domain/booking_failure.dart';
import '../domain/reservation.dart';
import '../domain/reservation_countdown.dart';
import '../domain/reservation_repository.dart';

final reservationRepositoryProvider = Provider<ReservationRepository>((ref) {
  return InMemoryReservationRepository();
});

/// Placeholder until Firebase Auth arrives in Milestone 2.
final currentUserIdProvider = Provider<String>((ref) => 'dummy-user-id');

final myReservationsProvider =
    AsyncNotifierProvider<ReservationsNotifier, List<Reservation>>(
  ReservationsNotifier.new,
);

/// Owns booking and cancelling, so widgets never touch repositories.
class ReservationsNotifier extends AsyncNotifier<List<Reservation>> {
  @override
  Future<List<Reservation>> build() {
    final userId = ref.watch(currentUserIdProvider);
    return ref.watch(reservationRepositoryProvider).getReservations(userId);
  }

  /// Books [seat] using [draft]. Returns `null` on success, otherwise why not.
  Future<BookingFailure?> reserve({
    required Seat seat,
    required BookingDraft draft,
  }) async {
    final now = ref.read(clockProvider)();
    final existing = await future;
    if (existing.any((reservation) => reservation.isActiveAt(now))) {
      return BookingFailure.alreadyHasActiveReservation;
    }

    // The repository is the source of truth: it rejects seats that are
    // unknown or already taken, even if the screen holds a stale copy.
    final seatRepository = ref.read(seatRepositoryProvider);
    final Seat reservedSeat;
    try {
      reservedSeat = await seatRepository.reserveSeat(seat.id);
    } on StateError {
      return BookingFailure.seatUnavailable;
    }

    final reservation = Reservation(
      id: 'res-${now.microsecondsSinceEpoch}',
      userId: ref.read(currentUserIdProvider),
      seatId: reservedSeat.id,
      seatCode: reservedSeat.code,
      startTime: draft.startTime,
      endTime: draft.endTime,
      reminderEnabled: draft.reminderEnabled,
      status: ReservationStatus.reserved,
    );
    try {
      await ref
          .read(reservationRepositoryProvider)
          .createReservation(reservation);
    } catch (_) {
      // Do not leave the seat locked without a reservation.
      await seatRepository.releaseSeat(reservedSeat.id);
      rethrow;
    }
    await _refreshAfterChange();
    return null;
  }

  /// Cancels the reservation and frees its seat for other students.
  Future<void> cancel(String reservationId) async {
    final reservations = await future;
    final matches = reservations.where((r) => r.id == reservationId);
    if (matches.isEmpty) return;

    await ref.read(reservationRepositoryProvider).cancelReservation(
          reservationId,
        );
    await ref.read(seatRepositoryProvider).releaseSeat(matches.first.seatId);
    await _refreshAfterChange();
  }

  Future<void> _refreshAfterChange() async {
    ref.invalidate(seatsProvider);
    ref.invalidate(seatDetailProvider);
    ref.invalidateSelf();
    await future;
  }
}

/// The reservation currently holding a seat, if any.
final activeReservationProvider = Provider<Reservation?>((ref) {
  final reservations = ref.watch(myReservationsProvider).value;
  if (reservations == null) return null;
  final now = ref.watch(clockProvider)();
  for (final reservation in reservations) {
    if (reservation.isActiveAt(now)) return reservation;
  }
  return null;
});

/// Emits the time left every second while a reservation is active.
final reservationCountdownProvider =
    StreamProvider.autoDispose<ReservationCountdown?>((ref) async* {
  final reservation = ref.watch(activeReservationProvider);
  if (reservation == null) {
    yield null;
    return;
  }
  final clock = ref.watch(clockProvider);
  while (true) {
    final remaining = reservation.endTime.difference(clock());
    yield ReservationCountdown(
      remaining: remaining,
      total: reservation.totalDuration,
    );
    if (remaining <= Duration.zero) return;
    await Future<void>.delayed(const Duration(seconds: 1));
  }
});
