import 'seat.dart';

abstract interface class SeatRepository {
  Future<List<Seat>> getSeats();
  Future<Seat?> getSeatById(String id);
  Future<Seat> reserveSeat(String id);

  /// Frees a previously reserved seat (e.g. after a cancelled reservation).
  Future<Seat> releaseSeat(String id);
}
