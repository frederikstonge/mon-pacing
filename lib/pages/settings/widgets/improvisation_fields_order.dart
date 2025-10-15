import 'dart:async';

import 'package:flutter/material.dart';

import '../../../l10n/generated/app_localizations.dart';
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
                      Expanded(child: Text(_fieldName(context, d.value))),
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

  String _fieldName(BuildContext context, ImprovisationFields field) {
    switch (field) {
      case ImprovisationFields.type:
        return S.of(context).type;
      case ImprovisationFields.performers:
        return S.of(context).performers;
      case ImprovisationFields.durations:
        return S.of(context).duration;
      case ImprovisationFields.category:
        return S.of(context).category;
      case ImprovisationFields.theme:
        return S.of(context).theme;
      case ImprovisationFields.notes:
        return S.of(context).notes;
    }
  }
}
