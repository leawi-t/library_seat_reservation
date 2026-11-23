enum ReservationStatus {
  reserved,
  checkedIn,
  cancelled,
  expired,
}

// Placeholder for @freezed Reservation model
class Reservation {
  const Reservation({
    required this.id,
    required this.userId,
    required this.seatId,
    required this.seatCode,
    required this.startTime,
    required this.endTime,
    required this.reminderEnabled,
    required this.status,
  });

  final String id;
  final String userId;
  final String seatId;
  final String seatCode;
  final DateTime startTime;
  final DateTime endTime;
  final bool reminderEnabled;
  final ReservationStatus status;
}
