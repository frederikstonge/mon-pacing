import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haptic_feedback/haptic_feedback.dart';

import '../../components/bottom_sheet/bottom_sheet_appbar.dart';
import '../../components/bottom_sheet/bottom_sheet_dialog.dart';
import '../../components/bottom_sheet/bottom_sheet_scaffold.dart';
import '../../components/buttons/loading_button.dart';
import '../../components/custom_card/custom_card.dart';
import '../../components/custom_tooltip/custom_tooltip.dart';
import '../../components/form/tags_field_element.dart';
import '../../components/form/text_field_element.dart';
import '../../components/message_box_dialog/message_box_dialog.dart';
import '../../components/penalties_impact_type/penalties_impact_type_view.dart';
import '../../components/quantity_stepper/quantity_stepper_form_field.dart';
import '../../components/settings_tile/settings_tile.dart';
import '../../components/text_header/text_header.dart';
import '../../cubits/matches/matches_cubit.dart';
import '../../cubits/settings/settings_cubit.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../models/constants.dart';
import '../../models/penalties_impact_type.dart';
import '../../models/tag_model.dart';
import '../../models/team_model.dart';
import '../../repositories/teams_repository.dart';
import '../../validators/validators.dart';
import 'cubits/match_detail_cubit.dart';
import 'cubits/match_detail_state.dart';
import 'widgets/match_team_tile.dart';

