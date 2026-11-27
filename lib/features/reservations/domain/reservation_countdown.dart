import 'package:freezed_annotation/freezed_annotation.dart';

part 'reservation_countdown.freezed.dart';

/// Time left on the active reservation, for the countdown card.
@freezed
abstract class ReservationCountdown with _$ReservationCountdown {
  const ReservationCountdown._();

  const factory ReservationCountdown({
    required Duration remaining,
    required Duration total,
  }) = _ReservationCountdown;

  /// Fraction of the booking still left, from 0.0 to 1.0.
  double get progress {
    if (total <= Duration.zero) return 0;
    return (remaining.inSeconds / total.inSeconds).clamp(0.0, 1.0);
  }

  /// `HH:MM:SS`, never negative.
  String get formatted {
    final safe = remaining.isNegative ? Duration.zero : remaining;
    String two(int n) => n.toString().padLeft(2, '0');
    return '${two(safe.inHours)}:${two(safe.inMinutes % 60)}:'
        '${two(safe.inSeconds % 60)}';
  }
}
