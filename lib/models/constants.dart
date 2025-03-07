import 'package:flutter/material.dart';

import '../extensions/color_extensions.dart';

class Constants {
  static const double expandedAppbarHeight = 112;
  static const int maximumTeams = 3;
  static const int minimumTeams = 1;

  static List<MaterialColor> colors = [
    Colors.blue,
    Colors.red,
    Colors.yellow,
    Colors.green,
    Colors.purple,
    Colors.pink,
    Colors.orange,
    Colors.brown,
    _toMaterialColor(Colors.white),
    _toMaterialColor(Colors.black),
    Colors.grey,
    Colors.amber,
    Colors.cyan,
    Colors.deepOrange,
    Colors.deepPurple,
    Colors.indigo,
    Colors.lightBlue,
    Colors.lightGreen,
    Colors.lime,
    Colors.teal,
  ];

  static MaterialColor _toMaterialColor(Color color) => MaterialColor(color.getIntvalue, {
    50: color,
    100: color,
    200: color,
    300: color,
    400: color,
    500: color,
    600: color,
    700: color,
    800: color,
    900: color,
  });
}
