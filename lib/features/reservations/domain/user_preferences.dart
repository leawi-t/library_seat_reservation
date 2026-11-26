import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_preferences.freezed.dart';

/// Story 8: preferences shown on both the booking and reservations screens.
@freezed
abstract class UserPreferences with _$UserPreferences {
  const UserPreferences._();

  const factory UserPreferences({
    @Default(false) bool hasGrantedAiConsent,
    @Default(10) int reminderLeadMinutes,
  }) = _UserPreferences;

  static const List<int> reminderLeadOptions = [5, 10, 15, 30];
}
