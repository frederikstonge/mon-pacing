import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

import '../../../components/buttons/loading_icon_button.dart';
import '../../../components/custom_card/custom_card.dart';
import '../../../components/tags_display/tags_display.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../../models/pacing_model.dart';
import '../../../router/routes.dart';
import '../../../services/router_service.dart';

class PacingCard extends StatelessWidget {
  final FutureOr<bool?> Function() shouldDelete;
  final FutureOr<void> Function() delete;
  final FutureOr<void> Function() edit;
  final FutureOr<void> Function() share;
  final FutureOr<void> Function() duplicate;
  final FutureOr<void> Function() startMatch;
  final FutureOr<void> Function() onLongPress;
  final PacingModel pacing;

  const PacingCard({
    super.key,
    required this.pacing,
    required this.shouldDelete,
    required this.delete,
    required this.edit,
    required this.share,
    required this.duplicate,
    required this.startMatch,
    required this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      background: Container(
        color: Colors.green,
        alignment: Alignment.centerLeft,
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.play_arrow, color: Colors.white),
        ),
      ),
      secondaryBackground: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.delete, color: Colors.white),
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
                            pacing.name,
                            style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (pacing.integrationId != null) ...[
                          Padding(padding: const EdgeInsets.all(4.0), child: Icon(Icons.cloud_done, size: 16)),
                        ],
                      ],
                    ),
                    TagsDisplay(tags: pacing.tags),
                    Text(
                      S.of(context).improvisationCount(count: pacing.improvisations.length),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      S.of(context).modifiedDate(date: pacing.modifiedDate!),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              LoadingIconButton.tonal(
                onPressed: () => startMatch(),
                tooltip: S.of(context).startMatch,
                icon: const Icon(Icons.play_arrow),
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
    final action = await context.read<RouterService>().showPacingMenuModal(pacing: pacing, showEdit: true);
    if (!context.mounted || action == null) return;
    switch (action) {
      case PacingMenuAction.startMatch:
        await startMatch();
      case PacingMenuAction.edit:
        await edit();
      case PacingMenuAction.share:
        await share();
      case PacingMenuAction.duplicate:
        await duplicate();
      case PacingMenuAction.delete:
        if (await shouldDelete() == true) {
          await delete();
        }
      case PacingMenuAction.editDetails:
        break;
    }
  }
}
