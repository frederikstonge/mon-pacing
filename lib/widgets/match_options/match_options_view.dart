import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings_ui/settings_ui.dart';

import '../../cubits/match/match_cubit.dart';
import '../../dialogs/colorpicker_dialog.dart';
import '../../dialogs/text_dialog.dart';
import '../../l10n/generated/l10n.dart';
import '../../models/match_model.dart';

class MatchOptionsView extends StatelessWidget {
  const MatchOptionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MatchCubit, MatchModel>(
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).MatchOptionsView_Title(state.name), overflow: TextOverflow.ellipsis),
        ),
        body: SettingsList(
          lightTheme: SettingsThemeData(
            settingsListBackground: Theme.of(context).scaffoldBackgroundColor,
            titleTextColor: Theme.of(context).primaryColor,
          ),
          sections: [
            SettingsSection(
              title: Text(S.of(context).MatchOptionsView_Match),
              tiles: [
                SettingsTile(
                  leading: const Icon(Icons.edit),
                  title: Text(S.of(context).MatchOptionsView_Name, overflow: TextOverflow.ellipsis),
                  value: Text(state.name),
                  onPressed: (context) async => await _openMatchNamePopup(context, state.name),
                )
              ],
            ),
            SettingsSection(
              title: Text(S.of(context).MatchOptionsView_Teams, overflow: TextOverflow.ellipsis),
              tiles: [
                ...state.teams.map(
                  (e) {
                    return SettingsTile(
                      leading: InkWell(
                        onTap: () async {
                          await ColorPickerDialog.showColorPickerDialog(
                            context,
                            Color(e.color),
                            (value) async => await context.read<MatchCubit>().editTeam(e.copyWith(color: value.value)),
                          );
                        },
                        child: CircleAvatar(
                          backgroundColor: Color(e.color),
                        ),
                      ),
                      title: Text(e.name),
                      onPressed: (context) async {
                        await TextDialog.showTextDialog(
                          context,
                          S.of(context).MatchOptionsView_TeamName,
                          e.name,
                          false,
                          (value) async => await context.read<MatchCubit>().editTeam(e.copyWith(name: value)),
                        );
                      },
                      trailing: state.teams.length > 1
                          ? IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () => context.read<MatchCubit>().removeTeam(e),
                            )
                          : null,
                    );
                  },
                ).toList(),
                if (state.teams.length < 3)
                  SettingsTile(
                    leading: IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () async => await _addTeam(context),
                    ),
                    title: InkWell(
                      child: Text(S.of(context).MatchOptionsView_AddTeam),
                      onTap: () async => await _addTeam(context),
                    ),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> _addTeam(BuildContext context) async {
    await context.read<MatchCubit>().addTeam();
  }

  Future<void> _openMatchNamePopup(BuildContext context, String name) async {
    await TextDialog.showTextDialog(
      context,
      S.of(context).MatchOptionsView_Name,
      name,
      false,
      (value) async => await context.read<MatchCubit>().editName(value),
    );
  }
}
