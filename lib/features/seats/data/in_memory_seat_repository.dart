import '../domain/seat.dart';
import '../domain/seat_repository.dart';

class InMemorySeatRepository implements SeatRepository {
  InMemorySeatRepository({List<Seat>? initialSeats})
      : _seats = List<Seat>.of(initialSeats ?? _sampleSeats);

  final List<Seat> _seats;

  static const List<Seat> _sampleSeats = [
    Seat(
      id: 'seat_a101',
      code: 'A-101',
      floorArea: '1st Floor - Center',
      hasPowerOutlet: false,
      isQuietZone: false,
      isAvailable: true,
    ),
    Seat(
      id: 'seat_a102',
      code: 'A-102',
      floorArea: '1st Floor - Window',
      hasPowerOutlet: true,
      isQuietZone: false,
      isAvailable: true,
    ),
    Seat(
      id: 'seat_a103',
      code: 'A-103',
      floorArea: '1st Floor - Quiet Zone',
      hasPowerOutlet: true,
      isQuietZone: true,
      isAvailable: false,
    ),
    Seat(
      id: 'seat_a104',
      code: 'A-104',
      floorArea: '1st Floor - Center',
      hasPowerOutlet: false,
      isQuietZone: false,
      isAvailable: true,
    ),
    Seat(
      id: 'seat_b201',
      code: 'B-201',
      floorArea: '2nd Floor - Window',
      hasPowerOutlet: true,
      isQuietZone: false,
      isAvailable: true,
    ),
    Seat(
      id: 'seat_b202',
      code: 'B-202',
      floorArea: '2nd Floor - Quiet Zone',
      hasPowerOutlet: true,
      isQuietZone: true,
      isAvailable: true,
    ),
    Seat(
      id: 'seat_b203',
      code: 'B-203',
      floorArea: '2nd Floor - Center',
      hasPowerOutlet: false,
      isQuietZone: false,
      isAvailable: false,
    ),
    Seat(
      id: 'seat_b204',
      code: 'B-204',
      floorArea: '2nd Floor - Window',
      hasPowerOutlet: true,
      isQuietZone: false,
      isAvailable: true,
    ),
    Seat(
      id: 'seat_c301',
      code: 'C-301',
      floorArea: '3rd Floor - Research Area',
      hasPowerOutlet: true,
      isQuietZone: true,
      isAvailable: true,
    ),
    Seat(
      id: 'seat_c302',
      code: 'C-302',
      floorArea: '3rd Floor - Research Area',
      hasPowerOutlet: false,
      isQuietZone: true,
      isAvailable: true,
    ),
  ];

  @override
  Future<List<Seat>> getSeats() async {
    return List<Seat>.unmodifiable(_seats);
  }

  @override
  Future<Seat?> getSeatById(String id) async {
    for (final seat in _seats) {
      if (seat.id == id) {
        return seat;
      }
    }

    return null;
  }

  @override
  Future<Seat> reserveSeat(String id) async {
    final index = _seats.indexWhere((seat) => seat.id == id);

    if (index == -1) {
      throw StateError('Seat with ID $id does not exist.');
    }

    final seat = _seats[index];

    if (!seat.isAvailable) {
      throw StateError('Seat ${seat.code} is already reserved.');
    }

    final reservedSeat = seat.copyWith(
      isAvailable: false,
    );

    _seats[index] = reservedSeat;

    return reservedSeat;
  }

  @override
  Future<Seat> releaseSeat(String id) async {
    final index = _seats.indexWhere((seat) => seat.id == id);

    if (index == -1) {
      throw StateError('Seat with ID $id does not exist.');
    }

    final releasedSeat = _seats[index].copyWith(
      isAvailable: true,
      currentReservationId: null,
    );

    _seats[index] = releasedSeat;

    return releasedSeat;
  }
}
