import 'dart:async';

import 'package:flutter/material.dart';

import '../../../components/bottom_sheet/bottom_sheet_dialog.dart';
import '../../../components/buttons/loading_icon_button.dart';
import '../../../components/custom_card/custom_card.dart';
import '../../../components/tags_display/tags_display.dart';
import '../../../components/team_color_avatar/team_color_avatar.dart';
import '../../../components/team_menu/team_menu.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../../models/team_model.dart';

class TeamCard extends StatelessWidget {
  final FutureOr<bool?> Function() shouldDelete;
  final FutureOr<void> Function() delete;
  final FutureOr<void> Function() edit;
  final FutureOr<void> Function() share;
  final FutureOr<void> Function() duplicate;
  final FutureOr<void> Function() onLongPress;
  final TeamModel team;

  const TeamCard({
    super.key,
    required this.team,
    required this.shouldDelete,
    required this.delete,
    required this.edit,
    required this.share,
    required this.duplicate,
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
      key: ValueKey(team.id),
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
                        TeamColorAvatar(color: Color(team.color)),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            team.name,
                            style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    TagsDisplay(tags: team.tags),
                    Text(
                      S.of(context).performerCount(count: team.performers.length),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      S.of(context).modifiedDate(date: team.modifiedDate!),
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
      child: TeamMenu(
        team: team,
        edit: edit,
        share: share,
        duplicate: duplicate,
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
