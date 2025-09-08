import 'dart:async';

import 'package:flutter/material.dart';

import '../../../l10n/generated/app_localizations.dart';
import '../../models/team_model.dart';
import '../bottom_sheet/bottom_sheet_appbar.dart';
import '../bottom_sheet/bottom_sheet_scaffold.dart';

class TeamMenu extends StatelessWidget {
  final TeamModel team;
  final FutureOr<void> Function() edit;
  final FutureOr<void> Function() share;
  final FutureOr<void> Function() duplicate;
  final FutureOr<void> Function() delete;

  const TeamMenu({
    super.key,
    required this.team,
    required this.edit,
    required this.share,
    required this.duplicate,
    required this.delete,
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
            onTap: () async {
              Navigator.of(context).pop();
              await edit.call();
            },
            child: ListTile(
              leading: const Icon(Icons.edit),
              title: Text(S.of(context).edit, maxLines: 1, overflow: TextOverflow.ellipsis),
            ),
          ),
          InkWell(
            onTap: () async {
              Navigator.of(context).pop();
              await share.call();
            },
            child: ListTile(
              leading: const Icon(Icons.share),
              title: Text(S.of(context).share, maxLines: 1, overflow: TextOverflow.ellipsis),
            ),
          ),
          InkWell(
            onTap: () async {
              Navigator.of(context).pop();
              await duplicate.call();
            },
            child: ListTile(
              leading: const Icon(Icons.copy),
              title: Text(S.of(context).duplicate, maxLines: 1, overflow: TextOverflow.ellipsis),
            ),
          ),
          InkWell(
            onTap: () async {
              Navigator.of(context).pop();
              await delete.call();
            },
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
