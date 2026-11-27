import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/in_memory_seat_repository.dart';
import '../domain/seat.dart';
import '../domain/seat_repository.dart';

final seatRepositoryProvider = Provider<SeatRepository>((ref) {
  return InMemorySeatRepository();
});

final seatsProvider = FutureProvider<List<Seat>>((ref) async {
  final repository = ref.watch(seatRepositoryProvider);
  return repository.getSeats();
});

/// A single seat for the detail screen; `null` when the id is unknown.
final seatDetailProvider =
    FutureProvider.autoDispose.family<Seat?, String>((ref, seatId) async {
  final repository = ref.watch(seatRepositoryProvider);
  return repository.getSeatById(seatId);
});
