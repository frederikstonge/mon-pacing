import 'package:material_ui/material_ui.dart';

import '../../../l10n/generated/app_localizations.dart';
import '../../../models/match_model.dart';
import '../../../router/routes.dart';
import '../bottom_sheet/bottom_sheet_appbar.dart';
import '../bottom_sheet/bottom_sheet_scaffold.dart';

class MatchMenu extends StatelessWidget {
  final MatchModel match;
  final bool showEdit;
  final bool showEditDetails;
  final ValueChanged<MatchMenuAction> onSelected;

  const MatchMenu({
    super.key,
    required this.match,
    required this.onSelected,
    this.showEdit = false,
    this.showEditDetails = false,
  });

  @override
  Widget build(BuildContext context) {
    return BottomSheetScaffold(
      appBar: BottomSheetAppbar(title: match.name),
      body: ListView(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          if (showEditDetails) ...[
            InkWell(
              onTap: () => onSelected(MatchMenuAction.editDetails),
              child: ListTile(
                leading: const Icon(Icons.edit_document),
                title: Text(S.of(context).editDetails, maxLines: 1, overflow: TextOverflow.ellipsis),
              ),
            ),
          ],
          if (showEdit) ...[
            InkWell(
              onTap: () => onSelected(MatchMenuAction.edit),
              child: ListTile(
                leading: const Icon(Icons.edit),
                title: Text(S.of(context).edit, maxLines: 1, overflow: TextOverflow.ellipsis),
              ),
            ),
          ],
          InkWell(
            onTap: () => onSelected(MatchMenuAction.delete),
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
