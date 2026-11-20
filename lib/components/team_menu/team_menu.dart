import 'package:material_ui/material_ui.dart';

import '../../../l10n/generated/app_localizations.dart';
import '../../../router/routes.dart';
import '../../models/team_model.dart';
import '../bottom_sheet/bottom_sheet_appbar.dart';
import '../bottom_sheet/bottom_sheet_scaffold.dart';

class TeamMenu extends StatelessWidget {
  final TeamModel team;
  final ValueChanged<TeamMenuAction> onSelected;

  const TeamMenu({
    super.key,
    required this.team,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return BottomSheetScaffold(
      appBar: BottomSheetAppbar(title: team.name),
      body: ListView(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          InkWell(
            onTap: () => onSelected(TeamMenuAction.edit),
            child: ListTile(
              leading: const Icon(Icons.edit),
              title: Text(S.of(context).edit, maxLines: 1, overflow: TextOverflow.ellipsis),
            ),
          ),
          InkWell(
            onTap: () => onSelected(TeamMenuAction.share),
            child: ListTile(
              leading: const Icon(Icons.share),
              title: Text(S.of(context).share, maxLines: 1, overflow: TextOverflow.ellipsis),
            ),
          ),
          InkWell(
            onTap: () => onSelected(TeamMenuAction.duplicate),
            child: ListTile(
              leading: const Icon(Icons.copy),
              title: Text(S.of(context).duplicate, maxLines: 1, overflow: TextOverflow.ellipsis),
            ),
          ),
          InkWell(
            onTap: () => onSelected(TeamMenuAction.delete),
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
