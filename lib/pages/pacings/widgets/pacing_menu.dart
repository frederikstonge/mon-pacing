import 'dart:async';

import 'package:flutter/material.dart';

import '../../../components/bottom_sheet_dialog/bottom_sheet_appbar.dart';
import '../../../components/bottom_sheet_dialog/bottom_sheet_scaffold.dart';
import '../../../l10n/app_localizations.dart';
import '../../../models/pacing_model.dart';

class PacingMenu extends StatelessWidget {
  final PacingModel pacing;
  final FutureOr<void> Function() edit;
  final FutureOr<void> Function() startMatch;
  final FutureOr<void> Function() export;
  final FutureOr<void> Function() delete;

  const PacingMenu({
    super.key,
    required this.pacing,
    required this.edit,
    required this.delete,
    required this.startMatch,
    required this.export,
  });

  @override
  Widget build(BuildContext context) {
    return BottomSheetScaffold(
      appBar: BottomSheetAppbar(title: Text(pacing.name)),
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
              title: Text(S.of(context).edit),
            ),
          ),
          InkWell(
            onTap: () async {
              Navigator.of(context).pop();
              await startMatch.call();
            },
            child: ListTile(
              leading: const Icon(Icons.play_arrow),
              title: Text(S.of(context).startMatch),
            ),
          ),
          InkWell(
            onTap: () async {
              Navigator.of(context).pop();
              await export.call();
            },
            child: ListTile(
              leading: const Icon(Icons.upload),
              title: Text(S.of(context).export),
            ),
          ),
          InkWell(
            onTap: () async {
              Navigator.of(context).pop();
              await delete();
            },
            child: ListTile(
              leading: const Icon(Icons.delete),
              title: Text(S.of(context).delete),
            ),
          ),
        ],
      ),
    );
  }
}
