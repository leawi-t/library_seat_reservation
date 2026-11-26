import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_draft.freezed.dart';

/// The choices made on the seat detail screen before reserving.
@freezed
abstract class BookingDraft with _$BookingDraft {
  const BookingDraft._();

  const factory BookingDraft({
    required DateTime startTime,
    @Default(2) int durationHours,
    @Default(true) bool reminderEnabled,
  }) = _BookingDraft;

  static const List<int> allowedDurationHours = [1, 2, 3];

  /// Label for a duration choice, e.g. `1 hour` or `2 hours`.
  static String durationLabel(int hours) {
    return hours == 1 ? '1 hour' : '$hours hours';
  }

  DateTime get endTime => startTime.add(Duration(hours: durationHours));
}
