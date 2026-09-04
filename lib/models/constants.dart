import 'package:material_ui/material_ui.dart';

import '../extensions/color_extensions.dart';
import 'improvisation_fields.dart';

class Constants {
  static const double expandedAppbarHeight = 112;
  static const int maximumTeams = 3;
  static const int minimumTeams = 1;

  static Map<ColorSwatch<Object>, String> colors = {
    Colors.blue: 'Blue',
    Colors.red: 'Red',
    Colors.yellow: 'Yellow',
    Colors.green: 'Green',
    Colors.purple: 'Purple',
    Colors.pink: 'Pink',
    Colors.orange: 'Orange',
    Colors.brown: 'Brown',
    _toMaterialColor(Colors.white): 'White',
    _toMaterialColor(Colors.black): 'Black',
    Colors.grey: 'Grey',
    Colors.amber: 'Amber',
    Colors.cyan: 'Cyan',
    Colors.deepOrange: 'Deep Orange',
    Colors.deepPurple: 'Deep Purple',
    Colors.indigo: 'Indigo',
    Colors.lightBlue: 'Light Blue',
    Colors.lightGreen: 'Light Green',
    Colors.lime: 'Lime',
    Colors.teal: 'Teal',
  };

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

  static const defaultImprovisationFieldsOrder = [
    ImprovisationFields.type,
    ImprovisationFields.performers,
    ImprovisationFields.durations,
    ImprovisationFields.category,
    ImprovisationFields.theme,
    ImprovisationFields.notes,
  ];
}
