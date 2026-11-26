// Placeholder for @freezed Seat model
class Seat {
  const Seat({
    required this.id,
    required this.code,
    required this.floorArea,
    required this.hasPowerOutlet,
    required this.isQuietZone,
    required this.isAvailable,
    this.currentReservationId,
  });

  final String id;
  final String code;
  final String floorArea;
  final bool hasPowerOutlet;
  final bool isQuietZone;
  final bool isAvailable;
  final String? currentReservationId;
}
