import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../components/bottom_sheet_dialog/bottom_sheet_appbar.dart';
import '../../../components/bottom_sheet_dialog/bottom_sheet_scaffold.dart';
import '../../../cubits/settings/settings_cubit.dart';
import '../../../cubits/settings/settings_state.dart';
import '../../../l10n/app_localizations.dart';
import '../../../models/theme_type.dart';

class ThemeView extends StatelessWidget {
  const ThemeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return BottomSheetScaffold(
          appBar: BottomSheetAppbar(title: S.of(context).theme),
          body: ListView(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: ListTile(
                  title: Text(
                    _getThemeString(context, state.theme),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: const Icon(Icons.check),
                ),
              ),
              ...ThemeType.values.where((element) => element != state.theme).map(
                    (e) => InkWell(
                      onTap: () {
                        context.read<SettingsCubit>().edit(state.copyWith(theme: e));
                        Navigator.of(context).pop();
                      },
                      child: ListTile(
                        title: Text(
                          _getThemeString(context, e),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
            ],
          ),
        );
      },
    );
  }

  String _getThemeString(BuildContext context, ThemeType theme) {
    return switch (theme) {
      ThemeType.light => S.of(context).light,
      ThemeType.dark => S.of(context).dark,
      ThemeType.lni => S.of(context).lni,
    };
  }
}
