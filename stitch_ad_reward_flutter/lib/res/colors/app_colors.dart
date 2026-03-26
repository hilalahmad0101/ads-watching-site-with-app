import 'package:flutter/material.dart';

class AppColors {
  static const Color background = Color(0xFF0B1326);
  static const Color surface = Color(0xFF0B1326);
  static const Color surfaceContainer = Color(0xFF171F33);
  static const Color surfaceContainerLow = Color(0xFF131B2E);
  static const Color surfaceContainerLowest = Color(0xFF060E20);
  static const Color surfaceContainerHigh = Color(0xFF222A3D);
  static const Color surfaceContainerHighest = Color(0xFF2D3449);
  
  static const Color primary = Color(0xFF62DF7D);
  static const Color primaryContainer = Color(0xFF1CA64D);
  static const Color secondary = Color(0xFF4AE176);
  static const Color secondaryContainer = Color(0xFF00B954);
  static const Color tertiary = Color(0xFF4DE082);
  
  static const Color onBackground = Color(0xFFDAE2FD);
  static const Color onSurface = Color(0xFFDAE2FD);
  static const Color onSurfaceVariant = Color(0xFFBDCABA);
  static const Color onPrimary = Color(0xFF003914);
  
  static const Color outlineVariant = Color(0x1A3E4A3D); // Added alpha for transparency as seen in CSS
  static const Color error = Color(0xFFFFB4AB);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, primaryContainer],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
