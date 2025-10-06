import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haptic_feedback/haptic_feedback.dart';

import '../../components/bottom_sheet/bottom_sheet_appbar.dart';
import '../../components/bottom_sheet/bottom_sheet_scaffold.dart';
import '../../components/buttons/loading_button.dart';
import '../../components/custom_card/custom_card.dart';
import '../../components/improvisation_detail/improvisation_detail.dart';
import '../../components/quantity_stepper/quantity_stepper_form_field.dart';
import '../../cubits/settings/settings_cubit.dart';
import '../../cubits/settings/settings_state.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../models/improvisation_model.dart';
import '../../models/improvisation_type.dart';
import '../../repositories/pacings_repository.dart';
import 'cubits/match_improvisation_cubit.dart';
import 'cubits/match_improvisation_state.dart';

class MatchImprovisationView extends StatefulWidget {
  final FutureOr<void> Function(ImprovisationModel improvisation, int index, BuildContext context) onConfirm;

  const MatchImprovisationView({super.key, required this.onConfirm});

  @override
  State<MatchImprovisationView> createState() => _MatchImprovisationViewState();
}

class _MatchImprovisationViewState extends State<MatchImprovisationView> {
  late final GlobalKey<FormState> formKey;

  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, settingsState) {
        return BlocBuilder<MatchImprovisationCubit, MatchImprovisationState>(
          builder: (context, matchImprovisationState) {
            return BottomSheetScaffold(
              appBar: BottomSheetAppbar(
                title: matchImprovisationState.editMode
                    ? S.of(context).editImprovisation
                    : S.of(context).addImprovisation,
              ),
              body: Form(
                key: formKey,
                autovalidateMode: AutovalidateMode.always,
                child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    CustomCard(
                      showIndicator: true,
                      indicatorColor: matchImprovisationState.improvisation.type == ImprovisationType.compared
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.secondary,
                      contentPadding: 16,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    S.of(context).improvisationIndex,
                                    style: Theme.of(context).textTheme.bodyLarge,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                QuantityStepperFormField(
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  initialValue: matchImprovisationState.index + 1,
                                  onChanged: (value) {
                                    if (value != null) {
                                      context.read<MatchImprovisationCubit>().changeIndex(value - 1);
                                    }
                                  },
                                  minValue: 1,
                                  maxValue:
                                      context.read<MatchImprovisationCubit>().match.improvisations.length +
                                      (matchImprovisationState.editMode ? 0 : 1),
                                ),
                              ],
                            ),
                          ),
                          ImprovisationDetail(
                            improvisation: matchImprovisationState.improvisation,
                            improvisationFieldsOrder: settingsState.improvisationFieldsOrder,
                            onChanged: (value) {
                              context.read<MatchImprovisationCubit>().edit(value);
                            },
                            getAllCategories: ({String? search}) async {
                              return await context.read<PacingsRepository>().getAllCategories(search: search ?? '');
                            },
                            onDragStart: () async => await context.read<SettingsCubit>().vibrate(HapticsType.selection),
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
                            await widget.onConfirm(
                              matchImprovisationState.improvisation,
                              matchImprovisationState.index,
                              context,
                            );
                          }
                        },
                        child: Text(
                          matchImprovisationState.editMode ? S.of(context).save : S.of(context).create,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
