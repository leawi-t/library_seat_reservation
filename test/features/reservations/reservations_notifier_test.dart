import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:library_seat_reservation/features/reservations/data/in_memory_reservation_repository.dart';
import 'package:library_seat_reservation/features/reservations/domain/booking_failure.dart';
import 'package:library_seat_reservation/features/reservations/domain/reservation.dart';
import 'package:library_seat_reservation/features/reservations/presentation/clock_provider.dart';
import 'package:library_seat_reservation/features/reservations/presentation/reservations_provider.dart';
import 'package:library_seat_reservation/features/seats/data/in_memory_seat_repository.dart';
import 'package:library_seat_reservation/features/seats/domain/booking_draft.dart';
import 'package:library_seat_reservation/features/seats/domain/seat.dart';
import 'package:library_seat_reservation/features/seats/presentation/seats_provider.dart';

void main() {
  final now = DateTime(2026, 11, 26, 14);
  const seatB01 = Seat(
    id: 'seat-b01',
    code: 'B-01',
    floorArea: 'Floor 2 North',
    hasPowerOutlet: true,
    isQuietZone: true,
    isAvailable: true,
  );
  const seatB02 = Seat(
    id: 'seat-b02',
    code: 'B-02',
    floorArea: 'Floor 2 North',
    hasPowerOutlet: false,
    isQuietZone: false,
    isAvailable: true,
  );

  test('booking holds the seat and cancelling frees it', () async {
    final seatRepository =
        InMemorySeatRepository(initialSeats: const [seatB01, seatB02]);
    final container = ProviderContainer(
      overrides: [
        seatRepositoryProvider.overrideWithValue(seatRepository),
        reservationRepositoryProvider
            .overrideWithValue(InMemoryReservationRepository()),
        clockProvider.overrideWithValue(() => now),
      ],
    );
    addTearDown(container.dispose);

    final notifier = container.read(myReservationsProvider.notifier);
    final draft = BookingDraft(startTime: now, durationHours: 2);

    // Booking succeeds and holds the seat.
    expect(await notifier.reserve(seat: seatB01, draft: draft), isNull);
    var reservations = await container.read(myReservationsProvider.future);
    expect(reservations.single.seatCode, 'B-01');
    expect(reservations.single.endTime, DateTime(2026, 11, 26, 16));
    expect(reservations.single.status, ReservationStatus.reserved);
    expect(container.read(activeReservationProvider)?.seatId, 'seat-b01');
    expect((await seatRepository.getSeatById('seat-b01'))?.isAvailable, isFalse);

    // A second booking is rejected while one is active.
    expect(
      await notifier.reserve(seat: seatB02, draft: draft),
      BookingFailure.alreadyHasActiveReservation,
    );

    // Cancelling frees the seat and clears the active reservation.
    await notifier.cancel(reservations.single.id);
    reservations = await container.read(myReservationsProvider.future);
    expect(reservations.single.status, ReservationStatus.cancelled);
    expect(container.read(activeReservationProvider), isNull);
    expect((await seatRepository.getSeatById('seat-b01'))?.isAvailable, isTrue);

    // A seat taken by someone else is rejected, even from a stale copy.
    await seatRepository.reserveSeat('seat-b02');
    expect(
      await notifier.reserve(seat: seatB02, draft: draft),
      BookingFailure.seatUnavailable,
    );
  });
}
