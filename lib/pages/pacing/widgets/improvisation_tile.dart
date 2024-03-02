import 'dart:async';

import 'package:flutter/material.dart';

import '../../../components/custom_card/custom_card.dart';
import '../../../components/form/drop_down_element.dart';
import '../../../components/form/text_field_element.dart';
import '../../../extensions/duration_extensions.dart';
import '../../../l10n/app_localizations.dart';
import '../../../models/improvisation_model.dart';
import '../../../models/improvisation_type.dart';
import 'improvisation_durations.dart';

class ImprovisationTile extends StatefulWidget {
  final ImprovisationModel improvisation;
  final int index;
  final FutureOr<void> Function(ImprovisationModel value) onChanged;
  final FutureOr<void> Function(ImprovisationModel value) onDelete;
  final FutureOr<bool?> Function(ImprovisationModel value) onConfirmDelete;

  const ImprovisationTile({
    super.key,
    required this.improvisation,
    required this.index,
    required this.onChanged,
    required this.onDelete,
    required this.onConfirmDelete,
  });

  @override
  State<ImprovisationTile> createState() => _ImprovisationTileState();
}

class _ImprovisationTileState extends State<ImprovisationTile> {
  late final TextEditingController _categoryController;
  late final TextEditingController _themeController;
  late final TextEditingController _performersController;
  late final TextEditingController _notesController;
  late final GlobalKey<FormState> formKey;

  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    _categoryController = TextEditingController(text: widget.improvisation.category);
    _themeController = TextEditingController(text: widget.improvisation.theme);
    _performersController = TextEditingController(text: widget.improvisation.performers);
    _notesController = TextEditingController(text: widget.improvisation.notes);
    super.initState();
  }

  @override
  void dispose() {
    _categoryController.dispose();
    _themeController.dispose();
    _performersController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Dismissible(
        key: ValueKey(widget.improvisation.id),
        direction: DismissDirection.endToStart,
        background: Container(
          color: Colors.red,
          alignment: Alignment.centerRight,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
        ),
        confirmDismiss: (direction) async => await widget.onConfirmDelete.call(widget.improvisation),
        onDismissed: (direction) async => await widget.onDelete.call(widget.improvisation),
        child: CustomCard(
          contentPadding: 0,
          child: ExpansionTile(
            leading: ReorderableDragStartListener(index: widget.index, child: const Icon(Icons.drag_handle)),
            title: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).improvisationNumber(widget.index + 1),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '${S.of(context).type}: ${widget.improvisation.type == ImprovisationType.mixed ? S.of(context).mixed : S.of(context).compared}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                if (widget.improvisation.category.isNotEmpty) ...[
                  Text(
                    '${S.of(context).category}: ${widget.improvisation.category}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
                if (widget.improvisation.performers.isNotEmpty) ...[
                  Text(
                    '${S.of(context).performers}: ${widget.improvisation.performers}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
                Text(
                  '${S.of(context).duration}: ${Duration(seconds: widget.improvisation.durationsInSeconds.reduce((value, element) => value + element)).toImprovDuration()}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                if (widget.improvisation.theme.isNotEmpty) ...[
                  Text(
                    '${S.of(context).theme}: ${widget.improvisation.theme}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ],
            ),
            childrenPadding: const EdgeInsets.all(16),
            children: [
              Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DropDownElement<ImprovisationType>(
                      label: S.of(context).type,
                      value: widget.improvisation.type,
                      onChanged: (value) async => await widget.onChanged(widget.improvisation.copyWith(type: value)),
                      items: ImprovisationType.values.map(
                        (e) {
                          final display = e == ImprovisationType.mixed ? S.of(context).mixed : S.of(context).compared;
                          return DropdownMenuItem<ImprovisationType>(
                            value: e,
                            child: Text(display),
                          );
                        },
                      ).toList(),
                    ),
                    const SizedBox(height: 8),
                    TextFieldElement(
                      label: S.of(context).category,
                      controller: _categoryController,
                      onChanged: (value) async => await widget.onChanged.call(widget.improvisation.copyWith(category: value)),
                    ),
                    const SizedBox(height: 8),
                    TextFieldElement(
                      label: S.of(context).performers,
                      controller: _performersController,
                      onChanged: (value) async => await widget.onChanged.call(widget.improvisation.copyWith(performers: value)),
                    ),
                    const SizedBox(height: 8),
                    ImprovisationDurations(
                      label: S.of(context).duration,
                      durations: widget.improvisation.durationsInSeconds,
                      onChanged: (value) async => await widget.onChanged.call(widget.improvisation.copyWith(durationsInSeconds: value)),
                    ),
                    const SizedBox(height: 8),
                    TextFieldElement(
                      label: S.of(context).theme,
                      controller: _themeController,
                      onChanged: (value) async => await widget.onChanged.call(widget.improvisation.copyWith(theme: value)),
                    ),
                    const SizedBox(height: 8),
                    TextFieldElement(
                      label: S.of(context).notes,
                      controller: _notesController,
                      multiline: true,
                      onChanged: (value) async => await widget.onChanged.call(widget.improvisation.copyWith(notes: value)),
                    ),
                    const SizedBox(height: 8),
                    FilledButton.tonalIcon(
                      onPressed: () async {
                        final response = await widget.onConfirmDelete(widget.improvisation);
                        if (response == true) {
                          await widget.onDelete.call(widget.improvisation);
                        }
                      },
                      icon: const Icon(Icons.delete),
                      label: Text(S.of(context).delete),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
