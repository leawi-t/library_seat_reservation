import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/user_preferences.dart';

final userPreferencesProvider =
    NotifierProvider<UserPreferencesNotifier, UserPreferences>(
  UserPreferencesNotifier.new,
);

class UserPreferencesNotifier extends Notifier<UserPreferences> {
  @override
  UserPreferences build() => const UserPreferences();

  void setAiConsent(bool granted) {
    state = state.copyWith(hasGrantedAiConsent: granted);
  }

  void setReminderLeadMinutes(int minutes) {
    state = state.copyWith(reminderLeadMinutes: minutes);
  }
}
