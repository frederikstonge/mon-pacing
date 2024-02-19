import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes {
  static const primaryColor = Color(0xFF044b89);
  static const secondaryColor = Color(0xFFdc1a23);

  static ThemeData light() {
    const colorScheme = ColorScheme(
      brightness: Brightness.light,
      primary: primaryColor,
      onPrimary: Colors.white,
      primaryContainer: primaryColor,
      onPrimaryContainer: Colors.white,
      secondary: secondaryColor,
      onSecondary: Colors.white,
      secondaryContainer: secondaryColor,
      onSecondaryContainer: Colors.white,
      error: secondaryColor,
      onError: Colors.white,
      errorContainer: secondaryColor,
      onErrorContainer: Colors.white,
      background: Colors.white,
      onBackground: Colors.black,
      surface: Colors.white,
      onSurface: Colors.black,
      surfaceTint: Colors.white,
      surfaceVariant: Colors.white,
      inverseSurface: Colors.black,
      shadow: Colors.white,
    );
    final themeData = ThemeData.from(colorScheme: colorScheme);
    return themeData.copyWith(
      textTheme: GoogleFonts.poppinsTextTheme(themeData.textTheme),
    );
  }
}
