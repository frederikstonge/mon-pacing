import 'dart:async';

import 'package:flutter/material.dart';

import '../../../components/buttons/loading_icon_button.dart';
import '../../../components/custom_card/custom_card.dart';
import '../../../extensions/duration_extensions.dart';
import '../../../extensions/improvisation_extensions.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../../models/improvisation_model.dart';
import '../../../models/improvisation_type.dart';

class ImprovisationCard extends StatelessWidget {
  static const double _cellPadding = 2.0;
  final ImprovisationModel improvisation;
  final int index;
  final FutureOr<void> Function(ImprovisationModel improvisation) onEdit;
  final FutureOr<void> Function(ImprovisationModel improvisation)? onDelete;

  const ImprovisationCard({
    super.key,
    required this.improvisation,
    required this.index,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      showIndicator: true,
      indicatorColor:
          improvisation.type == ImprovisationType.compared ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.secondary,
      contentPadding: 16,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  S.of(context).improvisationNumber(order: index + 1),
                  style: Theme.of(context).textTheme.headlineSmall,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              LoadingIconButton(
                tooltip: S.of(context).edit,
                icon: const Icon(Icons.edit),
                onPressed: () async {
                  await onEdit.call(improvisation);
                },
              ),
              LoadingIconButton(
                tooltip: S.of(context).delete,
                icon: const Icon(Icons.delete),
                onPressed: onDelete != null
                    ? () async {
                        await onDelete!.call(improvisation);
                      }
                    : null,
              ),
            ],
          ),
          Table(
            columnWidths: const <int, TableColumnWidth>{
              0: IntrinsicColumnWidth(),
              1: FlexColumnWidth(),
            },
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(ImprovisationCard._cellPadding),
                    child: Text(
                      '${S.of(context).type}: ',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(ImprovisationCard._cellPadding),
                    child: Text(
                      improvisation.type == ImprovisationType.mixed ? S.of(context).mixed : S.of(context).compared,
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(ImprovisationCard._cellPadding),
                    child: Text(
                      '${S.of(context).category}: ',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(ImprovisationCard._cellPadding),
                    child: Text(
                      improvisation.getCategoryString(S.of(context)),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(ImprovisationCard._cellPadding),
                    child: Text(
                      '${S.of(context).performers}: ',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(ImprovisationCard._cellPadding),
                    child: Text(
                      improvisation.getPerformersString(S.of(context)),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(ImprovisationCard._cellPadding),
                    child: Text(
                      '${S.of(context).duration}: ',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(ImprovisationCard._cellPadding),
                    child: Text(
                      improvisation.durationsInSeconds.map((e) => Duration(seconds: e).toImprovDuration()).join(', '),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(ImprovisationCard._cellPadding),
                    child: Text(
                      '${S.of(context).theme}: ',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(ImprovisationCard._cellPadding),
                    child: Text(
                      improvisation.theme,
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(ImprovisationCard._cellPadding),
                    child: Text(
                      '${S.of(context).notes}: ',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(ImprovisationCard._cellPadding),
                    child: Text(
                      improvisation.notes,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
