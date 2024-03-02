import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

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
      body: BlockPicker(
        pickerColor: initialColor,
        onColorChanged: (value) {
          Navigator.of(context).pop(value);
        },
      ),
    );
  }
}
