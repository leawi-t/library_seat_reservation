import '../domain/reservation.dart';
import '../domain/reservation_repository.dart';

class InMemoryReservationRepository implements ReservationRepository {
  final List<Reservation> _reservations = [];

  @override
  Future<List<Reservation>> getReservations(String userId) async {
    return _reservations.where((r) => r.userId == userId).toList();
  }

  @override
  Future<void> createReservation(Reservation reservation) async {
    _reservations.add(reservation);
  }

  @override
  Future<void> cancelReservation(String reservationId) async {
    _reservations.removeWhere((r) => r.id == reservationId);
  }
}
