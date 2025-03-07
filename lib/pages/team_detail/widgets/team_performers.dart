import 'dart:async';

import 'package:flutter/material.dart';

import '../../../components/buttons/loading_icon_button.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../../models/performer_model.dart';
import '../../../validators/validators.dart';

class TeamPerformers extends StatelessWidget {
  final String label;
  final List<PerformerModel> performers;
  final FutureOr<void> Function()? addPerformer;
  final FutureOr<void> Function(int index, PerformerModel performer) editPerformer;
  final FutureOr<void> Function(int index)? removePerformer;
  final FutureOr<void> Function(int oldIndex, int newIndex) onDrag;
  final FutureOr<void> Function() onDragStart;

  const TeamPerformers({
    super.key,
    required this.label,
    required this.performers,
    required this.addPerformer,
    required this.editPerformer,
    required this.removePerformer,
    required this.onDrag,
    required this.onDragStart,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Text(
            label,
            style: Theme.of(context).textTheme.labelMedium,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        ReorderableListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          onReorderStart: (index) => onDragStart(),
          onReorder: (oldIndex, newIndex) => onDrag(oldIndex, newIndex),
          children:
              performers
                  .asMap()
                  .entries
                  .map(
                    (d) => Container(
                      key: ValueKey(d.value.id),
                      color: Theme.of(context).cardTheme.color,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: ReorderableDragStartListener(index: d.key, child: const Icon(Icons.drag_handle)),
                            ),
                            Expanded(
                              child: TeamPerformerItem(
                                key: ValueKey(d.value.id),
                                performer: d.value,
                                valueChanged: (value) async {
                                  await editPerformer(d.key, value);
                                },
                              ),
                            ),
                            LoadingIconButton(
                              tooltip: S.of(context).add,
                              icon: const Icon(Icons.add),
                              onPressed:
                                  addPerformer != null
                                      ? () async {
                                        await addPerformer!();
                                      }
                                      : null,
                            ),
                            LoadingIconButton(
                              tooltip: S.of(context).remove,
                              icon: const Icon(Icons.remove),
                              onPressed:
                                  removePerformer != null
                                      ? () async {
                                        await removePerformer!(d.key);
                                      }
                                      : null,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
        ),
      ],
    );
  }
}

class TeamPerformerItem extends StatefulWidget {
  final PerformerModel performer;
  final ValueChanged<PerformerModel> valueChanged;

  const TeamPerformerItem({super.key, required this.performer, required this.valueChanged});

  @override
  State<TeamPerformerItem> createState() => _TeamPerformerItemState();
}

class _TeamPerformerItemState extends State<TeamPerformerItem> {
  final _textController = TextEditingController();

  @override
  void initState() {
    _textController.text = widget.performer.name;
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _textController,
      textCapitalization: TextCapitalization.sentences,
      onChanged: (value) => widget.valueChanged(widget.performer.copyWith(name: value)),
      decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(6.0))),
      validator: (value) => Validators.stringRequired(value),
    );
  }
}
