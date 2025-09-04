import 'dart:async';

import 'package:flutter/material.dart';

import '../../../l10n/generated/app_localizations.dart';
import '../bottom_sheet/bottom_sheet_appbar.dart';
import '../bottom_sheet/bottom_sheet_scaffold.dart';

class ShareMenu extends StatelessWidget {
  final String title;
  final FutureOr<void> Function()? shareText;
  final FutureOr<void> Function()? shareFile;
  final FutureOr<void> Function()? saveFile;

  const ShareMenu({super.key, required this.title, this.shareText, this.shareFile, this.saveFile})
    : assert(shareText != null || shareFile != null || saveFile != null, 'At least one action must be provided');

  @override
  Widget build(BuildContext context) {
    return BottomSheetScaffold(
      appBar: BottomSheetAppbar(title: title),
      body: ListView(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          if (shareText != null) ...[
            InkWell(
              onTap: () async {
                Navigator.of(context).pop();
                await shareText!.call();
              },
              child: ListTile(
                leading: const Icon(Icons.copy),
                title: Text(S.of(context).shareText, maxLines: 1, overflow: TextOverflow.ellipsis),
              ),
            ),
          ],
          if (shareFile != null) ...[
            InkWell(
              onTap: () async {
                Navigator.of(context).pop();
                await shareFile!.call();
              },
              child: ListTile(
                leading: const Icon(Icons.share),
                title: Text(S.of(context).shareFile, maxLines: 1, overflow: TextOverflow.ellipsis),
              ),
            ),
          ],
          if (saveFile != null) ...[
            InkWell(
              onTap: () async {
                Navigator.of(context).pop();
                await saveFile!.call();
              },
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
