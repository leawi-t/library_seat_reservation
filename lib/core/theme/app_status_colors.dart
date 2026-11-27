import 'package:flutter/material.dart';

/// Semantic colours for reservation statuses (not covered by [ColorScheme]).
@immutable
class AppStatusColors extends ThemeExtension<AppStatusColors> {
  const AppStatusColors({
    required this.reserved,
    required this.onReserved,
    required this.checkedIn,
    required this.onCheckedIn,
    required this.cancelled,
    required this.onCancelled,
    required this.expired,
    required this.onExpired,
  });

  static const AppStatusColors light = AppStatusColors(
    reserved: Color(0xFFDFF3E3),
    onReserved: Color(0xFF1B5E20),
    checkedIn: Color(0xFFD9E8FF),
    onCheckedIn: Color(0xFF0D3B8C),
    cancelled: Color(0xFFFBE0DE),
    onCancelled: Color(0xFF8C1D18),
    expired: Color(0xFFE6E6E6),
    onExpired: Color(0xFF444444),
  );

  final Color reserved;
  final Color onReserved;
  final Color checkedIn;
  final Color onCheckedIn;
  final Color cancelled;
  final Color onCancelled;
  final Color expired;
  final Color onExpired;

  /// Reads the extension from the theme, falling back to [light].
  static AppStatusColors of(BuildContext context) {
    return Theme.of(context).extension<AppStatusColors>() ?? light;
  }

  @override
  AppStatusColors copyWith({
    Color? reserved,
    Color? onReserved,
    Color? checkedIn,
    Color? onCheckedIn,
    Color? cancelled,
    Color? onCancelled,
    Color? expired,
    Color? onExpired,
  }) {
    return AppStatusColors(
      reserved: reserved ?? this.reserved,
      onReserved: onReserved ?? this.onReserved,
      checkedIn: checkedIn ?? this.checkedIn,
      onCheckedIn: onCheckedIn ?? this.onCheckedIn,
      cancelled: cancelled ?? this.cancelled,
      onCancelled: onCancelled ?? this.onCancelled,
      expired: expired ?? this.expired,
      onExpired: onExpired ?? this.onExpired,
    );
  }

  @override
  AppStatusColors lerp(ThemeExtension<AppStatusColors>? other, double t) {
    if (other is! AppStatusColors) return this;
    return AppStatusColors(
      reserved: Color.lerp(reserved, other.reserved, t)!,
      onReserved: Color.lerp(onReserved, other.onReserved, t)!,
      checkedIn: Color.lerp(checkedIn, other.checkedIn, t)!,
      onCheckedIn: Color.lerp(onCheckedIn, other.onCheckedIn, t)!,
      cancelled: Color.lerp(cancelled, other.cancelled, t)!,
      onCancelled: Color.lerp(onCancelled, other.onCancelled, t)!,
      expired: Color.lerp(expired, other.expired, t)!,
      onExpired: Color.lerp(onExpired, other.onExpired, t)!,
    );
  }
}
