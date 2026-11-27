import '../domain/reservation.dart';
import '../domain/reservation_repository.dart';

class InMemoryReservationRepository implements ReservationRepository {
  InMemoryReservationRepository({List<Reservation>? reservations})
      : _reservations = List.of(reservations ?? const []);

  final List<Reservation> _reservations;

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
    final index = _reservations.indexWhere((r) => r.id == reservationId);
    if (index == -1) return;
    _reservations[index] = _reservations[index].copyWith(
      status: ReservationStatus.cancelled,
    );
  }
}
