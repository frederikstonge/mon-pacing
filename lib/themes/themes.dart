import 'package:flutter/material.dart';

class Themes {
  static ThemeData light() {
    const primaryColor = Colors.deepPurple;
    const secondaryColor = Colors.lightGreen;
    final cardBackgroundColor = Colors.grey.shade100;
    final cardBorderColor = Colors.grey.shade300;
    final dividerColor = Colors.grey.shade300;
    final shadowColor = Colors.grey.shade300;
    return _generateTheme(
      Brightness.light,
      primaryColor,
      secondaryColor,
      cardBackgroundColor,
      cardBorderColor,
      dividerColor,
      shadowColor,
    );
  }

  static ThemeData dark() {
    const primaryColor = Colors.deepPurple;
    const secondaryColor = Colors.lightGreen;
    final cardBackgroundColor = Colors.grey.shade900;
    final cardBorderColor = Colors.grey.shade800;
    final dividerColor = Colors.grey.shade800;
    final shadowColor = Colors.grey.shade800;
    return _generateTheme(
      Brightness.dark,
      primaryColor,
      secondaryColor,
      cardBackgroundColor,
      cardBorderColor,
      dividerColor,
      shadowColor,
    );
  }

  static ThemeData lni() {
    const primaryColor = Color(0xFF044b89);
    const secondaryColor = Color(0xFFdc1a23);
    final cardBackgroundColor = Colors.grey.shade100;
    const cardBorderColor = secondaryColor;
    const dividerColor = primaryColor;
    final shadowColor = Colors.grey.shade300;
    return _generateTheme(
      Brightness.light,
      primaryColor,
      secondaryColor,
      cardBackgroundColor,
      cardBorderColor,
      dividerColor,
      shadowColor,
    );
  }

  static ThemeData _generateTheme(
    Brightness brightness,
    Color primaryColor,
    Color secondaryColor,
    Color cardBackgroundColor,
    Color cardBorderColor,
    Color dividerColor,
    Color shadowColor,
  ) {
    final background = brightness == Brightness.light ? Colors.white : Colors.black;
    final onBackground = brightness == Brightness.light ? Colors.black : Colors.white;
    final onPrimary = ThemeData.estimateBrightnessForColor(primaryColor) == Brightness.light ? Colors.black : Colors.white;
    final onSecondary = ThemeData.estimateBrightnessForColor(secondaryColor) == Brightness.light ? Colors.black : Colors.white;
    final colorScheme = ColorScheme(
      brightness: brightness,
      primary: primaryColor,
      onPrimary: onPrimary,
      primaryContainer: primaryColor,
      onPrimaryContainer: onPrimary,
      secondary: secondaryColor,
      onSecondary: onSecondary,
      secondaryContainer: secondaryColor,
      onSecondaryContainer: onSecondary,
      error: Colors.red,
      onError: Colors.white,
      errorContainer: secondaryColor,
      onErrorContainer: onSecondary,
      surface: background,
      onSurface: onBackground,
      surfaceTint: background,
      inverseSurface: onBackground,
      shadow: shadowColor,
    );
    final themeData = ThemeData.from(colorScheme: colorScheme);
    return themeData.copyWith(
      textTheme: themeData.textTheme.apply(fontFamily: 'Poppins'),
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
}
