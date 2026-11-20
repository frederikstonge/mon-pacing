import 'package:material_ui/material_ui.dart';

import '../../models/improvisation_fields.dart';

class ImprovisationMetadataChip extends StatelessWidget {
  final ImprovisationFields field;
  final String label;
  final String value;

  const ImprovisationMetadataChip({super.key, required this.field, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final seed = switch (field) {
      ImprovisationFields.type => Colors.deepPurple,
      ImprovisationFields.category => Colors.teal,
      ImprovisationFields.performers => Colors.indigo,
      ImprovisationFields.durations => Colors.orange,
      ImprovisationFields.theme => Colors.blue,
      ImprovisationFields.notes => Colors.brown,
    };
    final colors = ColorScheme.fromSeed(seedColor: seed, brightness: Theme.of(context).brightness);
    return Chip(
      visualDensity: VisualDensity.compact,
      padding: EdgeInsets.zero,
      backgroundColor: colors.primaryContainer,
      label: Text('$label: $value', style: TextStyle(color: colors.onPrimaryContainer)),
    );
  }
}
