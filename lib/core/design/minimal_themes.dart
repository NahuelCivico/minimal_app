import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minimal_app/core/design/minimal_colors.dart';

class MinimalThemes {
  static final MinimalThemes _instance = MinimalThemes._();

  factory MinimalThemes() {
    return _instance;
  }

  MinimalThemes._();

  ThemeData get defaultTheme {
    return ThemeData(
      useMaterial3: true,
      textTheme: GoogleFonts.dmSansTextTheme(
        const TextTheme(
          displaySmall: TextStyle(
            color: MinimalColors.black,
            fontSize: 12,
            fontWeight: FontWeight.w700,
            letterSpacing: 2.5,
          ),
          displayMedium: TextStyle(
            color: MinimalColors.black,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          displayLarge: TextStyle(
            color: MinimalColors.black,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            letterSpacing: 1,
          ),
          labelSmall: TextStyle(
            color: MinimalColors.black,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.25,
          ),
          labelLarge: TextStyle(
            color: MinimalColors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.5,
          ),
          headlineSmall: TextStyle(
            color: MinimalColors.grey,
            fontSize: 12,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.25,
          ),
          headlineMedium: TextStyle(
            color: MinimalColors.grey,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          titleMedium: TextStyle(
            color: MinimalColors.black,
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all<double>(3),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            const EdgeInsets.symmetric(vertical: 16),
          ),
          backgroundColor:
              MaterialStateProperty.all<Color>(MinimalColors.black),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            const StadiumBorder(),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all<TextStyle>(
            const TextStyle(
              fontSize: 14,
              color: MinimalColors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
