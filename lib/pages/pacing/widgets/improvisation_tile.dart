import 'dart:async';

import 'package:flutter/material.dart';

import '../../../components/custom_card/custom_card.dart';
import '../../../models/improvisation_model.dart';

class ImprovisationTile extends StatelessWidget {
  final ImprovisationModel improvisation;
  final int index;
  final FutureOr<void> Function(ImprovisationModel value) onChanged;

  const ImprovisationTile({
    super.key,
    required this.improvisation,
    required this.index,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomCard(
        contentPadding: 0,
        child: ExpansionTile(
          leading: ReorderableDragStartListener(index: index, child: const Icon(Icons.drag_handle)),
          title: Text(improvisation.id.toString()),
          subtitle: const Text('blabla'),
        ),
      ),
    );
  }
}
