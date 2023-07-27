import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings_ui/settings_ui.dart';

import '../../cubits/pacing/pacing_cubit.dart';
import '../../cubits/pacing/pacing_state.dart';
import '../../dialogs/duration_dialog.dart';
import '../../dialogs/number_dialog.dart';
import '../../dialogs/text_dialog.dart';
import '../../helpers/duration_helper.dart';
import '../../l10n/generated/l10n.dart';
import '../../models/pacing_model.dart';

class PacingOptionsView extends StatelessWidget {
  const PacingOptionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PacingCubit, PacingState>(
      builder: (context, state) => state.when(
        initial: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
        error: (error) => Scaffold(body: Center(child: Text(error))),
        success: (pacing) => Scaffold(
          appBar: AppBar(
            title: Text(S.of(context).PacingOptionsView_Title(pacing.name), overflow: TextOverflow.ellipsis),
          ),
          body: SettingsList(
            lightTheme: SettingsThemeData(
              settingsListBackground: Theme.of(context).scaffoldBackgroundColor,
              titleTextColor: Theme.of(context).primaryColor,
            ),
            sections: [
              SettingsSection(
                title: Text(S.of(context).PacingOptionsView_Pacing, overflow: TextOverflow.ellipsis),
                tiles: [
                  SettingsTile(
                    leading: const Icon(Icons.edit),
                    title: Text(S.of(context).PacingOptionsView_Name, overflow: TextOverflow.ellipsis),
                    value: Text(pacing.name),
                    onPressed: (context) async => await _openPacingNamePopup(context, pacing),
                  ),
                  SettingsTile.switchTile(
                    leading: Icon(pacing.enablePaddingDuration ? Icons.alarm_on : Icons.alarm_off),
                    initialValue: pacing.enablePaddingDuration,
                    onToggle: (value) => context.read<PacingCubit>().edit(pacing.copyWith(enablePaddingDuration: value)),
                    title: Text(S.of(context).PacingOptionsView_EnablePaddingDuration, overflow: TextOverflow.ellipsis),
                    description: Text(S.of(context).PacingOptionsView_EnablePaddingDurationDescription, overflow: TextOverflow.ellipsis),
                  ),
                  SettingsTile(
                    leading: const Icon(Icons.alarm),
                    title: Text(S.of(context).PacingOptionsView_PaddingDuration, overflow: TextOverflow.ellipsis),
                    value: Text(DurationHelper.getDurationString(pacing.paddingDuration), overflow: TextOverflow.ellipsis),
                    onPressed: (context) async {
                      await DurationDialog.showDurationDialog(
                        context,
                        pacing.paddingDuration,
                        (value) => context.read<PacingCubit>().edit(pacing.copyWith(paddingDuration: value)),
                      );
                    },
                  ),
                  SettingsTile(
                    leading: const Icon(Icons.group),
                    title: Text(S.of(context).PacingOptionsView_DefaultNumberOfTeams, overflow: TextOverflow.ellipsis),
                    value: Text(pacing.defaultNumberOfTeams.toString(), overflow: TextOverflow.ellipsis),
                    onPressed: (context) async {
                      await NumberDialog.showNumberDialog(
                        context,
                        S.of(context).PacingOptionsView_DefaultNumberOfTeams,
                        pacing.defaultNumberOfTeams,
                        false,
                        (value) async => context.read<PacingCubit>().edit(pacing.copyWith(defaultNumberOfTeams: value)),
                      );
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _openPacingNamePopup(BuildContext context, PacingModel model) async {
    await TextDialog.showTextDialog(
      context,
      S.of(context).PacingOptionsView_Name,
      model.name,
      false,
      (value) async => context.read<PacingCubit>().edit(model.copyWith(name: value)),
    );
  }
}
