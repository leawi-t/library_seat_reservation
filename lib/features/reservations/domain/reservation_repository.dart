import 'reservation.dart';

abstract class ReservationRepository {
  Future<List<Reservation>> getReservations(String userId);
  Future<void> createReservation(Reservation reservation);
  Future<void> cancelReservation(String reservationId);
}
