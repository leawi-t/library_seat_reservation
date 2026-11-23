import 'seat.dart';

abstract class SeatRepository {
  Future<List<Seat>> getSeats();
  Future<Seat?> getSeatById(String id);
}
