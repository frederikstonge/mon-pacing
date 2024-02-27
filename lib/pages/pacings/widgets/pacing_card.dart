import 'dart:async';

import 'package:flutter/material.dart';

import '../../../components/bottom_sheet_dialog/bottom_sheet_dialog.dart';
import '../../../components/custom_card/custom_card.dart';
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
      confirmDismiss: (direction) async => direction == DismissDirection.endToStart ? await shouldDelete.call() : true,
      onDismissed: (direction) => direction == DismissDirection.endToStart ? delete.call() : startMatch.call(),
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(pacing.name),
                  Text(pacing.improvisations.length.toString()),
                  Text(pacing.modifiedDate.toString()),
                ],
              ),
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
