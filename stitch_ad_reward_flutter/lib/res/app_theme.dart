import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors/app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          brightness: Brightness.light,
        ),
      );

  static ThemeData get darkTheme => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: const ColorScheme.dark(
          primary: AppColors.primary,
          onPrimary: AppColors.onPrimary,
          primaryContainer: AppColors.primaryContainer,
          secondary: AppColors.secondary,
          surface: AppColors.surface,
          onSurface: AppColors.onSurface,
          onSurfaceVariant: AppColors.onSurfaceVariant,
          background: AppColors.background,
          onBackground: AppColors.onBackground,
          error: AppColors.error,
        ),
        textTheme: GoogleFonts.interTextTheme(
          const TextTheme(
            displayLarge: TextStyle(fontWeight: FontWeight.w900, letterSpacing: -1.5),
            headlineMedium: TextStyle(fontWeight: FontWeight.w700, letterSpacing: -1.0),
            titleLarge: TextStyle(fontWeight: FontWeight.w700, letterSpacing: -0.5),
            bodyLarge: TextStyle(fontWeight: FontWeight.w400),
            labelSmall: TextStyle(fontWeight: FontWeight.w700, letterSpacing: 1.5, fontSize: 10),
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: false,
          titleTextStyle: TextStyle(
            color: AppColors.primary,
            fontSize: 20,
            fontWeight: FontWeight.w900,
            letterSpacing: -1.0,
          ),
        ),
      );
}
