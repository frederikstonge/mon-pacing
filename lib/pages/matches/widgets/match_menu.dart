import 'dart:async';

import 'package:flutter/material.dart';

import '../../../components/bottom_sheet_dialog/bottom_sheet_appbar.dart';
import '../../../components/bottom_sheet_dialog/bottom_sheet_scaffold.dart';
import '../../../l10n/app_localizations.dart';
import '../../../models/match_model.dart';

class MatchMenu extends StatelessWidget {
  final MatchModel match;
  final FutureOr<void> Function() open;
  final FutureOr<void> Function() delete;

  const MatchMenu({
    super.key,
    required this.match,
    required this.open,
    required this.delete,
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
          InkWell(
            onTap: () async {
              Navigator.of(context).pop();
              await open.call();
            },
            child: ListTile(
              leading: const Icon(Icons.play_arrow),
              title: Text(
                S.of(context).open,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          InkWell(
            onTap: () async {
              Navigator.of(context).pop();
              await delete();
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
