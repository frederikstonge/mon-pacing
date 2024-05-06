import 'dart:async';

import 'package:flutter/material.dart';

import '../../../components/actions/loading_icon_button.dart';
import '../../../components/bottom_sheet_dialog/bottom_sheet_dialog.dart';
import '../../../components/custom_card/custom_card.dart';
import '../../../components/match_menu/match_menu.dart';
import '../../../l10n/app_localizations.dart';
import '../../../models/match_model.dart';

class MatchCard extends StatelessWidget {
  final FutureOr<bool?> Function() shouldDelete;
  final FutureOr<void> Function() delete;
  final FutureOr<void> Function() edit;
  final FutureOr<void> Function() onLongPress;
  final MatchModel match;

  const MatchCard({
    super.key,
    required this.match,
    required this.shouldDelete,
    required this.delete,
    required this.edit,
    required this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      background: Container(
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
      key: ValueKey(match.id),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) async => await shouldDelete.call(),
      onDismissed: (direction) async => await delete.call(),
      child: InkWell(
        onLongPress: () {
          onLongPress();
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
                    Text(
                      match.name,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      match.teams.map((e) => e.name).join(' ${S.of(context).versus} '),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      S.of(context).modifiedDate(match.modifiedDate!),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              LoadingIconButton.filled(onPressed: () => _openMenu(context), icon: const Icon(Icons.more_vert))
            ],
          ),
        ),
      ),
    );
  }

  void _openMenu(BuildContext context) {
    BottomSheetDialog.showDialog(
      context: context,
      child: MatchMenu(
        match: match,
        edit: edit,
        delete: () async {
          final result = await shouldDelete();
          if (result == true) {
            await delete.call();
          }
        },
      ),
    );
  }
}
