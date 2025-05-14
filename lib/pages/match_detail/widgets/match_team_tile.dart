import 'dart:async';

import 'package:flutter/material.dart';

import '../../../components/bottom_sheet/bottom_sheet_dialog.dart';
import '../../../components/buttons/loading_icon_button.dart';
import '../../../components/color_picker/color_picker.dart';
import '../../../components/custom_card/custom_card.dart';
import '../../../components/search/teams_search.dart';
import '../../../components/settings_tile/settings_tile.dart';
import '../../../components/team_color_avatar/team_color_avatar.dart';
import '../../../extensions/color_extensions.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../../../models/performer_model.dart';
import '../../../models/tag_model.dart';
import '../../../models/team_model.dart';
import '../../../validators/validators.dart';
import '../../team_detail/widgets/team_performers.dart';

class MatchTeamTile extends StatefulWidget {
  final TeamModel team;
  final bool allowSearch;
  final FutureOr<void> Function(TeamModel team) onChanged;
  final FutureOr<void> Function()? onDelete;
  final Future<List<TeamModel>> Function(String query, List<String> selectedTags) getAllTeams;
  final Future<List<TagModel>> Function() getAllTeamTags;
  final void Function(TeamModel team) onTeamSelected;
  final FutureOr<void> Function(TeamModel team)? addPerformer;
  final FutureOr<void> Function(TeamModel team, PerformerModel performer) editPerformer;
  final FutureOr<void> Function(TeamModel team, PerformerModel performer)? removePerformer;
  final FutureOr<void> Function(TeamModel team, int oldIndex, int newIndex) onDrag;
  final FutureOr<void> Function() onDragStart;

  const MatchTeamTile({
    super.key,
    required this.team,
    required this.allowSearch,
    required this.onChanged,
    required this.onDelete,
    required this.getAllTeams,
    required this.getAllTeamTags,
    required this.onTeamSelected,
    required this.addPerformer,
    required this.editPerformer,
    required this.removePerformer,
    required this.onDrag,
    required this.onDragStart,
  });

  @override
  State<MatchTeamTile> createState() => _MatchTeamTileState();
}

class _MatchTeamTileState extends State<MatchTeamTile> {
  late final TextEditingController teamNameController;

  @override
  void initState() {
    teamNameController = TextEditingController(text: widget.team.name);
    super.initState();
  }

  @override
  void dispose() {
    teamNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomCard(
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
                final newColor = await BottomSheetDialog.showDialog<Color>(
                  context: context,
                  child: ColorPicker(initialColor: Color(widget.team.color), title: S.of(context).color),
                );
                if (newColor != null) {
                  widget.onChanged.call(widget.team.copyWith(color: newColor.getIntvalue));
                }
              },
              child: TeamColorAvatar(color: Color(widget.team.color), height: 36, width: 36),
            ),
            title: TextFormField(
              controller: teamNameController,
              textCapitalization: TextCapitalization.sentences,
              onChanged: (value) => widget.onChanged.call(widget.team.copyWith(name: value)),
              validator: (value) => Validators.stringRequired(value),
              decoration: InputDecoration(
                suffixIcon:
                    widget.allowSearch
                        ? LoadingIconButton(
                          tooltip: S.of(context).search(category: S.of(context).match.toLowerCase()),
                          icon: const Icon(Icons.search),
                          onPressed: () async {
                            final result = await TeamsSearch.showDialog(
                              context,
                              widget.getAllTeams,
                              widget.getAllTeamTags,
                            );
                            if (result != null) {
                              widget.onTeamSelected(result);
                              teamNameController.text = result.name;
                            }
                          },
                        )
                        : null,
              ),
            ),
            trailing: LoadingIconButton(
              icon: const Icon(Icons.delete),
              onPressed: widget.onDelete,
              tooltip: S.of(context).delete,
            ),
          ),
          const Divider(),
          TeamPerformers(
            label: S.of(context).performers,
            performers: widget.team.performers,
            addPerformer: widget.addPerformer != null ? () => widget.addPerformer!(widget.team) : null,
            editPerformer: (performer) => widget.editPerformer(widget.team, performer),
            removePerformer:
                widget.removePerformer != null ? (index) => widget.removePerformer!(widget.team, index) : null,
            onDrag: (oldIndex, newIndex) => widget.onDrag(widget.team, oldIndex, newIndex),
            onDragStart: widget.onDragStart,
          ),
        ],
      ),
    );
  }
}

class TeamPerformerItem extends StatefulWidget {
  final PerformerModel performer;
  final ValueChanged<PerformerModel> valueChanged;

  const TeamPerformerItem({super.key, required this.performer, required this.valueChanged});

  @override
  State<TeamPerformerItem> createState() => _TeamPerformerItemState();
}

class _TeamPerformerItemState extends State<TeamPerformerItem> {
  final _textController = TextEditingController();

  @override
  void initState() {
    _textController.text = widget.performer.name;
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _textController,
      textCapitalization: TextCapitalization.sentences,
      onChanged: (value) => widget.valueChanged(widget.performer.copyWith(name: value)),
      decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(6.0))),
      validator: (value) => Validators.stringRequired(value),
    );
  }
}
