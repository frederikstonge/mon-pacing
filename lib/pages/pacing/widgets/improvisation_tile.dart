import 'dart:async';

import 'package:flutter/material.dart';

import '../../../components/actions/loading_button.dart';
import '../../../components/custom_card/custom_card.dart';
import '../../../components/improvisation_detail/improvisation_detail.dart';
import '../../../extensions/duration_extensions.dart';
import '../../../extensions/improvisation_extensions.dart';
import '../../../extensions/pacing_extensions.dart';
import '../../../l10n/app_localizations.dart';
import '../../../models/improvisation_model.dart';
import '../../../models/improvisation_type.dart';
import '../../../models/pacing_model.dart';

class ImprovisationTile extends StatefulWidget {
  final PacingModel pacing;
  final ImprovisationModel improvisation;
  final int index;
  final FutureOr<void> Function(ImprovisationModel value) onChanged;
  final FutureOr<void> Function(ImprovisationModel value) onDelete;
  final FutureOr<bool?> Function(ImprovisationModel value) onConfirmDelete;
  final bool dragEnabled;

  const ImprovisationTile({
    super.key,
    required this.pacing,
    required this.improvisation,
    required this.index,
    required this.onChanged,
    required this.onDelete,
    required this.onConfirmDelete,
    required this.dragEnabled,
  });

  @override
  State<ImprovisationTile> createState() => _ImprovisationTileState();
}

class _ImprovisationTileState extends State<ImprovisationTile> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Dismissible(
        key: ValueKey(widget.improvisation.id),
        direction: DismissDirection.endToStart,
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
        confirmDismiss: (direction) async => await widget.onConfirmDelete.call(widget.improvisation),
        onDismissed: (direction) async => await widget.onDelete.call(widget.improvisation),
        child: CustomCard(
          contentPadding: 0,
          child: ExpansionTile(
            onExpansionChanged: (value) => setState(() {
              isExpanded = value;
            }),
            leading: ReorderableDragStartListener(
              index: widget.index,
              enabled: widget.dragEnabled,
              child: const Icon(Icons.drag_handle),
            ),
            title: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${widget.pacing.totalDuration(take: widget.index).toImprovDuration()} - ${S.of(context).improvisationNumber(widget.index + 1)}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                AnimatedSize(
                  alignment: Alignment.topCenter,
                  duration: const Duration(milliseconds: 200),
                  child: SizedBox(
                    height: !isExpanded ? null : 0.0,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${S.of(context).type}: ${widget.improvisation.type == ImprovisationType.mixed ? S.of(context).mixed : S.of(context).compared}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                        Text(
                          '${S.of(context).category}: ${widget.improvisation.getCategoryString(S.of(context))}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                        Text(
                          '${S.of(context).performers}: ${widget.improvisation.getPerformersString(S.of(context))}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                        Text(
                          '${S.of(context).duration}: ${widget.improvisation.durationsInSeconds.map((e) => Duration(seconds: e).toImprovDuration()).join(', ')}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                        Text(
                          '${S.of(context).theme}: ${widget.improvisation.theme}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            childrenPadding: const EdgeInsets.all(16),
            children: [
              ImprovisationDetail(
                improvisation: widget.improvisation,
                onChanged: widget.onChanged,
              ),
              const SizedBox(height: 8),
              LoadingButton.tonalIcon(
                onPressed: () async {
                  final response = await widget.onConfirmDelete(widget.improvisation);
                  if (response == true) {
                    await widget.onDelete.call(widget.improvisation);
                  }
                },
                icon: const Icon(Icons.delete),
                child: Text(S.of(context).delete),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
