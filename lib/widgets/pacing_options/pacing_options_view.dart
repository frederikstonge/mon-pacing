import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings_ui/settings_ui.dart';

import '../../dialogs/duration_dialog.dart';
import '../../helpers/duration_helper.dart';
import '../pacing/pacing_cubit.dart';
import '../../dialogs/text_dialog.dart';
import '../../generated/l10n.dart';

import '../../models/pacing_model.dart';

class PacingOptionsView extends StatelessWidget {
  const PacingOptionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PacingCubit, PacingModel>(
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).PacingOptionsView_Title(state.name), overflow: TextOverflow.ellipsis),
        ),
        body: SettingsList(
          sections: [
            SettingsSection(
              title: Text(S.of(context).PacingOptionsView_Pacing),
              tiles: [
                SettingsTile(
                  title: Text(S.of(context).PacingOptionsView_Name, overflow: TextOverflow.ellipsis),
                  value: Text(state.name),
                  onPressed: (context) async => await _openPacingNamePopup(context, state),
                ),
                SettingsTile.switchTile(
                  initialValue: state.enablePaddingDuration,
                  onToggle: (value) => context.read<PacingCubit>().edit(state.copyWith(enablePaddingDuration: value)),
                  title: Text(S.of(context).PacingOptionsView_EnablePaddingDuration),
                  description: Text(S.of(context).PacingOptionsView_EnablePaddingDurationDescription),
                ),
                SettingsTile(
                  title: Text(S.of(context).PacingOptionsView_PaddingDuration),
                  value: Text(DurationHelper.getDurationString(state.paddingDuration)),
                  onPressed: (context) async {
                    await DurationDialog.showDurationDialog(
                      context,
                      state.paddingDuration,
                      (value) => context.read<PacingCubit>().edit(state.copyWith(paddingDuration: value)),
                    );
                  },
                )
              ],
            ),
          ],
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
