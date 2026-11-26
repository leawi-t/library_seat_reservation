import '../domain/seat.dart';
import '../domain/seat_repository.dart';

class InMemorySeatRepository implements SeatRepository {
  final List<Seat> _seats = [];

  @override
  Future<List<Seat>> getSeats() async => _seats;

  @override
  Future<Seat?> getSeatById(String id) async {
    try {
      return _seats.firstWhere((seat) => seat.id == id);
    } catch (_) {
      return null;
    }
  }
}
