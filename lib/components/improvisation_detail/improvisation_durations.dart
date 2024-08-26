import 'dart:async';

import 'package:flutter/material.dart';

import '../../extensions/duration_extensions.dart';
import '../../l10n/app_localizations.dart';
import '../actions/loading_icon_button.dart';
import '../bottom_sheet_dialog/bottom_sheet_dialog.dart';
import '../duration_picker/duration_picker.dart';

class ImprovisationDurations extends StatelessWidget {
  final String label;
  final List<int> durations;
  final FutureOr<void> Function(List<int> durations) onChanged;
  final FutureOr<void> Function() onDragStart;

  const ImprovisationDurations({
    super.key,
    required this.label,
    required this.durations,
    required this.onChanged,
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
          onReorder: _drag,
          children: durations
              .asMap()
              .entries
              .map(
                (d) => Padding(
                  key: ValueKey('${d.key}${d.value}'),
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: ReorderableDragStartListener(
                          index: d.key,
                          enabled: durations.length > 1,
                          child: const Icon(Icons.drag_handle),
                        ),
                      ),
                      Expanded(
                        child: ImprovisationDurationItem(
                          key: ValueKey('${d.key}${d.value}'),
                          duration: Duration(seconds: d.value),
                          valueChanged: (value) async {
                            final newDurations = List<int>.from(durations);
                            newDurations[d.key] = value.inSeconds;
                            await onChanged(newDurations);
                          },
                        ),
                      ),
                      LoadingIconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () async {
                          final newDurations = List<int>.from(durations);
                          newDurations.insert(d.key + 1, d.value);
                          await onChanged(newDurations);
                        },
                      ),
                      LoadingIconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: durations.length > 1
                            ? () async {
                                final newDurations = List<int>.from(durations);
                                newDurations.removeAt(d.key);
                                await onChanged(newDurations);
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

  void _drag(int oldIndex, int newIndex) {
    final newDurations = List<int>.from(durations);
    final duration = newDurations.removeAt(oldIndex);

    if (oldIndex < newIndex) {
      newIndex--;
    }

    newDurations.insert(newIndex, duration);
    onChanged.call(newDurations);
  }
}

class ImprovisationDurationItem extends StatefulWidget {
  final Duration duration;
  final ValueChanged<Duration> valueChanged;

  const ImprovisationDurationItem({
    super.key,
    required this.duration,
    required this.valueChanged,
  });

  @override
  State<ImprovisationDurationItem> createState() => _ImprovisationDurationItemState();
}

class _ImprovisationDurationItemState extends State<ImprovisationDurationItem> {
  final _textController = TextEditingController();

  @override
  void initState() {
    _textController.text = widget.duration.toImprovDuration();
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
      readOnly: true,
      controller: _textController,
      onTap: () async {
        final newDuration = await BottomSheetDialog.showDialog<Duration>(
          context: context,
          builder: (context) => DurationPicker(
            title: S.of(context).duration,
            initialDuration: widget.duration,
          ),
        );

        if (newDuration != null) {
          _textController.text = newDuration.toImprovDuration();
          widget.valueChanged(newDuration);
        }
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
      ),
    );
  }
}
