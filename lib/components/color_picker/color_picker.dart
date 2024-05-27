import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';

import '../bottom_sheet_dialog/bottom_sheet_appbar.dart';
import '../bottom_sheet_dialog/bottom_sheet_scaffold.dart';

class ColorPicker extends StatelessWidget {
  final Color initialColor;
  final String title;

  const ColorPicker({
    super.key,
    required this.initialColor,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return BottomSheetScaffold(
      appBar: BottomSheetAppbar(
        title: title,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: MaterialColorPicker(
          selectedColor: initialColor,
          colors: [
            Colors.blue,
            Colors.red,
            Colors.yellow,
            Colors.green,
            Colors.purple,
            Colors.pink,
            Colors.orange,
            Colors.brown,
            toMaterialColor(Colors.white),
            toMaterialColor(Colors.black),
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
          ],
          onColorChange: (value) {
            Navigator.of(context).pop(value);
          },
        ),
      ),
    );
  }

  MaterialColor toMaterialColor(Color color) {
    return MaterialColor(color.value, {
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
}
