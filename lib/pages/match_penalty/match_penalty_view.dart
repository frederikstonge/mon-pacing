import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/bottom_sheet/bottom_sheet_appbar.dart';
import '../../components/bottom_sheet/bottom_sheet_scaffold.dart';
import '../../components/buttons/loading_button.dart';
import '../../components/custom_card/custom_card.dart';
import '../../components/form/drop_down_element.dart';
import '../../components/form/text_field_element.dart';
import '../../components/settings_tile/settings_tile.dart';
import '../../components/team_color_avatar/team_color_avatar.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../validators/validators.dart';
import 'cubits/match_penalty_cubit.dart';
import 'cubits/match_penalty_state.dart';

class MatchPenaltyView extends StatefulWidget {
  const MatchPenaltyView({
    super.key,
  });

  @override
  State<MatchPenaltyView> createState() => _MatchPenaltyViewState();
}

class _MatchPenaltyViewState extends State<MatchPenaltyView> {
  late final GlobalKey<FormState> formKey;
  late final TextEditingController _typeController;

  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    _typeController = TextEditingController(text: context.read<MatchPenaltyCubit>().state.penalty.type);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MatchPenaltyCubit, MatchPenaltyState>(
      builder: (context, state) {
        return BottomSheetScaffold(
          appBar: BottomSheetAppbar(
            title: state.editMode ? S.of(context).editPenalty : S.of(context).addPenalty,
          ),
          body: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.always,
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                CustomCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DropdownButtonFormField<int>(
                        isExpanded: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                        ),
                        icon: const Icon(Icons.arrow_downward),
                        value: state.penalty.teamId,
                        onChanged: (value) {
                          if (value != null) {
                            context.read<MatchPenaltyCubit>().edit(state.penalty.copyWith(teamId: value));
                          }
                        },
                        items: state.teams
                            .map((e) => DropdownMenuItem(
                                  value: e.id,
                                  child: Row(
                                    children: [
                                      TeamColorAvatar(color: Color(e.color)),
                                      const SizedBox(width: 6),
                                      Expanded(
                                        child: Text(
                                          e.name,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ))
                            .toList(),
                      ),
                      if (state.integrationPenaltyTypes != null) ...[
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: Text(
                            '${S.of(context).type}*',
                            style: Theme.of(context).textTheme.labelMedium,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        DropdownButtonFormField<int>(
                          isExpanded: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                          ),
                          icon: const Icon(Icons.arrow_downward),
                          value: state.penalty.type.isNotEmpty ? state.integrationPenaltyTypes!.indexOf(state.penalty.type) : 0,
                          onChanged: (value) {
                            if (value != null) {
                              context.read<MatchPenaltyCubit>().edit(state.penalty.copyWith(type: state.integrationPenaltyTypes!.elementAt(value)));
                            }
                          },
                          validator: (value) {
                            return Validators.stringRequired(state.integrationPenaltyTypes!.elementAt(value!));
                          },
                          items: state.integrationPenaltyTypes!
                              .asMap()
                              .entries
                              .map((e) => DropdownMenuItem(
                                    value: e.key,
                                    child: Text(
                                      e.value,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ))
                              .toList(),
                        ),
                      ] else ...[
                        TextFieldElement(
                          autoFocus: true,
                          label: '${S.of(context).type}*',
                          controller: _typeController,
                          validator: (value) {
                            return Validators.stringRequired(value);
                          },
                          onChanged: (value) {
                            context.read<MatchPenaltyCubit>().edit(state.penalty.copyWith(type: value));
                          },
                        ),
                      ],
                      SettingsTile(
                        leading: const Icon(Icons.sports),
                        title: Text(S.of(context).major),
                        trailing: Switch(
                            value: state.penalty.major,
                            onChanged: (value) {
                              context.read<MatchPenaltyCubit>().edit(state.penalty.copyWith(major: value));
                            }),
                      ),
                      DropDownElement<int?>(
                        label: S.of(context).performer,
                        value: state.teams
                            .firstWhere((t) => t.id == state.penalty.teamId)
                            .performers
                            .firstWhereOrNull((p) => p.id == state.penalty.performerId)
                            ?.id,
                        onChanged: (value) {
                          context.read<MatchPenaltyCubit>().edit(state.penalty.copyWith(performerId: value));
                        },
                        items: [
                          const DropdownMenuItem(
                            value: null,
                            child: Row(
                              children: [
                                Expanded(child: Text('-')),
                              ],
                            ),
                          ),
                          ...state.teams.firstWhere((t) => t.id == state.penalty.teamId).performers.map(
                                (p) => DropdownMenuItem(
                                  value: p.id,
                                  child: Row(
                                    children: [
                                      Expanded(child: Text(p.name)),
                                    ],
                                  ),
                                ),
                              ),
                        ],
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
                        await context.read<MatchPenaltyCubit>().onSave(state.penalty);
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
        );
      },
    );
  }
}
