import 'dart:async';

import 'package:flutter/material.dart';

import '../../../components/bottom_sheet_dialog/bottom_sheet_dialog.dart';
import '../../../components/custom_card/custom_card.dart';
import '../../../l10n/app_localizations.dart';
import '../../../models/pacing_model.dart';
import 'pacing_menu.dart';

class PacingCard extends StatelessWidget {
  final FutureOr<bool?> Function() shouldDelete;
  final FutureOr<void> Function() delete;
  final FutureOr<void> Function() edit;
  final FutureOr<void> Function() export;
  final FutureOr<void> Function() startMatch;
  final PacingModel pacing;

  const PacingCard({
    super.key,
    required this.pacing,
    required this.shouldDelete,
    required this.delete,
    required this.edit,
    required this.export,
    required this.startMatch,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      background: Container(
        color: Colors.green,
        alignment: Alignment.centerLeft,
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            Icons.play_arrow,
            color: Colors.white,
          ),
        ),
      ),
      secondaryBackground: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
      ),
      key: ValueKey(pacing.id),
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.endToStart) {
          return await shouldDelete.call();
        } else {
          await startMatch.call();
          return false;
        }
      },
      onDismissed: (direction) async {
        if (direction == DismissDirection.endToStart) {
          await delete.call();
        }
      },
      child: InkWell(
        onLongPress: () {
          _openMenu(context);
        },
        onTap: () {
          edit.call();
        },
        child: CustomCard(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(pacing.name, style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold)),
                    Text(S.of(context).improvisationCount(pacing.improvisations.length)),
                    Text(S.of(context).modifiedDate(pacing.modifiedDate!)),
                  ],
                ),
              ),
              IconButton.filled(onPressed: () => _openMenu(context), icon: const Icon(Icons.more_vert))
            ],
          ),
        ),
      ),
    );
  }

  void _openMenu(BuildContext context) {
    BottomSheetDialog.showDialog(
      context: context,
      child: PacingMenu(
        pacing: pacing,
        edit: edit,
        startMatch: startMatch,
        export: export,
        delete: () async {
          final result = await shouldDelete();
          if (result == true) {
            await delete();
          }
        },
      ),
    );
  }
}
