import 'seat.dart';

abstract interface class SeatRepository {
  Future<List<Seat>> getSeats();
  Future<Seat?> getSeatById(String id);
  Future<Seat> reserveSeat(String id);
}
