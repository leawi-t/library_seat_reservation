import 'package:freezed_annotation/freezed_annotation.dart';

part 'reservation.freezed.dart';

enum ReservationStatus {
  reserved,
  checkedIn,
  cancelled,
  expired,
}

@freezed
abstract class Reservation with _$Reservation {
  const Reservation._();

  const factory Reservation({
    required String id,
    required String userId,
    required String seatId,
    required String seatCode,
    required DateTime startTime,
    required DateTime endTime,
    required bool reminderEnabled,
    required ReservationStatus status,
  }) = _Reservation;

  /// True while the booking still holds a seat at [now].
  bool isActiveAt(DateTime now) {
    final holdsSeat = status == ReservationStatus.reserved ||
        status == ReservationStatus.checkedIn;
    return holdsSeat && endTime.isAfter(now);
  }

  bool get canCheckIn => status == ReservationStatus.reserved;

  Duration get totalDuration => endTime.difference(startTime);

  /// When the local reminder should fire for the given lead time.
  DateTime reminderTimeFor(int leadMinutes) {
    return endTime.subtract(Duration(minutes: leadMinutes));
  }
}
