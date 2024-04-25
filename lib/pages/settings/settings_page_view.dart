import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/actions/haptic_switch.dart';
import '../../components/bottom_sheet_dialog/bottom_sheet_dialog.dart';
import '../../components/custom_card/custom_card.dart';
import '../../components/display_language/display_language.dart';
import '../../components/duration_picker/duration_picker.dart';
import '../../components/penalties_impact_type/penalties_impact_type_view.dart';
import '../../components/quantity_stepper/quantity_stepper_form_field.dart';
import '../../components/settings_tile/settings_tile.dart';
import '../../components/sliver_logo_appbar/sliver_logo_appbar.dart';
import '../../components/sliver_scaffold/sliver_scaffold.dart';
import '../../components/text_header/text_header.dart';
import '../../components/timer_banner/timer_banner.dart';
import '../../components/tooltip/custom_tooltip.dart';
import '../../cubits/settings/settings_cubit.dart';
import '../../cubits/settings/settings_state.dart';
import '../../extensions/duration_extensions.dart';
import '../../l10n/app_localizations.dart';
import '../../models/penalties_impact_type.dart';
import '../../models/theme_type.dart';
import 'widgets/language_view.dart';
import 'widgets/theme_view.dart';

class SettingsPageView extends StatefulWidget {
  const SettingsPageView({super.key});

  @override
  State<SettingsPageView> createState() => _SettingsPageViewState();
}

class _SettingsPageViewState extends State<SettingsPageView> {
  late final GlobalKey<FormState> formKey;

  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverScaffold(
      appBar: SliverLogoAppbar(title: S.of(context).settings),
      slivers: [
        const TimerBanner(),
        BlocBuilder<SettingsCubit, SettingsState>(
          builder: (context, state) {
            return SliverList.list(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
                  child: TextHeader(title: S.of(context).general),
                ),
                CustomCard(
                  child: Column(
                    children: [
                      SettingsTile(
                        leading: const Icon(Icons.language),
                        title: Text(S.of(context).language),
                        subTitle: DisplayLanguage(locale: Locale(state.language)),
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
                      SettingsTile(
                        leading: const Icon(Icons.vibration),
                        title: Text(S.of(context).enableHapticFeedback),
                        trailing: HapticSwitch(
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
                            )
                          ],
                        ),
                        trailing: HapticSwitch(
                            value: state.enableTimerHapticFeedback,
                            onChanged: (value) {
                              context.read<SettingsCubit>().edit(state.copyWith(enableTimerHapticFeedback: value));
                            }),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
                  child: TextHeader(
                    title: S.of(context).pacing,
                    tooltip: S.of(context).defaultPacingSettingsTooltip,
                  ),
                ),
                CustomCard(
                  child: Column(
                    children: [
                      SettingsTile(
                        leading: const Icon(Icons.timer),
                        title: Text(S.of(context).improvisationDurationInSeconds),
                        subTitle: Text(Duration(seconds: state.defaultImprovisationDurationInSeconds).toImprovDuration()),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () async {
                          final settingsCubit = context.read<SettingsCubit>();
                          final newDuration = await BottomSheetDialog.showDialog<Duration>(
                            context: context,
                            child: DurationPicker(
                              title: S.of(context).improvisationDurationInSeconds,
                              initialDuration: Duration(seconds: state.defaultImprovisationDurationInSeconds),
                            ),
                          );

                          if (newDuration != null) {
                            settingsCubit.edit(state.copyWith(defaultImprovisationDurationInSeconds: newDuration.inSeconds));
                          }
                        },
                      ),
                      SettingsTile(
                        leading: const Icon(Icons.more_time),
                        title: Row(
                          children: [
                            Flexible(child: Text(S.of(context).enableTimeBuffer)),
                            Padding(
                              padding: const EdgeInsets.only(left: 4),
                              child: CustomTooltip(
                                tooltip: S.of(context).timeBufferTooltip,
                              ),
                            )
                          ],
                        ),
                        trailing: HapticSwitch(
                            value: state.enableDefaultTimeBuffer,
                            onChanged: (value) {
                              context.read<SettingsCubit>().edit(state.copyWith(enableDefaultTimeBuffer: value));
                            }),
                      ),
                      SettingsTile(
                        leading: const Icon(Icons.more_time),
                        title: Text(S.of(context).timeBuffer),
                        subTitle: Text(Duration(seconds: state.defaultTimeBufferInSeconds).toImprovDuration()),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () async {
                          final settingsCubit = context.read<SettingsCubit>();
                          final newDuration = await BottomSheetDialog.showDialog<Duration>(
                            context: context,
                            child: DurationPicker(
                              title: S.of(context).timeBuffer,
                              initialDuration: Duration(seconds: state.defaultTimeBufferInSeconds),
                            ),
                          );

                          if (newDuration != null) {
                            settingsCubit.edit(state.copyWith(defaultTimeBufferInSeconds: newDuration.inSeconds));
                          }
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
                  child: TextHeader(
                    title: S.of(context).match,
                    tooltip: S.of(context).defaultMatchSettingsTooltip,
                  ),
                ),
                CustomCard(
                  child: Column(
                    children: [
                      SettingsTile(
                        leading: const Icon(Icons.scoreboard),
                        title: Row(
                          children: [
                            Flexible(child: Text(S.of(context).enablePenaltiesImpactPoints)),
                            Padding(
                              padding: const EdgeInsets.only(left: 4),
                              child: CustomTooltip(
                                tooltip: S.of(context).penaltiesImpactPointsTooltip,
                              ),
                            )
                          ],
                        ),
                        trailing: HapticSwitch(
                            value: state.enableDefaultPenaltiesImpactPoints,
                            onChanged: (value) {
                              context.read<SettingsCubit>().edit(state.copyWith(enableDefaultPenaltiesImpactPoints: value));
                            }),
                      ),
                      SettingsTile(
                        leading: const Icon(Icons.sports),
                        title: Text(S.of(context).penaltiesImpactType),
                        subTitle: Text(
                          switch (state.defaultPenaltiesImpactType) {
                            PenaltiesImpactType.addPoints => S.of(context).penaltiesImpactTypeAdd,
                            PenaltiesImpactType.substractPoints => S.of(context).penaltiesImpactTypeSubstract,
                          },
                        ),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () {
                          BottomSheetDialog.showDialog(
                            context: context,
                            child: PenaltiesImpactTypeView(
                              currentPenaltiesImpactType: state.defaultPenaltiesImpactType,
                              onChanged: (penaltiesImpactType) =>
                                  context.read<SettingsCubit>().edit(state.copyWith(defaultPenaltiesImpactType: penaltiesImpactType)),
                            ),
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                S.of(context).penaltiesRequiredToImpactPoints,
                                style: Theme.of(context).textTheme.titleMedium,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Form(
                              key: formKey,
                              child: QuantityStepperFormField(
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                initialValue: state.defaultPenaltiesRequiredToImpactPoints,
                                onChanged: (value) {
                                  if (value != null && formKey.currentState!.validate()) {
                                    context.read<SettingsCubit>().edit(state.copyWith(defaultPenaltiesRequiredToImpactPoints: value));
                                  }
                                },
                                minValue: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
