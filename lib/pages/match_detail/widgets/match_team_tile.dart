import 'dart:async';

import 'package:flutter/material.dart';

import '../../../components/actions/loading_icon_button.dart';
import '../../../components/bottom_sheet_dialog/bottom_sheet_dialog.dart';
import '../../../components/color_picker/color_picker.dart';
import '../../../components/search_dialog/teams_search.dart';
import '../../../components/settings_tile/settings_tile.dart';
import '../../../components/team_color_avatar/team_color_avatar.dart';
import '../../../l10n/app_localizations.dart';
import '../../../models/match_team_model.dart';
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

  const MatchTeamTile({
    super.key,
    required this.team,
    required this.allowSearch,
    required this.onChanged,
    required this.onDelete,
    required this.getAllTeams,
    required this.getAllTeamTags,
    required this.onTeamSelected,
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
    return SettingsTile(
      leading: InkWell(
        onTap: () async {
          final newColor = await BottomSheetDialog.showDialog<Color>(
            context: context,
            child: ColorPicker(initialColor: Color(widget.team.color), title: S.of(context).color),
          );
          if (newColor != null) {
            widget.onChanged.call(widget.team.copyWith(color: newColor.value));
          }
        },
        child: TeamColorAvatar(
          color: Color(widget.team.color),
          height: 36,
          width: 36,
          borderWidth: 2,
        ),
      ),
      title: TextFormField(
        controller: teamNameController,
        textCapitalization: TextCapitalization.sentences,
        onChanged: (value) => widget.onChanged.call(widget.team.copyWith(name: value)),
        validator: (value) => Validators.stringRequired(value),
        decoration: InputDecoration(
          suffixIcon: LoadingIconButton(
            icon: const Icon(Icons.search),
            onPressed: widget.allowSearch
                ? () => TeamsSearch.showDialog(
                      context,
                      widget.getAllTeamTags,
                      (team) {
                        widget.onTeamSelected(team);
                        teamNameController.text = team.name;
                      },
                      widget.getAllTeams,
                    )
                : null,
          ),
        ),
      ),
      trailing: LoadingIconButton(
        icon: const Icon(Icons.remove),
        onPressed: widget.onDelete,
      ),
    );
  }
}
