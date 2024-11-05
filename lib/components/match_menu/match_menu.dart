import 'dart:async';

import 'package:flutter/material.dart';

import '../../../components/bottom_sheet_dialog/bottom_sheet_appbar.dart';
import '../../../components/bottom_sheet_dialog/bottom_sheet_scaffold.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../../models/match_model.dart';

class MatchMenu extends StatelessWidget {
  final MatchModel match;
  final FutureOr<void> Function()? edit;
  final FutureOr<void> Function()? editDetails;
  final FutureOr<void> Function() delete;

  const MatchMenu({
    super.key,
    required this.match,
    required this.delete,
    this.edit,
    this.editDetails,
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
          if (editDetails != null) ...[
            InkWell(
              onTap: () async {
                Navigator.of(context).pop();
                await editDetails!.call();
              },
              child: ListTile(
                leading: const Icon(Icons.edit_document),
                title: Text(
                  S.of(context).editDetails,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
          if (edit != null) ...[
            InkWell(
              onTap: () async {
                Navigator.of(context).pop();
                await edit!.call();
              },
              child: ListTile(
                leading: const Icon(Icons.edit),
                title: Text(
                  S.of(context).edit,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
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
