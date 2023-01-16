import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings_ui/settings_ui.dart';

import '../cubits/match_cubit.dart';
import '../dialogs/colorpicker_dialog.dart';
import '../dialogs/text_dialog.dart';
import '../generated/l10n.dart';
import '../models/match_model.dart';

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
          sections: [
            SettingsSection(
              title: Text(S.of(context).MatchOptionsView_Match),
              tiles: [
                SettingsTile(
                  title: Text(S.of(context).MatchOptionsView_Name, overflow: TextOverflow.ellipsis),
                  value: Text(state.name),
                  onPressed: (context) => _openMatchNamePopup(context, state.name),
                )
              ],
            ),
            SettingsSection(
              title: ListTile(
                title: Text(S.of(context).MatchOptionsView_Teams, overflow: TextOverflow.ellipsis),
                trailing: state.teams.length < 3
                    ? IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          context.read<MatchCubit>().addTeam();
                        },
                      )
                    : null,
              ),
              tiles: state.teams.map(
                (e) {
                  return SettingsTile(
                    leading: InkWell(
                      onTap: () {
                        ColorPickerDialog.showColorPickerDialog(context, Color(e.color), (value) async {
                          await context.read<MatchCubit>().editTeam(e.copyWith(color: value.value));
                        });
                      },
                      child: CircleAvatar(
                        backgroundColor: Color(e.color),
                      ),
                    ),
                    title: Text(e.name),
                    onPressed: (context) {
                      TextDialog.showTextDialog(
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
                            onPressed: () {
                              context.read<MatchCubit>().removeTeam(e);
                            },
                          )
                        : null,
                  );
                },
              ).toList(),
            )
          ],
        ),
      ),
    );
  }

  _openMatchNamePopup(BuildContext context, String name) {
    TextDialog.showTextDialog(
      context,
      S.of(context).MatchOptionsView_Name,
      name,
      false,
      (value) async => await context.read<MatchCubit>().editName(value),
    );
  }
}
