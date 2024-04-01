import 'package:flutter/material.dart';

import '../../../components/custom_card/custom_card.dart';
import '../../../extensions/duration_extensions.dart';
import '../../../l10n/app_localizations.dart';
import '../../../models/improvisation_model.dart';
import '../../../models/improvisation_type.dart';

class Improvisation extends StatelessWidget {
  static const double _cellPadding = 2.0;
  final ImprovisationModel improvisation;

  const Improvisation({
    super.key,
    required this.improvisation,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomCard(
          child: Table(
            columnWidths: const <int, TableColumnWidth>{
              0: IntrinsicColumnWidth(),
              1: FlexColumnWidth(),
            },
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(_cellPadding),
                    child: Text(
                      '${S.of(context).type}: ',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(_cellPadding),
                    child: Text(
                      improvisation.type == ImprovisationType.mixed ? S.of(context).mixed : S.of(context).compared,
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(_cellPadding),
                    child: Text(
                      '${S.of(context).category}: ',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(_cellPadding),
                    child: Text(
                      improvisation.category,
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(_cellPadding),
                    child: Text(
                      '${S.of(context).performers}: ',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(_cellPadding),
                    child: Text(
                      improvisation.performers,
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(_cellPadding),
                    child: Text(
                      '${S.of(context).duration}: ',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(_cellPadding),
                    child: Text(
                      improvisation.durationsInSeconds.map((e) => Duration(seconds: e).toImprovDuration()).join(', '),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(_cellPadding),
                    child: Text(
                      '${S.of(context).theme}: ',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(_cellPadding),
                    child: Text(
                      improvisation.theme,
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(_cellPadding),
                    child: Text(
                      '${S.of(context).notes}: ',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(_cellPadding),
                    child: Text(
                      improvisation.notes,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
