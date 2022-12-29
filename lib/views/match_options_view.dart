import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:settings_ui/settings_ui.dart';

import '../generated/l10n.dart';
import '../cubits/match_cubit.dart';
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
        body: BlocBuilder<MatchCubit, MatchModel>(
          builder: (context, state) {
            var controller = context.read<MatchCubit>().nameController;
            return SettingsList(
              sections: [
                SettingsSection(
                  tiles: [
                    SettingsTile(
                      title: Text(S.of(context).MatchOptionsView_Name, overflow: TextOverflow.ellipsis),
                      value: TextFormField(
                        onChanged: (value) {
                          context.read<MatchCubit>().editName(controller.text);
                        },
                        controller: controller,
                      ),
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
                      var teamController = context.read<MatchCubit>().controllers[e.order];
                      return SettingsTile(
                        leading: InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (dialogContext) {
                                return AlertDialog(
                                  title: Text(S.of(context).MatchOptionsView_TeamColor, overflow: TextOverflow.ellipsis),
                                  content: SingleChildScrollView(
                                    child: BlockPicker(
                                      pickerColor: Color(e.color),
                                      onColorChanged: (value) async {
                                        var navigator = Navigator.of(dialogContext);
                                        context.read<MatchCubit>().editTeam(e.copyWith(color: value.value));
                                        navigator.pop();
                                      },
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: CircleAvatar(
                            backgroundColor: Color(e.color),
                          ),
                        ),
                        title: TextFormField(
                          controller: teamController,
                          onChanged: (value) {
                            context.read<MatchCubit>().editTeam(e.copyWith(name: teamController.text));
                          },
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            context.read<MatchCubit>().removeTeam(e);
                          },
                        ),
                      );
                    },
                  ).toList(),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
