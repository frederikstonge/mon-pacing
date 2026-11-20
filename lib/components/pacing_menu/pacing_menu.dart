import 'package:material_ui/material_ui.dart';

import '../../../l10n/generated/app_localizations.dart';
import '../../../models/pacing_model.dart';
import '../../../router/routes.dart';
import '../bottom_sheet/bottom_sheet_appbar.dart';
import '../bottom_sheet/bottom_sheet_scaffold.dart';

class PacingMenu extends StatelessWidget {
  final PacingModel pacing;
  final bool showEdit;
  final bool showEditDetails;
  final ValueChanged<PacingMenuAction> onSelected;

  const PacingMenu({
    super.key,
    required this.pacing,
    required this.onSelected,
    this.showEdit = false,
    this.showEditDetails = false,
  });

  @override
  Widget build(BuildContext context) {
    return BottomSheetScaffold(
      appBar: BottomSheetAppbar(title: pacing.name),
      body: ListView(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          if (showEditDetails) ...[
            InkWell(
              onTap: () => onSelected(PacingMenuAction.editDetails),
              child: ListTile(
                leading: const Icon(Icons.edit_document),
                title: Text(S.of(context).editDetails, maxLines: 1, overflow: TextOverflow.ellipsis),
              ),
            ),
          ],
          InkWell(
            onTap: () => onSelected(PacingMenuAction.startMatch),
            child: ListTile(
              leading: const Icon(Icons.play_arrow),
              title: Text(S.of(context).startMatch, maxLines: 1, overflow: TextOverflow.ellipsis),
            ),
          ),
          if (showEdit) ...[
            InkWell(
              onTap: () => onSelected(PacingMenuAction.edit),
              child: ListTile(
                leading: const Icon(Icons.edit),
                title: Text(S.of(context).edit, maxLines: 1, overflow: TextOverflow.ellipsis),
              ),
            ),
          ],
          InkWell(
            onTap: () => onSelected(PacingMenuAction.share),
            child: ListTile(
              leading: const Icon(Icons.share),
              title: Text(S.of(context).share, maxLines: 1, overflow: TextOverflow.ellipsis),
            ),
          ),
          InkWell(
            onTap: () => onSelected(PacingMenuAction.duplicate),
            child: ListTile(
              leading: const Icon(Icons.copy),
              title: Text(S.of(context).duplicate, maxLines: 1, overflow: TextOverflow.ellipsis),
            ),
          ),
          InkWell(
            onTap: () => onSelected(PacingMenuAction.delete),
            child: ListTile(
              leading: Icon(Icons.delete, color: Theme.of(context).colorScheme.error),
              title: Text(
                S.of(context).delete,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
