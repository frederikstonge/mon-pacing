import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/actions/haptic_switch.dart';
import '../../components/actions/loading_button.dart';
import '../../components/bottom_sheet_dialog/bottom_sheet_appbar.dart';
import '../../components/bottom_sheet_dialog/bottom_sheet_dialog.dart';
import '../../components/bottom_sheet_dialog/bottom_sheet_scaffold.dart';
import '../../components/custom_card/custom_card.dart';
import '../../components/duration_picker/duration_picker.dart';
import '../../components/form/text_field_element.dart';
import '../../components/quantity_stepper/quantity_stepper_form_field.dart';
import '../../components/settings_tile/settings_tile.dart';
import '../../components/text_header/text_header.dart';
import '../../extensions/duration_extensions.dart';
import '../../l10n/app_localizations.dart';
import '../../models/constants.dart';
import '../../validators/validator.dart';
import 'cubits/pacing_detail_cubit.dart';
import 'cubits/pacing_detail_state.dart';

class PacingDetailPageView extends StatefulWidget {
  const PacingDetailPageView({super.key});

  @override
  State<PacingDetailPageView> createState() => _PacingDetailPageViewState();
}

class _PacingDetailPageViewState extends State<PacingDetailPageView> {
  late final TextEditingController _nameController;
  late final GlobalKey<FormState> formKey;

  @override
  void initState() {
    _nameController = TextEditingController(text: context.read<PacingDetailCubit>().state.pacing.name);
    formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PacingDetailCubit, PacingDetailState>(
      builder: (context, state) => BottomSheetScaffold(
        appBar: BottomSheetAppbar(
          title: state.editMode ? S.of(context).editPacing : S.of(context).createPacing,
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
                        context.read<PacingDetailCubit>().edit(state.pacing.copyWith(name: value));
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
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          QuantityStepperFormField(
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            initialValue: state.pacing.defaultNumberOfTeams,
                            onChanged: (value) {
                              if (value != null) {
                                context.read<PacingDetailCubit>().edit(state.pacing.copyWith(defaultNumberOfTeams: value));
                              }
                            },
                            minValue: Constants.minumumTeams,
                            maxValue: Constants.maximumTeams,
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
                      trailing: HapticSwitch(
                          value: state.pacing.enableTimeBuffer,
                          onChanged: (value) {
                            context.read<PacingDetailCubit>().edit(state.pacing.copyWith(enableTimeBuffer: value));
                          }),
                    ),
                    SettingsTile(
                      leading: const Icon(Icons.timer_outlined),
                      title: Text(S.of(context).timeBuffer),
                      subTitle: Text(Duration(seconds: state.pacing.timeBufferInSeconds).toImprovDuration()),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: state.pacing.enableTimeBuffer
                          ? () async {
                              final pacingDetailCubit = context.read<PacingDetailCubit>();
                              final newDuration = await BottomSheetDialog.showDialog<Duration>(
                                context: context,
                                child: DurationPicker(
                                  title: S.of(context).timeBuffer,
                                  initialDuration: Duration(seconds: state.pacing.timeBufferInSeconds),
                                ),
                              );

                              if (newDuration != null) {
                                pacingDetailCubit.edit(state.pacing.copyWith(timeBufferInSeconds: newDuration.inSeconds));
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
                child: LoadingButton.filled(
                  onPressed: () async {
                    if (formKey.currentState?.validate() ?? false) {
                      final navigator = Navigator.of(context);
                      await context.read<PacingDetailCubit>().onConfirm(state.pacing);
                      navigator.pop();
                    }
                  },
                  child: Text(
                    state.editMode ? S.of(context).save : S.of(context).create,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
