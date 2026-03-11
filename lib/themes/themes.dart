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

  static ThemeData paradoxe() {
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

  static ThemeData evenementCulturel() {
    const primaryColor = Color(0xFFffd740);
    const secondaryColor = Color(0xFF145da8);
    final cardBackgroundColor = Colors.grey.shade900;
    final cardBorderColor = Color(0xFFe8423b);
    final dividerColor = Color(0xFFe8423b);
    final shadowColor = Colors.grey.shade800;
    final backgroundColor = Color(0xFF1e1e1c);
    final onBackgroundColor = Color(0xFFf5f2eb);
    return _generateTheme(
      Brightness.dark,
      primaryColor,
      secondaryColor,
      cardBackgroundColor,
      cardBorderColor,
      dividerColor,
      shadowColor,
      backgroundColor: backgroundColor,
      onBackgroundColor: onBackgroundColor,
    );
  }

  static ThemeData boldor() {
    const primaryColor = Color(0xFFffef01);
    const secondaryColor = Color(0xFFffef01);
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

  static ThemeData ligmaLight() {
    const primaryColor = Color(0xFFa32a5e);
    const secondaryColor = Color(0xFF6ea943);
    final cardBackgroundColor = Colors.grey.shade100;
    const cardBorderColor = primaryColor;
    const dividerColor = secondaryColor;
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

  static ThemeData ligmaDark() {
    const primaryColor = Color(0xFFa32a5e);
    const secondaryColor = Color(0xFF6ea943);
    final cardBackgroundColor = Colors.grey.shade900;
    const cardBorderColor = primaryColor;
    const dividerColor = secondaryColor;
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

  static ShapeBorder getCardShapeBorder(Color borderColor) {
    return RoundedRectangleBorder(
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      side: BorderSide(color: borderColor),
    );
  }

  static ThemeData _generateTheme(
    Brightness brightness,
    Color primaryColor,
    Color secondaryColor,
    Color cardBackgroundColor,
    Color cardBorderColor,
    Color dividerColor,
    Color shadowColor, {
    Color? backgroundColor,
    Color? onBackgroundColor,
    Color? onPrimaryColor,
    Color? onSecondaryColor,
  }) {
    final background = backgroundColor ?? (brightness == Brightness.light ? Colors.white : Colors.black);
    final onBackground =
        onBackgroundColor ??
        (ThemeData.estimateBrightnessForColor(background) == Brightness.light ? Colors.black : Colors.white);
    final onPrimary =
        onPrimaryColor ??
        (ThemeData.estimateBrightnessForColor(primaryColor) == Brightness.light ? Colors.black : Colors.white);
    final onSecondary =
        onSecondaryColor ??
        (ThemeData.estimateBrightnessForColor(secondaryColor) == Brightness.light ? Colors.black : Colors.white);
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
      cardTheme: CardThemeData(
        clipBehavior: Clip.antiAlias,
        color: cardBackgroundColor,
        margin: const EdgeInsets.all(8),
        shape: getCardShapeBorder(cardBorderColor),
        elevation: 2,
      ),
      dividerTheme: DividerThemeData(color: dividerColor),
      bottomSheetTheme: BottomSheetThemeData(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
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
