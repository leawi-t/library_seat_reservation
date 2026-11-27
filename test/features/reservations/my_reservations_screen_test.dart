import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:library_seat_reservation/features/reservations/presentation/clock_provider.dart';
import 'package:library_seat_reservation/core/theme/app_theme.dart';
import 'package:library_seat_reservation/features/reservations/data/in_memory_reservation_repository.dart';
import 'package:library_seat_reservation/features/reservations/domain/reservation.dart';
import 'package:library_seat_reservation/features/reservations/domain/reservation_countdown.dart';
import 'package:library_seat_reservation/features/reservations/presentation/my_reservations_screen.dart';
import 'package:library_seat_reservation/features/reservations/presentation/reservations_provider.dart';
import 'package:library_seat_reservation/features/seats/data/in_memory_seat_repository.dart';
import 'package:library_seat_reservation/features/seats/domain/seat.dart';
import 'package:library_seat_reservation/features/seats/presentation/seats_provider.dart';

void main() {
  final now = DateTime(2026, 11, 26, 14, 36);
  final activeReservation = Reservation(
    id: 'res-1',
    userId: 'dummy-user-id',
    seatId: 'seat-b01',
    seatCode: 'B-01',
    startTime: DateTime(2026, 11, 26, 14),
    endTime: DateTime(2026, 11, 26, 16),
    reminderEnabled: true,
    status: ReservationStatus.reserved,
  );
  const bookedSeat = Seat(
    id: 'seat-b01',
    code: 'B-01',
    floorArea: 'Floor 2 North',
    hasPowerOutlet: true,
    isQuietZone: true,
    isAvailable: false,
  );

  late InMemorySeatRepository seatRepository;

  Future<void> pumpScreen(
    WidgetTester tester, {
    required List<Reservation> reservations,
  }) async {
    // Phone-sized viewport: any overflow fails the test.
    tester.view.physicalSize = const Size(360, 800);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);

    seatRepository = InMemorySeatRepository(initialSeats: const [bookedSeat]);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          seatRepositoryProvider.overrideWithValue(seatRepository),
          reservationRepositoryProvider.overrideWithValue(
            InMemoryReservationRepository(reservations: reservations),
          ),
          clockProvider.overrideWithValue(() => now),
          // A fixed value avoids a real one-second timer in the test.
          reservationCountdownProvider.overrideWith(
            (ref) => Stream.value(
              const ReservationCountdown(
                remaining: Duration(hours: 1, minutes: 24, seconds: 9),
                total: Duration(hours: 2),
              ),
            ),
          ),
        ],
        child: MaterialApp(
          theme: AppTheme.lightTheme,
          home: const MyReservationsScreen(),
        ),
      ),
    );
    await tester.pumpAndSettle();
  }

  testWidgets(
    'shows the active reservation, and cancelling it shows the empty state',
    (tester) async {
      await pumpScreen(tester, reservations: [activeReservation]);

      expect(find.text('Seat B-01'), findsOneWidget);
      expect(find.text('Reserved'), findsOneWidget);
      expect(find.text('01:24:09'), findsOneWidget);

      await tester.tap(find.text('Cancel reservation'));
      await tester.pumpAndSettle();
      expect(find.text('Cancel reservation?'), findsOneWidget);

      await tester.tap(find.text('Yes, cancel'));
      await tester.pumpAndSettle();

      expect(find.text('No active reservation'), findsOneWidget);
      expect(find.text('Seat B-01'), findsNothing);
      final seat = await seatRepository.getSeatById('seat-b01');
      expect(seat?.isAvailable, isTrue);
    },
  );
}
