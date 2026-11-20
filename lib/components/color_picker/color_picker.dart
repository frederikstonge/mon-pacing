import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:material_ui/material_ui.dart';

import '../../models/constants.dart';
import '../bottom_sheet/bottom_sheet_appbar.dart';
import '../bottom_sheet/bottom_sheet_scaffold.dart';

class AColorPicker extends StatelessWidget {
  final Color initialColor;
  final String title;
  final ValueChanged<Color> onChanged;

  const AColorPicker({super.key, required this.initialColor, required this.title, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return BottomSheetScaffold(
      appBar: BottomSheetAppbar(title: title),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ColorPicker(
          pickersEnabled: {
            ColorPickerType.both: false,
            ColorPickerType.primary: false,
            ColorPickerType.accent: false,
            ColorPickerType.bw: false,
            ColorPickerType.custom: true,
            ColorPickerType.customSecondary: false,
            ColorPickerType.wheel: false,
          },
          enableShadesSelection: false,
          customColorSwatchesAndNames: Constants.colors,
          color: initialColor,
          onColorChanged: (value) {
            onChanged(value);
          },
        ),
      ),
    );
  }
}
