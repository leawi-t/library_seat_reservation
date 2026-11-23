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
