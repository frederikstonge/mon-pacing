import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ColorPickerDialog {
  static Future<void> showColorPickerDialog(BuildContext context, Color pickerColor, void Function(Color) onColorChanged) async {
    await showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: BlockPicker(
              pickerColor: pickerColor,
              onColorChanged: (value) {
                onColorChanged(value);
                Navigator.of(dialogContext).pop(true);
              },
            ),
          ),
        );
      },
    );
  }
}
