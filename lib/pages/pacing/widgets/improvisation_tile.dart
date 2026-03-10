import 'dart:async';

import 'package:flutter/material.dart';

import '../../../components/buttons/loading_button.dart';
import '../../../components/custom_card/custom_card.dart';
import '../../../components/improvisation_detail/improvisation_detail.dart';
import '../../../components/improvisation_detail/improvisation_short_detail.dart';
import '../../../extensions/duration_extensions.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../../models/improvisation_fields.dart';
import '../../../models/improvisation_model.dart';
import '../../../models/improvisation_type.dart';

class ImprovisationTile extends StatefulWidget {
  final Duration? durationToThisIndex;
  final ImprovisationModel improvisation;
  final List<ImprovisationFields> improvisationFieldsOrder;
  final int index;
  final FutureOr<void> Function(ImprovisationModel value) onChanged;
  final FutureOr<void> Function(ImprovisationModel value) onDelete;
  final FutureOr<bool?> Function(ImprovisationModel value) onConfirmDelete;
  final bool dragEnabled;
  final FutureOr<void> Function() onDragStart;
  final Key? cardKey;
  final Key? dragKey;

  const ImprovisationTile({
    super.key,
    required this.improvisation,
    required this.improvisationFieldsOrder,
    required this.index,
    required this.onChanged,
    required this.onDelete,
    required this.onConfirmDelete,
    required this.dragEnabled,
    required this.onDragStart,
    this.durationToThisIndex,
    this.cardKey,
    this.dragKey,
  });

  @override
  State<ImprovisationTile> createState() => _ImprovisationTileState();
}

class _ImprovisationTileState extends State<ImprovisationTile> with AutomaticKeepAliveClientMixin {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Material(
      child: Dismissible(
        key: ValueKey(widget.improvisation.id),
        direction: DismissDirection.endToStart,
        background: Container(
          color: Colors.red,
          alignment: Alignment.centerRight,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.delete, color: Colors.white),
          ),
        ),
        confirmDismiss: (direction) async => await widget.onConfirmDelete.call(widget.improvisation),
        onDismissed: (direction) async => await widget.onDelete.call(widget.improvisation),
        child: CustomCard(
          key: widget.cardKey,
          showIndicator: true,
          indicatorColor: widget.improvisation.type == ImprovisationType.compared
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.secondary,
          contentPadding: 0,
          child: ExpansionTile(
            onExpansionChanged: (value) => setState(() {
              isExpanded = value;
            }),
            leading: widget.dragEnabled
                ? ReorderableDragStartListener(
                    index: widget.index,
                    enabled: widget.dragEnabled,
                    child: Icon(key: widget.dragKey, Icons.drag_handle),
                  )
                : null,
            title: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (widget.durationToThisIndex != null) ...[
                  Text(
                    '${widget.durationToThisIndex!.toImprovDuration()} - ${S.of(context).improvisationNumber(order: widget.index + 1)}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
                AnimatedSize(
                  alignment: Alignment.topCenter,
                  duration: const Duration(milliseconds: 200),
                  child: SizedBox(
                    height: !isExpanded ? null : 0.0,
                    child: ImprovisationShortDetail(
                      improvisation: widget.improvisation,
                      improvisationFieldsOrder: widget.improvisationFieldsOrder,
                    ),
                  ),
                ),
              ],
            ),
            childrenPadding: const EdgeInsets.all(16),
            children: [
              ImprovisationDetail(
                improvisation: widget.improvisation,
                improvisationFieldsOrder: widget.improvisationFieldsOrder,
                onChanged: widget.onChanged,
                onDragStart: widget.onDragStart,
                searchEnabled: true,
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

  @override
  bool get wantKeepAlive => true;
}
