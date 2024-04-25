import 'dart:async';

import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import '../../models/improvisation_model.dart';
import '../../models/improvisation_type.dart';
import '../../pages/pacing/widgets/improvisation_durations.dart';
import '../form/drop_down_element.dart';
import '../form/text_field_element.dart';

class ImprovisationDetail extends StatefulWidget {
  final ImprovisationModel improvisation;
  final FutureOr<void> Function(ImprovisationModel value) onChanged;

  const ImprovisationDetail({
    super.key,
    required this.improvisation,
    required this.onChanged,
  });

  @override
  State<ImprovisationDetail> createState() => _ImprovisationDetailState();
}

class _ImprovisationDetailState extends State<ImprovisationDetail> {
  late final TextEditingController _categoryController;
  late final TextEditingController _themeController;
  late final TextEditingController _performersController;
  late final TextEditingController _notesController;

  @override
  void initState() {
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
    return Column(
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
          hintText: S.of(context).free,
        ),
        const SizedBox(height: 8),
        TextFieldElement(
          label: S.of(context).performers,
          controller: _performersController,
          onChanged: (value) async => await widget.onChanged.call(widget.improvisation.copyWith(performers: value)),
          hintText: S.of(context).unlimited,
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
      ],
    );
  }
}
