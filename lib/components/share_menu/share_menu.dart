import 'package:material_ui/material_ui.dart';

import '../../../l10n/generated/app_localizations.dart';
import '../../../router/routes.dart';
import '../bottom_sheet/bottom_sheet_appbar.dart';
import '../bottom_sheet/bottom_sheet_scaffold.dart';

class ShareMenu extends StatelessWidget {
  final bool showShareText;
  final bool showShareFile;
  final bool showSaveFile;
  final ValueChanged<ShareMenuAction> onSelected;

  const ShareMenu({
    super.key,
    required this.onSelected,
    this.showShareText = false,
    this.showShareFile = false,
    this.showSaveFile = false,
  }) : assert(showShareText || showShareFile || showSaveFile, 'At least one action must be provided');

  @override
  Widget build(BuildContext context) {
    return BottomSheetScaffold(
      appBar: BottomSheetAppbar(title: S.of(context).share),
      body: ListView(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          if (showShareText) ...[
            InkWell(
              onTap: () => onSelected(ShareMenuAction.shareText),
              child: ListTile(
                leading: const Icon(Icons.copy),
                title: Text(S.of(context).shareText, maxLines: 1, overflow: TextOverflow.ellipsis),
              ),
            ),
          ],
          if (showShareFile) ...[
            InkWell(
              onTap: () => onSelected(ShareMenuAction.shareFile),
              child: ListTile(
                leading: const Icon(Icons.share),
                title: Text(S.of(context).shareFile, maxLines: 1, overflow: TextOverflow.ellipsis),
              ),
            ),
          ],
          if (showSaveFile) ...[
            InkWell(
              onTap: () => onSelected(ShareMenuAction.saveFile),
              child: ListTile(
                leading: const Icon(Icons.save),
                title: Text(S.of(context).saveFile, maxLines: 1, overflow: TextOverflow.ellipsis),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
