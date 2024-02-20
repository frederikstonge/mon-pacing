import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes {
  static ThemeData lni() {
    const primaryColor = Color(0xFF044b89);
    const secondaryColor = Color(0xFFdc1a23);
    const cardBackgroundColor = Color(0xFFf2efe4);
    const cardBorderColor = secondaryColor;
    const dividerColor = primaryColor;
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
    return themeData
        .copyWith(
          textTheme: GoogleFonts.poppinsTextTheme(themeData.textTheme),
        )
        .copyWith(
            cardTheme: const CardTheme(
              clipBehavior: Clip.antiAlias,
              color: cardBackgroundColor,
              margin: EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
                side: BorderSide(color: cardBorderColor),
              ),
              elevation: 2,
            ),
            dividerTheme: const DividerThemeData(color: dividerColor));
  }

  static ThemeData light() {
    const primaryColor = Color(0xFF044b89);
    const secondaryColor = Color(0xFFdc1a23);
    final cardBackgroundColor = Colors.grey.shade100;
    final cardBorderColor = Colors.grey.shade300;
    final dividerColor = Colors.grey.shade300;
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
    return themeData
        .copyWith(
          textTheme: GoogleFonts.poppinsTextTheme(themeData.textTheme),
        )
        .copyWith(
            cardTheme: CardTheme(
              clipBehavior: Clip.antiAlias,
              color: cardBackgroundColor,
              margin: const EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                borderRadius: const BorderRadius.all(
                  Radius.circular(12),
                ),
                side: BorderSide(color: cardBorderColor),
              ),
              elevation: 2,
            ),
            dividerTheme: DividerThemeData(color: dividerColor));
  }

  static ThemeData dark() {
    const primaryColor = Color(0xFF044b89);
    const secondaryColor = Color(0xFFdc1a23);
    final cardBackgroundColor = Colors.grey.shade100;
    final cardBorderColor = Colors.grey.shade300;
    final dividerColor = Colors.grey.shade300;
    const colorScheme = ColorScheme(
      brightness: Brightness.dark,
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
    return themeData
        .copyWith(
          textTheme: GoogleFonts.poppinsTextTheme(themeData.textTheme),
        )
        .copyWith(
            cardTheme: CardTheme(
              clipBehavior: Clip.antiAlias,
              color: cardBackgroundColor,
              margin: const EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                borderRadius: const BorderRadius.all(
                  Radius.circular(12),
                ),
                side: BorderSide(color: cardBorderColor),
              ),
              elevation: 2,
            ),
            dividerTheme: DividerThemeData(color: dividerColor));
  }
}
