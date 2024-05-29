import 'dart:async';

import 'package:flutter/material.dart';

import '../../../components/actions/loading_icon_button.dart';
import '../../../components/bottom_sheet_dialog/bottom_sheet_dialog.dart';
import '../../../components/color_picker/color_picker.dart';
import '../../../components/settings_tile/settings_tile.dart';
import '../../../components/team_color_avatar/team_color_avatar.dart';
import '../../../l10n/app_localizations.dart';
import '../../../models/team_model.dart';
import '../../../validators/validator.dart';

class TeamTile extends StatelessWidget {
  final TeamModel team;
  final FutureOr<void> Function(TeamModel team) onChanged;
  final FutureOr<void> Function()? onDelete;

  const TeamTile({
    super.key,
    required this.team,
    required this.onChanged,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return SettingsTile(
      leading: InkWell(
        onTap: () async {
          final newColor = await BottomSheetDialog.showDialog<Color>(
            context: context,
            child: ColorPicker(initialColor: Color(team.color), title: S.of(context).color),
          );
          if (newColor != null) {
            onChanged.call(team.copyWith(color: newColor.value));
          }
        },
        child: TeamColorAvatar(
          color: Color(team.color),
          height: 36,
          width: 36,
          borderWidth: 2,
        ),
      ),
      title: TextFormField(
        initialValue: team.name,
        textCapitalization: TextCapitalization.sentences,
        onChanged: (value) => onChanged.call(team.copyWith(name: value)),
        validator: Validators.stringRequired,
      ),
      trailing: LoadingIconButton(
        icon: const Icon(Icons.remove),
        onPressed: onDelete,
      ),
    );
  }
}
