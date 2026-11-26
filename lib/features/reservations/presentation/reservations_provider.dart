import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/in_memory_reservation_repository.dart';
import '../domain/reservation.dart';
import '../domain/reservation_repository.dart';

final reservationRepositoryProvider = Provider<ReservationRepository>((ref) {
  return InMemoryReservationRepository();
});

final myReservationsProvider = FutureProvider<List<Reservation>>((ref) async {
  final repository = ref.watch(reservationRepositoryProvider);
  return repository.getReservations('dummy-user-id');
});
