import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ColorPickerDialog {
  static showColorPickerDialog(BuildContext context, Color pickerColor, void Function(Color) onColorChanged) {
    showDialog(
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
