import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

/// Consent & disclosure modal shown before the first off-device AI request.
class AiConsentDialog extends StatelessWidget {
  const AiConsentDialog({super.key});

  static Future<bool> show(BuildContext context) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => const AiConsentDialog(),
    );
    return result ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;

    return AlertDialog(
      title: const Text('Before we use AI'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Your book title, author, subject tags and study topic will be '
              'sent to Google Gemini.',
            ),
            const SizedBox(height: AppTheme.spacingMd),
            const _BulletLine('AI answers may contain inaccuracies'),
            const SizedBox(height: AppTheme.spacingXs),
            const _BulletLine('Nothing is saved unless you confirm'),
            const SizedBox(height: AppTheme.spacingXs),
            const _BulletLine('You can withdraw consent in Preferences'),
            const SizedBox(height: AppTheme.spacingMd),
            const Divider(),
            const SizedBox(height: AppTheme.spacingSm),
            Text(
              'Shown once, before the first request',
              style: textTheme.bodySmall?.copyWith(
                color: colors.onSurfaceVariant,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
      actions: [
        OutlinedButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: const Text('I agree'),
        ),
      ],
    );
  }
}

class _BulletLine extends StatelessWidget {
  const _BulletLine(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('• '),
        Expanded(child: Text(text)),
      ],
    );
  }
}
