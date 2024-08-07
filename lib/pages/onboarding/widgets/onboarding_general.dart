import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../components/bottom_sheet_dialog/bottom_sheet_dialog.dart';
import '../../../components/custom_card/custom_card.dart';
import '../../../components/display_language/display_language.dart';
import '../../../components/settings_tile/settings_tile.dart';
import '../../../components/text_header/text_header.dart';
import '../../../components/tooltip/custom_tooltip.dart';
import '../../../cubits/settings/settings_cubit.dart';
import '../../../cubits/settings/settings_state.dart';
import '../../../l10n/app_localizations.dart';
import '../../../models/theme_type.dart';
import '../../settings/widgets/language_view.dart';
import '../../settings/widgets/theme_view.dart';
import 'onboarding_bottom_navigation.dart';

class OnboardingGeneral extends StatelessWidget {
  final SettingsState state;
  final void Function(SettingsState model) edit;
  final void Function()? next;
  final void Function()? finish;
  final void Function()? previous;
  final void Function()? skip;

  const OnboardingGeneral({
    super.key,
    required this.state,
    required this.edit,
    this.next,
    this.finish,
    this.previous,
    this.skip,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        primary: false,
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('Welcome', style: Theme.of(context).textTheme.headlineLarge),
              ),
              CustomCard(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextHeader(title: S.of(context).language),
                    SettingsTile(
                      leading: const Icon(Icons.language),
                      title: DisplayLanguage(locale: Locale(state.language)),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        BottomSheetDialog.showDialog(
                          context: context,
                          child: LanguageView(
                            currentLocale: Locale(state.language),
                            availableLocales: S.supportedLocales,
                            onChanged: (locale) => context.read<SettingsCubit>().edit(state.copyWith(language: locale.toLanguageTag())),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              CustomCard(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextHeader(title: S.of(context).theme),
                    SettingsTile(
                      leading: const Icon(Icons.color_lens),
                      title: Text(
                        switch (state.theme) {
                          ThemeType.light => S.of(context).light,
                          ThemeType.dark => S.of(context).dark,
                          ThemeType.lni => S.of(context).lni,
                        },
                      ),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        BottomSheetDialog.showDialog(
                          context: context,
                          child: ThemeView(
                            currentTheme: state.theme,
                            onChanged: (theme) => context.read<SettingsCubit>().edit(state.copyWith(theme: theme)),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              CustomCard(
                child: Column(
                  children: [
                    TextHeader(title: "Vibration"),
                    SettingsTile(
                      leading: const Icon(Icons.vibration),
                      title: Text(S.of(context).enableHapticFeedback),
                      trailing: Switch(
                          value: state.enableHapticFeedback,
                          onChanged: (value) {
                            context.read<SettingsCubit>().edit(state.copyWith(enableHapticFeedback: value));
                          }),
                    ),
                    SettingsTile(
                      leading: const Icon(Icons.vibration),
                      title: Row(
                        children: [
                          Flexible(child: Text(S.of(context).enableTimerHapticFeedback)),
                          Padding(
                            padding: const EdgeInsets.only(left: 4),
                            child: CustomTooltip(
                              tooltip: S.of(context).timerHapticFeedbackTooltip,
                            ),
                          ),
                        ],
                      ),
                      trailing: Switch(
                          value: state.enableTimerHapticFeedback,
                          onChanged: (value) {
                            context.read<SettingsCubit>().edit(state.copyWith(enableTimerHapticFeedback: value));
                          }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: OnboardingBottomNavigation(
          next: next,
          finish: finish,
          previous: previous,
          skip: skip,
        ),
      ),
    );
  }
}
