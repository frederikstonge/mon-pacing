import 'dart:async';

import 'package:flutter/material.dart';
import 'package:recase/recase.dart';

import '../../../models/improvisation_fields.dart';

class ImprovisationFieldsOrder extends StatelessWidget {
  final List<ImprovisationFields> fields;
  final FutureOr<void> Function(List<ImprovisationFields> fields) onChanged;
  final FutureOr<void> Function() onDragStart;

  const ImprovisationFieldsOrder({super.key, required this.fields, required this.onChanged, required this.onDragStart});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ReorderableListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          onReorderStart: (index) => onDragStart(),
          onReorder: _drag,
          children: fields
              .asMap()
              .entries
              .map(
                (d) => Padding(
                  key: ValueKey(d.value),
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: ReorderableDragStartListener(index: d.key, child: const Icon(Icons.drag_handle)),
                      ),
                      Expanded(child: Text(d.value.name.titleCase)),
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
    final newFields = List<ImprovisationFields>.from(fields);
    final field = newFields.removeAt(oldIndex);

    if (oldIndex < newIndex) {
      newIndex--;
    }

    newFields.insert(newIndex, field);
    onChanged.call(newFields);
  }
}
