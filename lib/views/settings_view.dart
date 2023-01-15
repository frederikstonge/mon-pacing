import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:settings_ui/settings_ui.dart';

import '../cubits/settings_cubit.dart';
import '../dialogs/colorpicker_dialog.dart';
import '../generated/l10n.dart';
import '../helpers/duration_helper.dart';
import '../models/settings_model.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsModel>(
      builder: (context, state) => SettingsList(
        sections: [
          SettingsSection(
            title: Text(S.of(context).SettingsView_Section_Application),
            tiles: [
              SettingsTile(
                leading: const Icon(Icons.color_lens),
                title: Text(S.of(context).SettingsView_ThemeTitle),
                trailing: CircleAvatar(
                  backgroundColor: Color(state.color),
                ),
                onPressed: (context) {
                  ColorPickerDialog.showColorPickerDialog(context, Color(state.color), (value) {
                    context.read<SettingsCubit>().edit(state.copyWith(color: value.value));
                  });
                },
              ),
              SettingsTile(
                title: Text(S.of(context).SettingsView_LanguageTitle),
                leading: const Icon(Icons.language),
                trailing: DropdownButton<String>(
                  items: [
                    DropdownMenuItem(
                      value: "en",
                      child: Text(S.of(context).SettingsView_Language_English),
                    ),
                    DropdownMenuItem(
                      value: "fr",
                      child: Text(S.of(context).SettingsView_Language_French),
                    )
                  ],
                  value: state.language,
                  onChanged: (value) async {
                    if (value != null) {
                      var cubit = context.read<SettingsCubit>();
                      await S.load(Locale(value));
                      cubit.edit(state.copyWith(language: value));
                    }
                  },
                ),
              ),
            ],
          ),
          SettingsSection(
            title: Text(S.of(context).SettingsView_Section_Pacings),
            tiles: [
              SettingsTile.switchTile(
                initialValue: state.enablePaddingDuration,
                onToggle: (value) => context.read<SettingsCubit>().edit(state.copyWith(enablePaddingDuration: value)),
                title: Text(S.of(context).SettingsView_EnablePaddingDuration),
                description: Text(S.of(context).Settings_View_EnablePaddingDurationDescription),
              ),
              SettingsTile(
                title: Text(S.of(context).SettingsView_PaddingDuration),
                value: Text(DurationHelper.getDurationString(state.paddingDuration)),
                onPressed: (context) {
                  Picker(
                    adapter: NumberPickerAdapter(data: <NumberPickerColumn>[
                      NumberPickerColumn(
                        begin: 0,
                        end: 20,
                        suffix: Text(S.of(context).PacingView_ImprovisationDurationMinutes),
                        initValue: state.paddingDuration.inMinutes,
                      ),
                      NumberPickerColumn(
                        begin: 0,
                        end: 60,
                        suffix: Text(S.of(context).PacingView_ImprovisationDurationSeconds),
                        initValue: (state.paddingDuration.inSeconds % 60),
                        jump: 15,
                      ),
                    ]),
                    delimiter: <PickerDelimiter>[
                      PickerDelimiter(
                        child: Container(
                          width: 10.0,
                          alignment: Alignment.center,
                        ),
                      )
                    ],
                    hideHeader: true,
                    confirmText: S.of(context).Dialog_Ok,
                    title: Text(S.of(context).PacingView_ImprovisationDurationTitle),
                    onConfirm: (Picker picker, List<int> value) {
                      var duration = Duration(
                        minutes: picker.getSelectedValues()[0],
                        seconds: picker.getSelectedValues()[1],
                      );
                      context.read<SettingsCubit>().edit(state.copyWith(paddingDuration: duration));
                    },
                  ).showDialog(context);
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
