import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes {
  static ThemeData light() {
    const primaryColor = Colors.deepPurple;
    const secondaryColor = Colors.lightGreen;
    final cardBackgroundColor = Colors.grey.shade100;
    final cardBorderColor = Colors.grey.shade300;
    final dividerColor = Colors.grey.shade300;
    final shadowColor = Colors.grey.shade300;
    final colorScheme = ColorScheme(
      brightness: Brightness.light,
      primary: primaryColor,
      onPrimary: Colors.white,
      primaryContainer: primaryColor,
      onPrimaryContainer: Colors.white,
      secondary: secondaryColor,
      onSecondary: Colors.black,
      secondaryContainer: secondaryColor,
      onSecondaryContainer: Colors.black,
      error: Colors.red,
      onError: Colors.white,
      errorContainer: secondaryColor,
      onErrorContainer: Colors.black,
      background: Colors.white,
      onBackground: Colors.black,
      surface: Colors.white,
      onSurface: Colors.black,
      surfaceTint: Colors.white,
      surfaceVariant: Colors.white,
      inverseSurface: Colors.black,
      shadow: shadowColor,
    );
    final themeData = ThemeData.from(colorScheme: colorScheme);
    return themeData.copyWith(
      textTheme: GoogleFonts.poppinsTextTheme(themeData.textTheme),
      cardTheme: CardTheme(
        clipBehavior: Clip.antiAlias,
        color: cardBackgroundColor,
        margin: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
          side: BorderSide(color: cardBorderColor),
        ),
        elevation: 2,
      ),
      dividerTheme: DividerThemeData(color: dividerColor),
      bottomSheetTheme: BottomSheetThemeData(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.0),
          ),
        ),
        showDragHandle: true,
        shadowColor: shadowColor,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        filled: true,
      ),
    );
  }

  static ThemeData dark() {
    const primaryColor = Colors.deepPurple;
    const secondaryColor = Colors.lightGreen;
    final cardBackgroundColor = Colors.grey.shade900;
    final cardBorderColor = Colors.grey.shade700;
    final dividerColor = Colors.grey.shade700;
    final shadowColor = Colors.grey.shade700;
    final colorScheme = ColorScheme(
      brightness: Brightness.dark,
      primary: primaryColor,
      onPrimary: Colors.white,
      primaryContainer: primaryColor,
      onPrimaryContainer: Colors.white,
      secondary: secondaryColor,
      onSecondary: Colors.black,
      secondaryContainer: secondaryColor,
      onSecondaryContainer: Colors.black,
      error: Colors.red,
      onError: Colors.black,
      errorContainer: secondaryColor,
      onErrorContainer: Colors.black,
      background: Colors.black,
      onBackground: Colors.white,
      surface: Colors.black,
      onSurface: Colors.white,
      surfaceTint: Colors.black,
      surfaceVariant: Colors.black,
      inverseSurface: Colors.white,
      shadow: shadowColor,
    );
    final themeData = ThemeData.from(colorScheme: colorScheme);
    return themeData.copyWith(
      textTheme: GoogleFonts.poppinsTextTheme(themeData.textTheme),
      cardTheme: CardTheme(
        clipBehavior: Clip.antiAlias,
        color: cardBackgroundColor,
        margin: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
          side: BorderSide(color: cardBorderColor),
        ),
        elevation: 2,
      ),
      dividerTheme: DividerThemeData(color: dividerColor),
      bottomSheetTheme: BottomSheetThemeData(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.0),
          ),
        ),
        showDragHandle: true,
        shadowColor: shadowColor,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        filled: true,
      ),
    );
  }

  static ThemeData lni() {
    const primaryColor = Color(0xFF044b89);
    const secondaryColor = Color(0xFFdc1a23);
    final cardBackgroundColor = Colors.grey.shade100;
    const cardBorderColor = secondaryColor;
    const dividerColor = primaryColor;
    final shadowColor = Colors.grey.shade300;
    final colorScheme = ColorScheme(
      brightness: Brightness.light,
      primary: primaryColor,
      onPrimary: Colors.white,
      primaryContainer: primaryColor,
      onPrimaryContainer: Colors.white,
      secondary: secondaryColor,
      onSecondary: Colors.white,
      secondaryContainer: secondaryColor,
      onSecondaryContainer: Colors.white,
      error: Colors.red,
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
      shadow: shadowColor,
    );
    final themeData = ThemeData.from(colorScheme: colorScheme);
    return themeData.copyWith(
      textTheme: GoogleFonts.poppinsTextTheme(themeData.textTheme),
      cardTheme: CardTheme(
        clipBehavior: Clip.antiAlias,
        color: cardBackgroundColor,
        margin: const EdgeInsets.all(8),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          side: BorderSide(color: cardBorderColor),
        ),
        elevation: 2,
      ),
      dividerTheme: const DividerThemeData(color: dividerColor),
      bottomSheetTheme: BottomSheetThemeData(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.0),
          ),
        ),
        showDragHandle: true,
        shadowColor: shadowColor,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        filled: true,
      ),
    );
  }
}
