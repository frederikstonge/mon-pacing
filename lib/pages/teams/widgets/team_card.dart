import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

import '../../../components/buttons/loading_icon_button.dart';
import '../../../components/custom_card/custom_card.dart';
import '../../../components/tags_display/tags_display.dart';
import '../../../components/team_color_avatar/team_color_avatar.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../../models/team_model.dart';
import '../../../router/routes.dart';
import '../../../services/router_service.dart';

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

  Future<void> _openMenu(BuildContext context) async {
    final action = await context.read<RouterService>().showTeamMenuModal(team);
    if (!context.mounted || action == null) return;
    switch (action) {
      case TeamMenuAction.edit:
        await edit();
      case TeamMenuAction.share:
        await share();
      case TeamMenuAction.duplicate:
        await duplicate();
      case TeamMenuAction.delete:
        if (await shouldDelete() == true) {
          await delete();
        }
    }
  }
}