class MatchDetailPageView extends StatefulWidget {
  const MatchDetailPageView({super.key});

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
      builder: (context, matchDetailState) {
        return BottomSheetScaffold(
          appBar: BottomSheetAppbar(
            title: matchDetailState.editMode ? S.of(context).editMatch : S.of(context).startMatch,
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
                          context.read<MatchDetailCubit>().edit(matchDetailState.match.copyWith(name: value));
                        },
                      ),
                      const SizedBox(height: 8),
                      TagsFieldElement(
                        label: S.of(context).tags,
                        hintText: S.of(context).tagsHint,
                        initialTags: matchDetailState.match.tags,
                        getAllTags: context.read<MatchesCubit>().getAllTags,
                        onChanged: (value) {
                          context.read<MatchDetailCubit>().edit(matchDetailState.match.copyWith(tags: value));
                        },
                      ),
                      const SizedBox(height: 8),
                      SettingsTile(
                        leading: const Icon(Icons.sports),
                        title: Row(
                          children: [
                            Flexible(child: Text(S.of(context).enableStatistics)),
                            Padding(
                              padding: const EdgeInsets.only(left: 4),
                              child: CustomTooltip(tooltip: S.of(context).enableStatisticsTooltip),
                            ),
                          ],
                        ),
                        trailing: Switch(
                          value: matchDetailState.match.enableStatistics,
                          onChanged:
                              !matchDetailState.editMode
                                  ? (value) {
                                    context.read<MatchDetailCubit>().edit(
                                      matchDetailState.match.copyWith(enableStatistics: value),
                                    );
                                  }
                                  : null,
                        ),
                      ),
                    ],
                  ),
                ),
                if (matchDetailState.match.enableStatistics) ...[
                  Padding(
                    padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
                    child: TextHeader(title: S.of(context).teams),
                  ),
                  Column(
                    children: [
                      ...matchDetailState.match.teams.map(
                        (e) => MatchTeamTile(
                          team: e,
                          allowSearch: !matchDetailState.editMode,
                          onChanged: (value) {
                            context.read<MatchDetailCubit>().editTeam(value);
                          },
                          onDelete:
                              !matchDetailState.editMode && matchDetailState.match.teams.length > Constants.minimumTeams
                                  ? () async {
                                    final cubit = context.read<MatchDetailCubit>();
                                    final result = await MessageBoxDialog.questionShow(
                                      context,
                                      S
                                          .of(context)
                                          .areYouSureActionName(
                                            action: S.of(context).delete.toLowerCase(),
                                            name: e.name,
                                          ),
                                      S.of(context).delete,
                                      S.of(context).cancel,
                                    );

                                    if (result == true) {
                                      cubit.removeTeam(e);
                                    }
                                  }
                                  : null,
                          getAllTeamTags: () async {
                            final tags = await context.read<TeamsRepository>().getAllTags();
                            return tags.map((e) => TagModel.fromEntity(entity: e)).toList();
                          },
                          getAllTeams: (query, selectedTags) async {
                            final teamEntities = await context.read<TeamsRepository>().search(query, selectedTags);
                            return teamEntities.map((e) => TeamModel.fromEntity(entity: e)).toList();
                          },
                          onTeamSelected: (team) => context.read<MatchDetailCubit>().onTeamSelected(e, team),
                          addPerformer:
                              !matchDetailState.editMode ? context.read<MatchDetailCubit>().addPerformer : null,
                          editPerformer: context.read<MatchDetailCubit>().editPerformer,
                          removePerformer:
                              e.performers.length > 1 && !matchDetailState.editMode
                                  ? context.read<MatchDetailCubit>().removePerformer
                                  : null,
                          onDrag: context.read<MatchDetailCubit>().movePerformer,
                          onDragStart: () => context.read<SettingsCubit>().vibrate(HapticsType.selection),
                        ),
                      ),
                      LoadingButton.filledIcon(
                        icon: const Icon(Icons.add),
                        onPressed:
                            !matchDetailState.editMode && matchDetailState.match.teams.length < Constants.maximumTeams
                                ? () {
                                  context.read<MatchDetailCubit>().addTeam();
                                }
                                : null,
                        child: Text(S.of(context).addTeam, maxLines: 1, overflow: TextOverflow.ellipsis),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
                    child: TextHeader(title: S.of(context).penalty),
                  ),
                  CustomCard(
                    child: Column(
                      children: [
                        SettingsTile(
                          leading: const Icon(Icons.sports),
                          title: Row(
                            children: [
                              Flexible(child: Text(S.of(context).enablePenaltiesImpactPoints)),
                              Padding(
                                padding: const EdgeInsets.only(left: 4),
                                child: CustomTooltip(tooltip: S.of(context).penaltiesImpactPointsTooltip),
                              ),
                            ],
                          ),
                          trailing: Switch(
                            value: matchDetailState.match.enablePenaltiesImpactPoints,
                            onChanged: (value) {
                              context.read<MatchDetailCubit>().edit(
                                matchDetailState.match.copyWith(enablePenaltiesImpactPoints: value),
                              );
                            },
                          ),
                        ),
                        SettingsTile(
                          leading: const Icon(Icons.sports),
                          title: Text(S.of(context).penaltiesImpactType),
                          subTitle: Text(switch (matchDetailState.match.penaltiesImpactType) {
                            PenaltiesImpactType.addPoints => S.of(context).penaltiesImpactTypeAdd,
                            PenaltiesImpactType.substractPoints => S.of(context).penaltiesImpactTypeSubstract,
                          }),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () {
                            BottomSheetDialog.showDialog(
                              context: context,
                              child: PenaltiesImpactTypeView(
                                currentPenaltiesImpactType: matchDetailState.match.penaltiesImpactType,
                                onChanged:
                                    (penaltiesImpactType) => context.read<MatchDetailCubit>().edit(
                                      matchDetailState.match.copyWith(penaltiesImpactType: penaltiesImpactType),
                                    ),
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
                                  style: Theme.of(context).textTheme.bodyLarge,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              QuantityStepperFormField(
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                initialValue: matchDetailState.match.penaltiesRequiredToImpactPoints,
                                onChanged: (value) {
                                  if (value != null) {
                                    context.read<MatchDetailCubit>().edit(
                                      matchDetailState.match.copyWith(penaltiesRequiredToImpactPoints: value),
                                    );
                                  }
                                },
                                minValue: 1,
                              ),
                            ],
                          ),
                        ),
                        const Divider(),
                        SettingsTile(
                          leading: const Icon(Icons.sports),
                          title: Row(
                            children: [
                              Flexible(child: Text(S.of(context).enableMatchExpulsion)),
                              Padding(
                                padding: const EdgeInsets.only(left: 4),
                                child: CustomTooltip(tooltip: S.of(context).enableMatchExpulsionTooltip),
                              ),
                            ],
                          ),
                          trailing: Switch(
                            value: matchDetailState.match.enableMatchExpulsion,
                            onChanged: (value) {
                              context.read<MatchDetailCubit>().edit(
                                matchDetailState.match.copyWith(enableMatchExpulsion: value),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  S.of(context).penaltiesRequiredToExpel,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              QuantityStepperFormField(
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                initialValue: matchDetailState.match.penaltiesRequiredToExpel,
                                onChanged: (value) {
                                  if (value != null) {
                                    context.read<MatchDetailCubit>().edit(
                                      matchDetailState.match.copyWith(penaltiesRequiredToExpel: value),
                                    );
                                  }
                                },
                                minValue: 1,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
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
                        final result = await context.read<MatchDetailCubit>().onConfirm(matchDetailState.match);
                        if (result) {
                          navigator.pop();
                        }
                      }
                    },
                    child: Text(
                      matchDetailState.editMode ? S.of(context).edit : S.of(context).create,
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
