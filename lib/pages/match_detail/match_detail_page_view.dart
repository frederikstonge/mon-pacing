import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/actions/loading_button.dart';
import '../../components/actions/loading_icon_button.dart';
import '../../components/actions/loading_switch.dart';
import '../../components/bottom_sheet_dialog/bottom_sheet_appbar.dart';
import '../../components/bottom_sheet_dialog/bottom_sheet_dialog.dart';
import '../../components/bottom_sheet_dialog/bottom_sheet_scaffold.dart';
import '../../components/custom_card/custom_card.dart';
import '../../components/form/text_field_element.dart';
import '../../components/penalties_impact_type/penalties_impact_type_view.dart';
import '../../components/quantity_stepper/quantity_stepper_form_field.dart';
import '../../components/settings_tile/settings_tile.dart';
import '../../components/text_header/text_header.dart';
import '../../components/tooltip/custom_tooltip.dart';
import '../../l10n/app_localizations.dart';
import '../../models/constants.dart';
import '../../models/penalties_impact_type.dart';
import '../../validators/validator.dart';
import 'cubits/match_detail_cubit.dart';
import 'cubits/match_detail_state.dart';
import 'widgets/team_tile.dart';

class MatchDetailPageView extends StatefulWidget {
  const MatchDetailPageView({
    super.key,
  });

  @override
  State<MatchDetailPageView> createState() => _MatchDetailPageViewState();
}

class _MatchDetailPageViewState extends State<MatchDetailPageView> {
  late final TextEditingController _nameController;
  late final GlobalKey<FormState> formKey;

  @override
  void initState() {
    _nameController = TextEditingController(text: context.read<MatchDetailCubit>().state.match.name);
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
    return BlocBuilder<MatchDetailCubit, MatchDetailState>(
      builder: (context, state) {
        return BottomSheetScaffold(
          appBar: BottomSheetAppbar(
            title: state.editMode ? S.of(context).editMatch : S.of(context).startMatch,
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
                          context.read<MatchDetailCubit>().edit(state.match.copyWith(name: value));
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
                  child: TextHeader(
                    title: S.of(context).teams,
                    trailing: LoadingIconButton(
                      icon: const Icon(Icons.add),
                      onPressed: !state.editMode && state.match.teams.length < Constants.maximumTeams
                          ? () {
                              context.read<MatchDetailCubit>().addTeam();
                            }
                          : null,
                    ),
                  ),
                ),
                CustomCard(
                  child: Column(
                    children: state.match.teams
                        .asMap()
                        .entries
                        .map(
                          (e) => TeamTile(
                            team: e.value,
                            onChanged: (value) {
                              context.read<MatchDetailCubit>().editTeam(e.key, value);
                            },
                            onDelete: !state.editMode && state.match.teams.length > Constants.minumumTeams
                                ? () {
                                    context.read<MatchDetailCubit>().removeTeam(e.key);
                                  }
                                : null,
                          ),
                        )
                        .toList(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
                  child: TextHeader(
                    title: S.of(context).penaltiesImpactType,
                  ),
                ),
                CustomCard(
                    child: Column(
                  children: [
                    SettingsTile(
                      leading: const Icon(Icons.scoreboard),
                      title: Row(
                        children: [
                          Flexible(child: Text(S.of(context).enableDefaultPenaltiesImpactPoints)),
                          Padding(
                            padding: const EdgeInsets.only(left: 4),
                            child: CustomTooltip(
                              tooltip: S.of(context).penaltiesImpactPointsTooltip,
                            ),
                          )
                        ],
                      ),
                      trailing: LoadingSwitch(
                          value: state.match.enablePenaltiesImpactPoints,
                          onChanged: (value) {
                            context.read<MatchDetailCubit>().edit(state.match.copyWith(enablePenaltiesImpactPoints: value));
                          }),
                    ),
                    SettingsTile(
                      leading: const Icon(Icons.sports),
                      title: Text(S.of(context).penaltiesImpactType),
                      subTitle: Text(
                        switch (state.match.penaltiesImpactType) {
                          PenaltiesImpactType.addPoints => S.of(context).penaltiesImpactTypeAdd,
                          PenaltiesImpactType.substractPoints => S.of(context).penaltiesImpactTypeSubstract,
                        },
                      ),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        BottomSheetDialog.showDialog(
                          context: context,
                          child: PenaltiesImpactTypeView(
                            currentPenaltiesImpactType: state.match.penaltiesImpactType,
                            onChanged: (penaltiesImpactType) =>
                                context.read<MatchDetailCubit>().edit(state.match.copyWith(penaltiesImpactType: penaltiesImpactType)),
                          ),
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              S.of(context).penaltiesRequiredToImpactPoints,
                              style: Theme.of(context).textTheme.titleMedium,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          QuantityStepperFormField(
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            initialValue: state.match.penaltiesRequiredToImpactPoints,
                            onChanged: (value) {
                              if (value != null) {
                                context.read<MatchDetailCubit>().edit(state.match.copyWith(penaltiesRequiredToImpactPoints: value));
                              }
                            },
                            minValue: 1,
                          ),
                        ],
                      ),
                    ),
                  ],
                ))
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
                        await context.read<MatchDetailCubit>().onConfirm(state.match);
                        navigator.pop();
                      }
                    },
                    child: Text(
                      state.editMode ? S.of(context).edit : S.of(context).create,
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
  }
}
