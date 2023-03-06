import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings_ui/settings_ui.dart';

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
                  onPressed: (context) async => await _openPacingNamePopup(context, state.name),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _openPacingNamePopup(BuildContext context, String name) async {
    await TextDialog.showTextDialog(
      context,
      S.of(context).PacingOptionsView_Name,
      name,
      false,
      (value) async => context.read<PacingCubit>().editName(value),
    );
  }
}
