// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Seat _$SeatFromJson(Map<String, dynamic> json) => _Seat(
  id: json['id'] as String,
  code: json['code'] as String,
  floorArea: json['floorArea'] as String,
  hasPowerOutlet: json['hasPowerOutlet'] as bool,
  isQuietZone: json['isQuietZone'] as bool,
  isAvailable: json['isAvailable'] as bool,
  currentReservationId: json['currentReservationId'] as String?,
);

Map<String, dynamic> _$SeatToJson(_Seat instance) => <String, dynamic>{
  'id': instance.id,
  'code': instance.code,
  'floorArea': instance.floorArea,
  'hasPowerOutlet': instance.hasPowerOutlet,
  'isQuietZone': instance.isQuietZone,
  'isAvailable': instance.isAvailable,
  'currentReservationId': instance.currentReservationId,
};
