import 'dart:async';

import 'package:flutter/material.dart';

import '../../../components/bottom_sheet/bottom_sheet_dialog.dart';
import '../../../components/buttons/loading_icon_button.dart';
import '../../../components/custom_card/custom_card.dart';
import '../../../components/match_menu/match_menu.dart';
import '../../../components/tags_display/tags_display.dart';
import '../../../components/team_color_avatar/team_color_avatar.dart';
import '../../../l10n/generated/app_localizations.dart';
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
          child: Icon(Icons.delete, color: Colors.white),
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
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            match.name,
                            style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (match.integrationId != null) ...[
                          Padding(padding: const EdgeInsets.all(4.0), child: Icon(Icons.cloud_done, size: 16)),
                        ],
                      ],
                    ),
                    TagsDisplay(tags: match.tags),
                    if (match.enableStatistics) ...[
                      Row(
                        children: match.teams
                            .asMap()
                            .entries
                            .map(
                              (e) => Flexible(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    if (e.key != 0) ...[
                                      Text(' ${S.of(context).versus} ', maxLines: 1, overflow: TextOverflow.ellipsis),
                                    ],
                                    TeamColorAvatar(color: Color(e.value.color)),
                                    const SizedBox(width: 6),
                                    Flexible(child: Text(e.value.name, maxLines: 1, overflow: TextOverflow.ellipsis)),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ],
                    Text(
                      S.of(context).modifiedDate(date: match.modifiedDate!),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              LoadingIconButton.filled(
                onPressed: () => _openMenu(context),
                icon: const Icon(Icons.more_vert),
                tooltip: S.of(context).more,
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
