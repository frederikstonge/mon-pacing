import 'dart:async';

import 'package:flutter/material.dart';

import '../../../components/actions/loading_icon_button.dart';
import '../../../components/custom_card/custom_card.dart';
import '../../../components/improvisation_detail/improvisation_detail.dart';
import '../../../extensions/duration_extensions.dart';
import '../../../l10n/app_localizations.dart';
import '../../../models/improvisation_model.dart';
import '../../../models/improvisation_type.dart';

class ImprovisationCard extends StatefulWidget {
  static const double _cellPadding = 2.0;
  final ImprovisationModel improvisation;
  final int index;
  final FutureOr<void> Function(ImprovisationModel improvisation) onSave;
  final FutureOr<void> Function(ImprovisationModel improvisation) onDelete;

  const ImprovisationCard({
    super.key,
    required this.improvisation,
    required this.index,
    required this.onSave,
    required this.onDelete,
  });

  @override
  State<ImprovisationCard> createState() => _ImprovisationCardState();
}

class _ImprovisationCardState extends State<ImprovisationCard> {
  late ImprovisationModel editImprovisation;
  late GlobalKey<FormState> formKey;
  bool editMode = false;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  S.of(context).improvisationNumber(widget.index + 1),
                  style: Theme.of(context).textTheme.headlineSmall,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (editMode) ...[
                LoadingIconButton(
                  icon: const Icon(Icons.save),
                  tooltip: S.of(context).save,
                  onPressed: () async {
                    if (formKey.currentState?.validate() ?? false) {
                      await widget.onSave.call(editImprovisation);
                      setState(() {
                        editMode = false;
                      });
                    }
                  },
                ),
                LoadingIconButton(
                  tooltip: S.of(context).cancel,
                  icon: const Icon(Icons.cancel),
                  onPressed: () {
                    setState(() {
                      editMode = false;
                    });
                  },
                ),
              ] else ...[
                LoadingIconButton(
                  tooltip: S.of(context).edit,
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    setState(() {
                      formKey = GlobalKey<FormState>();
                      editImprovisation = widget.improvisation;
                      editMode = true;
                    });
                  },
                ),
                LoadingIconButton(
                  tooltip: S.of(context).delete,
                  icon: const Icon(Icons.delete),
                  onPressed: () async {
                    await widget.onDelete.call(widget.improvisation);
                  },
                ),
              ]
            ],
          ),
          if (editMode) ...[
            Form(
              key: formKey,
              child: ImprovisationDetail(
                improvisation: editImprovisation,
                onChanged: (value) => setState(() => editImprovisation = value),
              ),
            ),
          ] else ...[
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
                        widget.improvisation.type == ImprovisationType.mixed ? S.of(context).mixed : S.of(context).compared,
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
                        widget.improvisation.category,
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
                        widget.improvisation.performers,
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
                        widget.improvisation.durationsInSeconds.map((e) => Duration(seconds: e).toImprovDuration()).join(', '),
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
                        widget.improvisation.theme,
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
                        widget.improvisation.notes,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
