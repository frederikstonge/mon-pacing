import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings_ui/settings_ui.dart';

import '../../cubits/settings/settings_cubit.dart';
import '../../dialogs/colorpicker_dialog.dart';
import '../../dialogs/duration_dialog.dart';
import '../../helpers/duration_helper.dart';
import '../../l10n/generated/l10n.dart';
import '../../models/settings_model.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).SettingsPage_Title)),
      body: BlocBuilder<SettingsCubit, SettingsModel>(
        builder: (context, state) => SettingsList(
          lightTheme: SettingsThemeData(
            settingsListBackground: Theme.of(context).scaffoldBackgroundColor,
            titleTextColor: Theme.of(context).primaryColor,
          ),
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
                  onPressed: (context) async {
                    await ColorPickerDialog.showColorPickerDialog(context, Color(state.color), (value) {
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
                        final cubit = context.read<SettingsCubit>();
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
                  leading: Icon(state.enableDefaultPaddingDuration ? Icons.alarm_on : Icons.alarm_off),
                  initialValue: state.enableDefaultPaddingDuration,
                  onToggle: (value) => context.read<SettingsCubit>().edit(state.copyWith(enableDefaultPaddingDuration: value)),
                  title: Text(S.of(context).SettingsView_EnableDefaultPaddingDuration),
                  description: Text(S.of(context).SettingsView_EnableDefaultPaddingDurationDescription),
                ),
                SettingsTile(
                  leading: const Icon(Icons.alarm),
                  title: Text(S.of(context).SettingsView_DefaultPaddingDuration),
                  value: Text(DurationHelper.getDurationString(state.defaultPaddingDuration)),
                  onPressed: (context) async {
                    await DurationDialog.showDurationDialog(
                      context,
                      state.defaultPaddingDuration,
                      (value) => context.read<SettingsCubit>().edit(state.copyWith(defaultPaddingDuration: value)),
                    );
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
