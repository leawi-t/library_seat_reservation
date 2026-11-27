import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/in_memory_seat_repository.dart';
import '../domain/seat.dart';
import '../domain/seat_repository.dart';

/// Provides the repository implementation through its abstraction.
final seatRepositoryProvider = Provider<SeatRepository>((ref) {
  return InMemorySeatRepository();
});

/// Loads the seats from the repository.
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

/// Holds the currently selected seat filters.
final seatFiltersProvider = NotifierProvider<SeatFiltersNotifier, SeatFilters>(
  SeatFiltersNotifier.new,
);

/// Derives the visible seats using the loaded data and active filters.
final filteredSeatsProvider = Provider<AsyncValue<List<Seat>>>((ref) {
  final seatsAsync = ref.watch(seatsProvider);
  final filters = ref.watch(seatFiltersProvider);

  return seatsAsync.whenData((seats) {
    return seats
        .where((seat) {
          final matchesPowerOutlet =
              !filters.powerOutletOnly || seat.hasPowerOutlet;

          final matchesQuietZone = !filters.quietZoneOnly || seat.isQuietZone;

          return matchesPowerOutlet && matchesQuietZone;
        })
        .toList(growable: false);
  });
});

/// Immutable state describing the active seat filters.
@immutable
class SeatFilters {
  const SeatFilters({this.powerOutletOnly = false, this.quietZoneOnly = false});

  final bool powerOutletOnly;
  final bool quietZoneOnly;

  SeatFilters copyWith({bool? powerOutletOnly, bool? quietZoneOnly}) {
    return SeatFilters(
      powerOutletOnly: powerOutletOnly ?? this.powerOutletOnly,
      quietZoneOnly: quietZoneOnly ?? this.quietZoneOnly,
    );
  }
}

/// Manages changes to the selected seat filters.
class SeatFiltersNotifier extends Notifier<SeatFilters> {
  @override
  SeatFilters build() {
    return const SeatFilters();
  }

  void setPowerOutletOnly(bool value) {
    state = state.copyWith(powerOutletOnly: value);
  }

  void setQuietZoneOnly(bool value) {
    state = state.copyWith(quietZoneOnly: value);
  }
}
