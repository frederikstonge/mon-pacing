import 'package:material_ui/material_ui.dart';

import 'bottom_sheet_content.dart';

class BottomSheetDialog {
  static Future<T?> showDialog<T>({required BuildContext context, required Widget child}) async {
    return await showModalBottomSheet(
      barrierColor: Theme.of(context).colorScheme.onSurface.withAlpha(100),
      context: context,
      useRootNavigator: true,
      useSafeArea: true,
      isScrollControlled: true,
      builder: (context) {
        return BottomSheetContent(child: child);
      },
    );
  }
}
