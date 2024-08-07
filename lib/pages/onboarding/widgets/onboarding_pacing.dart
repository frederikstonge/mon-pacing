import 'package:flutter/material.dart';

import '../../../components/custom_card/custom_card.dart';
import '../../../components/text_header/text_header.dart';
import '../../../cubits/settings/settings_state.dart';
import '../../../l10n/app_localizations.dart';
import 'onboarding_bottom_navigation.dart';

class OnboardingPacing extends StatelessWidget {
  final SettingsState state;
  final void Function(SettingsState model) edit;
  final void Function()? next;
  final void Function()? finish;
  final void Function()? previous;
  final void Function()? skip;

  const OnboardingPacing({
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
              // Padding(
              //   padding: const EdgeInsets.all(16.0),
              //   child: Text('Welcome', style: Theme.of(context).textTheme.headlineLarge),
              // ),
              // CustomCard(
              //   child: Column(
              //     mainAxisSize: MainAxisSize.min,
              //     children: [
              //       TextHeader(title: S.of(context).language),
              //       SettingsTile(
              //         leading: const Icon(Icons.language),
              //         title: DisplayLanguage(locale: Locale(state.language)),
              //         trailing: const Icon(Icons.chevron_right),
              //         onTap: () {
              //           BottomSheetDialog.showDialog(
              //             context: context,
              //             child: LanguageView(
              //               currentLocale: Locale(state.language),
              //               availableLocales: S.supportedLocales,
              //               onChanged: (locale) => context.read<SettingsCubit>().edit(state.copyWith(language: locale.toLanguageTag())),
              //             ),
              //           );
              //         },
              //       ),
              //     ],
              //   ),
              // ),
              // CustomCard(
              //   child: Column(
              //     mainAxisSize: MainAxisSize.min,
              //     children: [
              //       TextHeader(title: S.of(context).theme),
              //       SettingsTile(
              //         leading: const Icon(Icons.color_lens),
              //         title: Text(
              //           switch (state.theme) {
              //             ThemeType.light => S.of(context).light,
              //             ThemeType.dark => S.of(context).dark,
              //             ThemeType.lni => S.of(context).lni,
              //           },
              //         ),
              //         trailing: const Icon(Icons.chevron_right),
              //         onTap: () {
              //           BottomSheetDialog.showDialog(
              //             context: context,
              //             child: ThemeView(
              //               currentTheme: state.theme,
              //               onChanged: (theme) => context.read<SettingsCubit>().edit(state.copyWith(theme: theme)),
              //             ),
              //           );
              //         },
              //       ),
              //     ],
              //   ),
              // ),
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
