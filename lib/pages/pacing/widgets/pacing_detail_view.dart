import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../components/bottom_sheet_dialog/bottom_sheet_appbar.dart';
import '../../../components/bottom_sheet_dialog/bottom_sheet_dialog.dart';
import '../../../components/bottom_sheet_dialog/bottom_sheet_scaffold.dart';
import '../../../components/custom_card/custom_card.dart';
import '../../../components/duration_picker/duration_picker.dart';
import '../../../components/form/text_field_element.dart';
import '../../../components/quantity_stepper/quantity_stepper_form_field.dart';
import '../../../components/settings_tile/settings_tile.dart';
import '../../../components/text_header/text_header.dart';
import '../../../cubits/settings/settings_cubit.dart';
import '../../../extensions/duration_extensions.dart';
import '../../../l10n/app_localizations.dart';
import '../../../models/pacing_model.dart';
import '../../../validators/validator.dart';

class PacingDetailView extends StatefulWidget {
  final PacingModel? pacing;
  final FutureOr<void> Function(PacingModel value) onConfirm;

  const PacingDetailView({
    super.key,
    required this.onConfirm,
    this.pacing,
  });

  @override
  State<PacingDetailView> createState() => _PacingDetailViewState();
}

class _PacingDetailViewState extends State<PacingDetailView> {
  late final TextEditingController _nameController;
  late final bool editMode;
  late PacingModel pacing;
  late final GlobalKey<FormState> formKey;

  @override
  void initState() {
    editMode = widget.pacing != null;
    pacing = editMode
        ? widget.pacing!.copyWith()
        : PacingModel(
            id: 0,
            name: '',
            enableTimeBuffer: context.read<SettingsCubit>().state.enableDefaultTimeBuffer,
            timeBufferInSeconds: context.read<SettingsCubit>().state.defaultTimeBufferInSeconds,
            createdDate: null,
            modifiedDate: null,
            defaultNumberOfTeams: 2,
            improvisations: [],
          );

    _nameController = TextEditingController(text: pacing.name);
    formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheetScaffold(
      appBar: BottomSheetAppbar(
        title: Text(editMode ? S.of(context).editPacing : S.of(context).createPacing),
      ),
      isBodyExpanded: true,
      body: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.always,
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
              child: TextHeader(title: S.of(context).general),
            ),
            CustomCard(
              child: Column(
                children: [
                  TextFieldElement(
                    autoFocus: true,
                    label: '${S.of(context).name}*',
                    controller: _nameController,
                    validator: (value) {
                      return Validators.stringRequired(value);
                    },
                    onChanged: (value) {
                      setState(() {
                        pacing = pacing.copyWith(name: value);
                      });
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            S.of(context).numberOfTeamsByDefault,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                        QuantityStepperFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          initialValue: pacing.defaultNumberOfTeams,
                          onChanged: (value) {
                            if (value != null) {
                              setState(() {
                                pacing = pacing.copyWith(defaultNumberOfTeams: value);
                              });
                            }
                          },
                          minValue: 1,
                          maxValue: 3,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
              child: TextHeader(
                title: S.of(context).timeBuffer,
                tooltip: S.of(context).timeBufferTooltip,
              ),
            ),
            CustomCard(
              child: Column(
                children: [
                  SettingsTile(
                    leading: const Icon(Icons.timer),
                    title: Text(S.of(context).enableTimeBuffer),
                    trailing: Switch(
                        value: pacing.enableTimeBuffer,
                        onChanged: (value) {
                          setState(() {
                            pacing = pacing.copyWith(enableTimeBuffer: value);
                          });
                        }),
                  ),
                  SettingsTile(
                    leading: const Icon(Icons.timer_outlined),
                    title: Text(S.of(context).timeBuffer),
                    subTitle: Text(Duration(seconds: pacing.timeBufferInSeconds).toImprovDuration()),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: pacing.enableTimeBuffer
                        ? () async {
                            final newDuration = await BottomSheetDialog.showDialog(
                              context: context,
                              child: DurationPicker(
                                title: S.of(context).timeBuffer,
                                initialDuration: Duration(seconds: pacing.timeBufferInSeconds),
                              ),
                            );

                            if (newDuration != null) {
                              setState(() {
                                pacing = pacing.copyWith(timeBufferInSeconds: newDuration.inSeconds);
                              });
                            }
                          }
                        : null,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottom: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: FilledButton(
                onPressed: () async {
                  if (formKey.currentState?.validate() ?? false) {
                    final navigator = Navigator.of(context);
                    await widget.onConfirm(pacing);
                    navigator.pop();
                  }
                },
                child: Text(editMode ? S.of(context).save : S.of(context).create),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
