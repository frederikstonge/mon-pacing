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
    final theme = Theme.of(context);
    final colors = ColorScheme.fromSeed(seedColor: seed, brightness: theme.brightness);
    final labelStyle = theme.textTheme.labelMedium;
    final fontSize = labelStyle?.fontSize ?? 12;
    final enlargedText = MediaQuery.textScalerOf(context).scale(fontSize) > fontSize;
    return Chip(
      // Negative vertical density can clip enlarged text.
      visualDensity: enlargedText ? VisualDensity.standard : const VisualDensity(horizontal: -4, vertical: -4),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      padding: EdgeInsets.zero,
      labelPadding: const EdgeInsets.symmetric(horizontal: 6),
      backgroundColor: colors.primaryContainer,
      label: Text(
        '$label: $value',
        style: labelStyle?.copyWith(color: colors.onPrimaryContainer),
      ),
    );
  }
}
