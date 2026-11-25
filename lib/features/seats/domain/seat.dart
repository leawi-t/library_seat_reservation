import 'package:freezed_annotation/freezed_annotation.dart';

part 'seat.freezed.dart';
part 'seat.g.dart';

@freezed
abstract class Seat with _$Seat {
  const factory Seat({
    required String id,
    required String code,
    required String floorArea,
    required bool hasPowerOutlet,
    required bool isQuietZone,
    required bool isAvailable,
    String? currentReservationId,
  }) = _Seat;

  factory Seat.fromJson(Map<String, dynamic> json) =>
      _$SeatFromJson(json);
}
