import 'dart:async';

import 'package:material_ui/material_ui.dart';

import '../../../components/buttons/loading_icon_button.dart';
import '../../../components/custom_card/custom_card.dart';
import '../../../components/improvisation_metadata_chip/improvisation_metadata_chip.dart';
import '../../../extensions/duration_extensions.dart';
import '../../../extensions/improvisation_extensions.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../../models/improvisation_fields.dart';
import '../../../models/improvisation_model.dart';
import '../../../models/improvisation_type.dart';

class ImprovisationCard extends StatelessWidget {
  final ImprovisationModel improvisation;
  final List<ImprovisationFields> improvisationFieldsOrder;
  final int index;
  final FutureOr<void> Function(ImprovisationModel improvisation) onEdit;
  final FutureOr<void> Function(ImprovisationModel improvisation)? onDelete;

  const ImprovisationCard({
    super.key,
    required this.improvisation,
    required this.improvisationFieldsOrder,
    required this.index,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final localizer = S.of(context);
    final theme = Theme.of(context);
    final fields = <Widget>[];
    var chips = <Widget>[];

    void flushChips() {
      if (chips.isNotEmpty) {
        fields.add(Wrap(spacing: 6, runSpacing: 4, children: chips));
        chips = [];
      }
    }

    for (final field in improvisationFieldsOrder) {
      switch (field) {
        case ImprovisationFields.type:
          chips.add(
            ImprovisationMetadataChip(
              field: field,
              label: localizer.type,
              value: improvisation.type == ImprovisationType.mixed ? localizer.mixed : localizer.compared,
            ),
          );
        case ImprovisationFields.category:
          chips.add(
            ImprovisationMetadataChip(
              field: field,
              label: localizer.category,
              value: improvisation.getCategoryString(localizer),
            ),
          );
        case ImprovisationFields.performers:
          chips.add(
            ImprovisationMetadataChip(
              field: field,
              label: localizer.performers,
              value: improvisation.getPerformersString(localizer),
            ),
          );
        case ImprovisationFields.durations:
          chips.add(
            ImprovisationMetadataChip(
              field: field,
              label: localizer.duration,
              value: improvisation.durationsInSeconds.map((e) => Duration(seconds: e).toImprovDuration()).join(', '),
            ),
          );
        case ImprovisationFields.theme:
          flushChips();
          fields.add(Text('${localizer.theme}: ${improvisation.theme}', style: theme.textTheme.titleMedium));
        case ImprovisationFields.notes:
          flushChips();
          fields.add(Text('${localizer.notes}: ${improvisation.notes}', style: theme.textTheme.bodyMedium));
      }
    }
    flushChips();

    return CustomCard(
      contentPadding: 12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(localizer.improvisationNumber(order: index + 1), style: theme.textTheme.titleMedium),
              ),
              LoadingIconButton(
                tooltip: localizer.edit,
                icon: const Icon(Icons.edit),
                onPressed: () async => await onEdit(improvisation),
              ),
              LoadingIconButton(
                tooltip: localizer.delete,
                icon: const Icon(Icons.delete),
                onPressed: onDelete == null ? null : () async => await onDelete!(improvisation),
              ),
            ],
          ),
          ...fields.map((field) => Padding(padding: const EdgeInsets.only(bottom: 2), child: field)),
        ],
      ),
    );
  }
}
