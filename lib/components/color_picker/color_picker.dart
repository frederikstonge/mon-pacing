import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';

import '../../models/constants.dart';
import '../bottom_sheet/bottom_sheet_appbar.dart';
import '../bottom_sheet/bottom_sheet_scaffold.dart';

class ColorPicker extends StatelessWidget {
  final Color initialColor;
  final String title;

  const ColorPicker({super.key, required this.initialColor, required this.title});

  @override
  Widget build(BuildContext context) {
    return BottomSheetScaffold(
      appBar: BottomSheetAppbar(title: title),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: MaterialColorPicker(
          selectedColor: initialColor,
          colors: Constants.colors,
          onColorChange: (value) {
            Navigator.of(context).pop(value);
          },
        ),
      ),
    );
  }
}
