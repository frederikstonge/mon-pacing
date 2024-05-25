import 'dart:async';

import 'package:flutter/material.dart';

import '../../../components/actions/loading_icon_button.dart';
import '../../../models/performer_model.dart';

class TeamPerformers extends StatelessWidget {
  final String label;
  final List<PerformerModel> performers;
  final int teamId;
  final FutureOr<void> Function(int teamId)? addPerformer;
  final FutureOr<void> Function(int teamId, int index, PerformerModel performer) editPerformer;
  final FutureOr<void> Function(int teamId, int index)? removePerformer;

  const TeamPerformers({
    super.key,
    required this.label,
    required this.performers,
    required this.teamId,
    required this.addPerformer,
    required this.editPerformer,
    required this.removePerformer,
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
        ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: performers
              .asMap()
              .entries
              .map(
                (d) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TeamPerformerItem(
                          key: ValueKey(d.value.id),
                          performer: d.value,
                          valueChanged: (value) async {
                            await editPerformer(teamId, d.key, value);
                          },
                        ),
                      ),
                      LoadingIconButton(
                        icon: const Icon(Icons.add),
                        onPressed: addPerformer != null
                            ? () async {
                                await addPerformer!(teamId);
                              }
                            : null,
                      ),
                      LoadingIconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: removePerformer != null
                            ? () async {
                                await removePerformer!(teamId, d.key);
                              }
                            : null,
                      ),
                    ],
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

  const TeamPerformerItem({
    super.key,
    required this.performer,
    required this.valueChanged,
  });

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
    return TextField(
      controller: _textController,
      onChanged: (value) => widget.valueChanged(widget.performer.copyWith(name: value)),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
      ),
    );
  }
}
