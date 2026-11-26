import 'package:flutter/material.dart';

import 'app_spacing.dart';
import 'app_status_colors.dart';

/// App theme configuration and design tokens.
class AppTheme {
  const AppTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.indigo,
        brightness: Brightness.light,
      ),
      useMaterial3: true,
      extensions: const [AppStatusColors.light],
    );
  }

  // Kept for existing callers; new code should use [AppSpacing].
  static const double spacingXs = AppSpacing.xs;
  static const double spacingSm = AppSpacing.sm;
  static const double spacingMd = AppSpacing.md;
  static const double spacingLg = AppSpacing.lg;
  static const double spacingXl = AppSpacing.xl;
}
