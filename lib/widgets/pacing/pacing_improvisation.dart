import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/pacing_cubit.dart';
import '../../dialogs/delete_dialog.dart';
import '../../helpers/duration_helper.dart';
import '../../l10n/generated/l10n.dart';
import '../../models/improvisation_model.dart';
import '../../models/improvisation_type.dart';
import 'improvisation_durations.dart';

class PacingImprovisation extends StatefulWidget {
  final ImprovisationModel improvisation;
  final int index;

  const PacingImprovisation({super.key, required this.improvisation, required this.index});

  @override
  State<PacingImprovisation> createState() => _PacingImprovisationState();
}

class _PacingImprovisationState extends State<PacingImprovisation> {
  final _categoryController = TextEditingController();
  final _themeController = TextEditingController();
  final _performersController = TextEditingController();
  final _notesController = TextEditingController();

  @override
  void initState() {
    _categoryController.text = widget.improvisation.category;
    _themeController.text = widget.improvisation.theme;
    _performersController.text = widget.improvisation.performers?.toString() ?? "";
    _notesController.text = widget.improvisation.notes?.toString() ?? "";
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
    final title = S.of(context).PacingView_ImprovisationTitle(widget.improvisation.order + 1);
    final subTitle = S.of(context).PacingView_ImprovisationSubtitle(
          widget.improvisation.type == ImprovisationType.mixed ? 'M' : 'C',
          widget.improvisation.category.isNotEmpty ? widget.improvisation.category : '-',
          widget.improvisation.theme.isNotEmpty ? widget.improvisation.theme : '-',
          widget.improvisation.performers ?? '-',
          DurationHelper.getDurationString(widget.improvisation.durations.reduce((total, element) => total + element)),
        );

    return Material(
      child: ExpansionTile(
        leading: ReorderableDragStartListener(
          index: widget.index,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [Icon(Icons.drag_handle)],
          ),
        ),
        title: Text(
          title,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          subTitle,
        ),
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
            child: DropdownButtonFormField<ImprovisationType>(
              decoration: InputDecoration(
                hintText: S.of(context).PacingView_ImprovisationType,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.0),
                ),
              ),
              value: widget.improvisation.type,
              icon: const Icon(Icons.arrow_downward),
              onChanged: (value) {
                context.read<PacingCubit>().editImprovisation(widget.improvisation.copyWith(type: value!));
              },
              items: ImprovisationType.values.map(
                (e) {
                  final display = e == ImprovisationType.mixed ? S.of(context).ImprovisationType_mixed : S.of(context).ImprovisationType_compared;
                  return DropdownMenuItem<ImprovisationType>(
                    value: e,
                    child: Text(display),
                  );
                },
              ).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
            child: TextField(
                controller: _categoryController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  hintText: S.of(context).PacingView_ImprovisationCategory,
                ),
                onChanged: (value) {
                  if (_categoryController.text != widget.improvisation.category) {
                    context.read<PacingCubit>().editImprovisation(widget.improvisation.copyWith(category: _categoryController.text));
                  }
                }),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
            child: TextField(
                controller: _themeController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  hintText: S.of(context).PacingView_ImprovisationTheme,
                ),
                onChanged: (value) {
                  if (_themeController.text != widget.improvisation.theme) {
                    context.read<PacingCubit>().editImprovisation(widget.improvisation.copyWith(theme: _themeController.text));
                  }
                }),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
            child: TextField(
              controller: _performersController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.0),
                ),
                hintText: S.of(context).PacingView_ImprovisationParticipants,
              ),
              onChanged: (value) {
                final performers = _performersController.text.isEmpty ? null : int.parse(_performersController.text);
                if (performers != widget.improvisation.performers) {
                  context.read<PacingCubit>().editImprovisation(widget.improvisation.copyWith(performers: performers));
                }
              },
            ),
          ),
          ImprovisationDurations(
            improvisation: widget.improvisation,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
            child: TextField(
                controller: _notesController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  hintText: S.of(context).PacingView_ImprovisationNotes,
                ),
                onChanged: (value) {
                  if (_notesController.text != widget.improvisation.notes) {
                    context.read<PacingCubit>().editImprovisation(widget.improvisation.copyWith(notes: _notesController.text));
                  }
                }),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.spaceAround,
            buttonHeight: 52.0,
            buttonMinWidth: 90.0,
            children: <Widget>[
              TextButton(
                onPressed: () async {
                  await DeleteDialog.showDeleteDialog(context, title, () async {
                    context.read<PacingCubit>().removeImprovisation(widget.index);
                  });
                },
                child: Column(
                  children: [
                    const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 2.0),
                    ),
                    Text(
                      S.of(context).DeleteDialog_Title,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
