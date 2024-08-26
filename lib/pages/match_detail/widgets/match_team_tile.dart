import 'dart:async';

import 'package:flutter/material.dart';

import '../../../components/actions/loading_icon_button.dart';
import '../../../components/bottom_sheet_dialog/bottom_sheet_dialog.dart';
import '../../../components/color_picker/color_picker.dart';
import '../../../components/custom_card/custom_card.dart';
import '../../../components/search_dialog/teams_search.dart';
import '../../../components/settings_tile/settings_tile.dart';
import '../../../components/team_color_avatar/team_color_avatar.dart';
import '../../../l10n/app_localizations.dart';
import '../../../models/match_team_model.dart';
import '../../../models/performer_model.dart';
import '../../../models/team_model.dart';
import '../../../validators/validator.dart';

class MatchTeamTile extends StatefulWidget {
  final MatchTeamModel team;
  final bool allowSearch;
  final FutureOr<void> Function(MatchTeamModel team) onChanged;
  final FutureOr<void> Function()? onDelete;
  final Future<List<TeamModel>> Function(String query, List<String> selectedTags) getAllTeams;
  final Future<List<String>> Function() getAllTeamTags;
  final void Function(TeamModel team) onTeamSelected;
  final FutureOr<void> Function(int teamId)? addPerformer;
  final FutureOr<void> Function(int teamId, int index, PerformerModel performer) editPerformer;
  final FutureOr<void> Function(int teamId, int index)? removePerformer;
  final FutureOr<void> Function(int teamId, int oldIndex, int newIndex) onDrag;
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
                  builder: (context) => ColorPicker(initialColor: Color(widget.team.color), title: S.of(context).color),
                );
                if (newColor != null) {
                  widget.onChanged.call(widget.team.copyWith(color: newColor.value));
                }
              },
              child: TeamColorAvatar(
                color: Color(widget.team.color),
                height: 36,
                width: 36,
              ),
            ),
            title: TextFormField(
              controller: teamNameController,
              textCapitalization: TextCapitalization.sentences,
              onChanged: (value) => widget.onChanged.call(widget.team.copyWith(name: value)),
              validator: (value) => Validators.stringRequired(value),
              decoration: InputDecoration(
                suffixIcon: widget.allowSearch
                    ? LoadingIconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () => TeamsSearch.showDialog(
                          context,
                          widget.getAllTeamTags,
                          (team) {
                            widget.onTeamSelected(team);
                            teamNameController.text = team.name;
                          },
                          widget.getAllTeams,
                        ),
                      )
                    : null,
              ),
            ),
            trailing: LoadingIconButton(
              icon: const Icon(Icons.delete),
              onPressed: widget.onDelete,
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Text(
              S.of(context).performers,
              style: Theme.of(context).textTheme.labelMedium,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          ReorderableListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            onReorderStart: (index) => widget.onDragStart(),
            onReorder: (oldIndex, newIndex) => widget.onDrag(widget.team.id, oldIndex, newIndex),
            children: widget.team.performers
                .asMap()
                .entries
                .map(
                  (d) => Container(
                    key: ValueKey(d.value.id),
                    color: Theme.of(context).cardTheme.color,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: ReorderableDragStartListener(
                              index: d.key,
                              child: const Icon(Icons.drag_handle),
                            ),
                          ),
                          Expanded(
                            child: TeamPerformerItem(
                              key: ValueKey(d.value.id),
                              performer: d.value,
                              valueChanged: (value) async {
                                await widget.editPerformer(widget.team.id, d.key, value);
                              },
                            ),
                          ),
                          LoadingIconButton(
                            icon: const Icon(Icons.add),
                            onPressed: widget.addPerformer != null
                                ? () async {
                                    await widget.addPerformer!(widget.team.id);
                                  }
                                : null,
                          ),
                          LoadingIconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: widget.removePerformer != null
                                ? () async {
                                    await widget.removePerformer!(widget.team.id, d.key);
                                  }
                                : null,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

class TeamPerformerItem extends StatefulWidget {
  final PerformerModel performer;
  final ValueChanged<PerformerModel> valueChanged;

  const TeamPerformerItem({
    super.key,
    required this.performer,
    required this.valueChanged,
  });

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
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
      ),
      validator: (value) => Validators.stringRequired(value),
    );
  }
}
