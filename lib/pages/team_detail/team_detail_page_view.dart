import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haptic_feedback/haptic_feedback.dart';

import '../../components/actions/loading_button.dart';
import '../../components/bottom_sheet_dialog/bottom_sheet_appbar.dart';
import '../../components/bottom_sheet_dialog/bottom_sheet_dialog.dart';
import '../../components/bottom_sheet_dialog/bottom_sheet_scaffold.dart';
import '../../components/color_picker/color_picker.dart';
import '../../components/custom_card/custom_card.dart';
import '../../components/form/tags_field_element.dart';
import '../../components/settings_tile/settings_tile.dart';
import '../../components/team_color_avatar/team_color_avatar.dart';
import '../../components/text_header/text_header.dart';
import '../../cubits/settings/settings_cubit.dart';
import '../../cubits/teams/teams_cubit.dart';
import '../../extensions/color_extensions.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../validators/validator.dart';
import 'cubits/team_detail_cubit.dart';
import 'cubits/team_detail_state.dart';
import 'widgets/team_performers.dart';

class TeamDetailPageView extends StatefulWidget {
  const TeamDetailPageView({
    super.key,
  });

  @override
  State<TeamDetailPageView> createState() => _TeamDetailPageViewState();
}

class _TeamDetailPageViewState extends State<TeamDetailPageView> {
  late final TextEditingController _nameController;
  late final GlobalKey<FormState> formKey;

  @override
  void initState() {
    _nameController = TextEditingController(text: context.read<TeamDetailCubit>().state.team.name);
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
    return BlocBuilder<TeamDetailCubit, TeamDetailState>(
      builder: (context, state) {
        return BottomSheetScaffold(
          appBar: BottomSheetAppbar(
            title: state.editMode ? S.of(context).editTeam : S.of(context).createTeam,
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
                  child: TextHeader(title: S.of(context).team),
                ),
                CustomCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        S.of(context).name,
                        style: Theme.of(context).textTheme.labelMedium,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SettingsTile(
                        leading: InkWell(
                          onTap: () async {
                            final teamDetailCubit = context.read<TeamDetailCubit>();
                            final newColor = await BottomSheetDialog.showDialog<Color>(
                              context: context,
                              child: ColorPicker(initialColor: Color(state.team.color), title: S.of(context).color),
                            );
                            if (newColor != null) {
                              teamDetailCubit.edit(state.team.copyWith(color: newColor.getIntvalue));
                            }
                          },
                          child: TeamColorAvatar(
                            color: Color(state.team.color),
                            height: 36,
                            width: 36,
                          ),
                        ),
                        title: TextFormField(
                          initialValue: state.team.name,
                          textCapitalization: TextCapitalization.sentences,
                          onChanged: (value) => context.read<TeamDetailCubit>().edit(state.team.copyWith(name: value)),
                          validator: (value) => Validators.stringRequired(value),
                        ),
                      ),
                      const SizedBox(height: 8),
                      TagsFieldElement(
                        label: S.of(context).tags,
                        hintText: S.of(context).tagsHint,
                        initialTags: state.team.tags,
                        getAllTags: context.read<TeamsCubit>().getAllTags,
                        onChanged: (value) {
                          context.read<TeamDetailCubit>().edit(state.team.copyWith(tags: value));
                        },
                      ),
                      const SizedBox(height: 8),
                      const Divider(),
                      const SizedBox(height: 8),
                      TeamPerformers(
                        label: S.of(context).performers,
                        performers: state.team.performers,
                        addPerformer: !state.editMode ? context.read<TeamDetailCubit>().addPerformer : null,
                        editPerformer: context.read<TeamDetailCubit>().editPerformer,
                        removePerformer: state.team.performers.length > 1 && !state.editMode ? context.read<TeamDetailCubit>().removePerformer : null,
                        onDrag: context.read<TeamDetailCubit>().movePerformer,
                        onDragStart: () => context.read<SettingsCubit>().vibrate(HapticsType.selection),
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
                        await context.read<TeamDetailCubit>().onConfirm(state.team);
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
