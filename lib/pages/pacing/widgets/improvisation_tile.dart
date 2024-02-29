import 'dart:async';

import 'package:flutter/material.dart';

import '../../../components/custom_card/custom_card.dart';
import '../../../components/form/drop_down_element.dart';
import '../../../components/form/number_field_element.dart';
import '../../../components/form/text_field_element.dart';
import '../../../extensions/improvisation_extensions.dart';
import '../../../l10n/app_localizations.dart';
import '../../../models/improvisation_model.dart';
import '../../../models/improvisation_type.dart';
import 'improvisation_durations.dart';

class ImprovisationTile extends StatefulWidget {
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
    _performersController = TextEditingController(text: widget.improvisation.performers?.toString() ?? '');
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
      child: CustomCard(
        contentPadding: 0,
        child: ExpansionTile(
          leading: ReorderableDragStartListener(index: widget.index, child: const Icon(Icons.drag_handle)),
          title: Text(
            widget.improvisation.getImprovisationString(),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          subtitle: widget.improvisation.theme.isNotEmpty
              ? Text(
                  widget.improvisation.theme,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyLarge,
                )
              : null,
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
                    onChanged: (value) {
                      widget.onChanged(widget.improvisation.copyWith(type: value));
                    },
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
                    onChanged: (value) => widget.onChanged.call(widget.improvisation.copyWith(category: value)),
                  ),
                  const SizedBox(height: 8),
                  NumberFieldElement(
                    label: S.of(context).performers,
                    controller: _performersController,
                    onChanged: (value) => widget.onChanged.call(widget.improvisation.copyWith(performers: value)),
                  ),
                  const SizedBox(height: 8),
                  ImprovisationDurations(
                    label: S.of(context).duration,
                    durations: widget.improvisation.durationsInSeconds,
                    onChanged: (value) => widget.onChanged.call(widget.improvisation.copyWith(durationsInSeconds: value)),
                  ),
                  const SizedBox(height: 8),
                  TextFieldElement(
                    label: S.of(context).theme,
                    controller: _themeController,
                    onChanged: (value) => widget.onChanged.call(widget.improvisation.copyWith(theme: value)),
                  ),
                  TextFieldElement(
                    label: S.of(context).notes,
                    controller: _notesController,
                    maxLines: 10,
                    onChanged: (value) => widget.onChanged.call(widget.improvisation.copyWith(notes: value)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
