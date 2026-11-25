import 'package:flutter_test/flutter_test.dart';
import 'package:library_seat_reservation/features/seats/data/in_memory_seat_repository.dart';
import 'package:library_seat_reservation/features/seats/domain/seat.dart';

void main() {
  group('InMemorySeatRepository', () {
    late InMemorySeatRepository repository;

    setUp(() {
      repository = InMemorySeatRepository();
    });

    test('getSeats returns all available sample seats', () async {
      final seats = await repository.getSeats();

      expect(seats, hasLength(10));
      expect(seats, everyElement(isA<Seat>()));
    });

    test('getSeatById returns the correct seat', () async {
      final seat = await repository.getSeatById('seat_b201');

      expect(seat, isNotNull);
      expect(seat!.code, 'B-201');
      expect(seat.hasPowerOutlet, true);
    });

    test('getSeatById returns null for an unknown ID', () async {
      final seat = await repository.getSeatById('unknown');

      expect(seat, isNull);
    });

    test('reserveSeat changes availability to false', () async {
      final originalSeat =
          await repository.getSeatById('seat_b201');

      final reservedSeat =
          await repository.reserveSeat('seat_b201');

      expect(reservedSeat.isAvailable, false);

      // The original immutable object remains unchanged.
      expect(originalSeat!.isAvailable, true);

      // The repository now contains the updated seat.
      final updatedSeat =
          await repository.getSeatById('seat_b201');

      expect(updatedSeat!.isAvailable, false);
    });

    test('reserveSeat throws when seat does not exist', () async {
      expect(
        () => repository.reserveSeat('unknown'),
        throwsA(isA<StateError>()),
      );
    });

    test('reserveSeat throws when seat is already reserved', () async {
      expect(
        () => repository.reserveSeat('seat_a103'),
        throwsA(isA<StateError>()),
      );
    });
  });
}
