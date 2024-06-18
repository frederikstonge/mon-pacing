import 'dart:async';

import 'package:flutter/material.dart';

import '../../extensions/duration_extensions.dart';
import '../../l10n/app_localizations.dart';
import '../../models/improvisation_model.dart';
import '../../models/improvisation_type.dart';
import '../actions/loading_icon_button.dart';
import '../bottom_sheet_dialog/bottom_sheet_dialog.dart';
import '../duration_picker/duration_picker.dart';
import '../form/drop_down_element.dart';
import '../form/text_field_element.dart';
import '../settings_tile/settings_tile.dart';
import '../tooltip/custom_tooltip.dart';
import 'improvisation_durations.dart';

class ImprovisationDetail extends StatefulWidget {
  final ImprovisationModel improvisation;
  final FutureOr<void> Function(ImprovisationModel value) onChanged;
  final FutureOr<void> Function() onDragStart;
  final Future<List<String>> Function() getAllCategories;

  const ImprovisationDetail({
    super.key,
    required this.improvisation,
    required this.onChanged,
    required this.onDragStart,
    required this.getAllCategories,
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
                child: Row(
                  children: [
                    Expanded(child: Text(display)),
                  ],
                ),
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
          suffixIcon: SearchAnchor(
            builder: (context, controller) => LoadingIconButton(
              icon: const Icon(Icons.search),
              onPressed: () => controller.openView(),
            ),
            suggestionsBuilder: (context, controller) async {
              final allCategories = await widget.getAllCategories();
              return allCategories.where((t) => t.contains(controller.text)).map(
                    (e) => ListTile(
                      leading: const Icon(Icons.search),
                      title: Text(e, maxLines: 1, overflow: TextOverflow.ellipsis),
                      onTap: () {
                        _categoryController.text = e;
                        controller.closeView(null);
                      },
                    ),
                  );
            },
          ),
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
          onDragStart: widget.onDragStart,
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
        SettingsTile(
          leading: const Icon(Icons.timer),
          title: Row(
            children: [
              Flexible(child: Text(S.of(context).huddleTimer)),
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: CustomTooltip(
                  tooltip: S.of(context).huddleTimerTooltip,
                ),
              )
            ],
          ),
          subTitle: Text(Duration(seconds: widget.improvisation.huddleTimerInSeconds).toImprovDuration()),
          trailing: const Icon(Icons.chevron_right),
          onTap: () async {
            final newDuration = await BottomSheetDialog.showDialog<Duration>(
              context: context,
              child: DurationPicker(
                title: S.of(context).huddleTimer,
                initialDuration: Duration(seconds: widget.improvisation.huddleTimerInSeconds),
              ),
            );

            if (newDuration != null) {
              await widget.onChanged.call(widget.improvisation.copyWith(huddleTimerInSeconds: newDuration.inSeconds));
            }
          },
        ),
        SettingsTile(
          leading: const Icon(Icons.more_time),
          title: Row(
            children: [
              Flexible(child: Text(S.of(context).timeBuffer)),
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: CustomTooltip(
                  tooltip: S.of(context).timeBufferTooltip,
                ),
              )
            ],
          ),
          subTitle: Text(Duration(seconds: widget.improvisation.timeBufferInSeconds).toImprovDuration()),
          trailing: const Icon(Icons.chevron_right),
          onTap: () async {
            final newDuration = await BottomSheetDialog.showDialog<Duration>(
              context: context,
              child: DurationPicker(
                title: S.of(context).timeBuffer,
                initialDuration: Duration(seconds: widget.improvisation.timeBufferInSeconds),
              ),
            );

            if (newDuration != null) {
              await widget.onChanged.call(widget.improvisation.copyWith(timeBufferInSeconds: newDuration.inSeconds));
            }
          },
        ),
      ],
    );
  }
}
