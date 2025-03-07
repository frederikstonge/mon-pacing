import 'dart:async';

import 'package:flutter/material.dart';

import '../../../l10n/generated/app_localizations.dart';
import '../../../models/pacing_model.dart';
import '../bottom_sheet/bottom_sheet_appbar.dart';
import '../bottom_sheet/bottom_sheet_scaffold.dart';

class PacingMenu extends StatelessWidget {
  final PacingModel pacing;
  final FutureOr<void> Function() startMatch;
  final FutureOr<void> Function()? edit;
  final FutureOr<void> Function()? editDetails;
  final FutureOr<void> Function() export;
  final FutureOr<void> Function() duplicate;
  final FutureOr<void> Function() delete;

  const PacingMenu({
    super.key,
    required this.pacing,
    required this.startMatch,
    required this.export,
    required this.duplicate,
    required this.delete,
    this.edit,
    this.editDetails,
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
          if (editDetails != null) ...[
            InkWell(
              onTap: () async {
                Navigator.of(context).pop();
                await editDetails!.call();
              },
              child: ListTile(
                leading: const Icon(Icons.edit_document),
                title: Text(S.of(context).editDetails, maxLines: 1, overflow: TextOverflow.ellipsis),
              ),
            ),
          ],
          InkWell(
            onTap: () async {
              Navigator.of(context).pop();
              await startMatch.call();
            },
            child: ListTile(
              leading: const Icon(Icons.play_arrow),
              title: Text(S.of(context).startMatch, maxLines: 1, overflow: TextOverflow.ellipsis),
            ),
          ),
          if (edit != null) ...[
            InkWell(
              onTap: () async {
                Navigator.of(context).pop();
                await edit!.call();
              },
              child: ListTile(
                leading: const Icon(Icons.edit),
                title: Text(S.of(context).edit, maxLines: 1, overflow: TextOverflow.ellipsis),
              ),
            ),
          ],
          InkWell(
            onTap: () async {
              Navigator.of(context).pop();
              await export.call();
            },
            child: ListTile(
              leading: const Icon(Icons.upload),
              title: Text(S.of(context).exportPacing, maxLines: 1, overflow: TextOverflow.ellipsis),
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
