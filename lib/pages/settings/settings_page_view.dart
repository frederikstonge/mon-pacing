import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/bottom_sheet_dialog/bottom_sheet_dialog.dart';
import '../../components/custom_card/custom_card.dart';
import '../../components/display_language/display_language.dart';
import '../../components/duration_picker/duration_picker.dart';
import '../../components/settings_tile/settings_tile.dart';
import '../../components/sliver_logo_appbar/sliver_logo_appbar.dart';
import '../../components/sliver_scaffold/sliver_scaffold.dart';
import '../../components/text_header/text_header.dart';
import '../../cubits/settings/settings_cubit.dart';
import '../../cubits/settings/settings_state.dart';
import '../../extensions/duration_extensions.dart';
import '../../l10n/app_localizations.dart';
import '../../models/theme_type.dart';
import 'widgets/language_view.dart';
import 'widgets/theme_view.dart';

class SettingsPageView extends StatelessWidget {
  const SettingsPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverScaffold(
      slivers: [
        SliverLogoAppbar(title: S.of(context).settings),
        BlocBuilder<SettingsCubit, SettingsState>(
          builder: (context, state) {
            return SliverList.list(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: CustomCard(
                    child: Column(
                      children: [
                        TextHeader(title: S.of(context).general),
                        SettingsTile(
                          leading: const Icon(Icons.language),
                          title: Text(S.of(context).language),
                          subTitle: DisplayLanguage(locale: Locale(state.language)),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () async {
                            await BottomSheetDialog.showDialog(
                              context: context,
                              child: const LanguageView(),
                            );
                          },
                        ),
                        SettingsTile(
                          leading: const Icon(Icons.color_lens),
                          title: Text(S.of(context).theme),
                          subTitle: Text(
                            switch (state.theme) {
                              ThemeType.light => S.of(context).light,
                              ThemeType.dark => S.of(context).dark,
                              ThemeType.lni => S.of(context).lni,
                            },
                          ),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () async {
                            await BottomSheetDialog.showDialog(
                              context: context,
                              child: const ThemeView(),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: CustomCard(
                    child: Column(
                      children: [
                        TextHeader(
                          title: S.of(context).defaultTimeBuffer,
                          tooltip: S.of(context).timeBufferTooltip,
                        ),
                        SettingsTile(
                          leading: const Icon(Icons.timer),
                          title: Text(S.of(context).enableDefaultTimeBuffer),
                          trailing: Switch(
                              value: state.enableDefaultTimeBuffer,
                              onChanged: (value) {
                                context.read<SettingsCubit>().edit(state.copyWith(enableDefaultTimeBuffer: value));
                              }),
                        ),
                        SettingsTile(
                          leading: const Icon(Icons.timer_outlined),
                          title: Text(S.of(context).defaultTimeBuffer),
                          subTitle: Text(Duration(seconds: state.defaultTimeBufferInSeconds).toImprovDuration()),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () async {
                            await BottomSheetDialog.showDialog(
                              context: context,
                              child: DurationPicker(
                                title: S.of(context).defaultTimeBuffer,
                                initialDuration: Duration(seconds: state.defaultTimeBufferInSeconds),
                                onSave: (value) => context.read<SettingsCubit>().edit(state.copyWith(defaultTimeBufferInSeconds: value.inSeconds)),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
