import 'reservation.dart';

abstract class ReservationRepository {
  Future<List<Reservation>> getReservations(String userId);
  Future<void> createReservation(Reservation reservation);

  /// Marks the reservation as [ReservationStatus.cancelled] (kept for history).
  Future<void> cancelReservation(String reservationId);
}
