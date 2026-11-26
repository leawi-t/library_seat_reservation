import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_spacing.dart';
import '../../domain/user_preferences.dart';
import '../preferences_provider.dart';

/// Story 8: AI consent and reminder lead time in one place.
class ReservationPreferencesSection extends ConsumerWidget {
  const ReservationPreferencesSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final preferences = ref.watch(userPreferencesProvider);
    final notifier = ref.read(userPreferencesProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Preferences', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: AppSpacing.sm),
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text('AI summaries consent'),
          value: preferences.hasGrantedAiConsent,
          onChanged: notifier.setAiConsent,
        ),
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text('Reminder lead time'),
          trailing: DropdownButton<int>(
            value: preferences.reminderLeadMinutes,
            items: [
              for (final minutes in UserPreferences.reminderLeadOptions)
                DropdownMenuItem<int>(
                  value: minutes,
                  child: Text('$minutes min'),
                ),
            ],
            onChanged: (minutes) {
              if (minutes != null) notifier.setReminderLeadMinutes(minutes);
            },
          ),
        ),
      ],
    );
  }
}
