import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haptic_feedback/haptic_feedback.dart';

import '../../components/bottom_sheet/bottom_sheet_dialog.dart';
import '../../components/buttons/loading_button.dart';
import '../../components/buttons/loading_icon_button.dart';
import '../../components/custom_card/custom_card.dart';
import '../../components/custom_tooltip/custom_tooltip.dart';
import '../../components/display_language/display_language.dart';
import '../../components/duration_picker/duration_picker.dart';
import '../../components/message_box_dialog/message_box_dialog.dart';
import '../../components/penalties_impact_type/penalties_impact_type_view.dart';
import '../../components/quantity_stepper/quantity_stepper_form_field.dart';
import '../../components/settings_tile/settings_tile.dart';
import '../../components/sliver_logo_appbar/sliver_logo_appbar.dart';
import '../../components/text_header/text_header.dart';
import '../../components/timer_banner/timer_banner.dart';
import '../../cubits/settings/settings_cubit.dart';
import '../../cubits/settings/settings_state.dart';
import '../../cubits/timer/timer_cubit.dart';
import '../../cubits/timer/timer_state.dart';
import '../../extensions/duration_extensions.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../models/constants.dart';
import '../../models/penalties_impact_type.dart';
import '../../models/theme_type.dart';
import '../../services/package_info_service.dart';
import 'widgets/improvisation_fields_order.dart';
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
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, settingsState) {
        return BlocBuilder<TimerCubit, TimerState>(
          builder: (context, timerState) {
            return Form(
              key: formKey,
              child: CustomScrollView(
                slivers: [
                  if (timerState.timer != null) ...[TimerBanner(timer: timerState.timer!)],
                  SliverLogoAppbar(
                    title: S.of(context).settings,
                    theme: settingsState.theme,
                    primary: timerState.timer == null,
                  ),

                  SliverList.list(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16, top: 16),
                        child: TextHeader(title: S.of(context).general),
                      ),
                      CustomCard(
                        child: Column(
                          children: [
                            SettingsTile(
                              leading: const Icon(Icons.language),
                              title: Text(S.of(context).language),
                              subTitle: DisplayLanguage(locale: Locale(settingsState.language)),
                              trailing: const Icon(Icons.chevron_right),
                              onTap: () {
                                BottomSheetDialog.showDialog(
                                  context: context,
                                  child: LanguageView(
                                    currentLocale: Locale(settingsState.language),
                                    availableLocales: S.supportedLocales,
                                    onChanged: (locale) => context.read<SettingsCubit>().edit(
                                      settingsState.copyWith(language: locale.toLanguageTag()),
                                    ),
                                  ),
                                );
                              },
                            ),
                            SettingsTile(
                              leading: const Icon(Icons.color_lens),
                              title: Text(S.of(context).theme),
                              subTitle: Text(switch (settingsState.theme) {
                                ThemeType.light => S.of(context).light,
                                ThemeType.dark => S.of(context).dark,
                                ThemeType.lni => S.of(context).lni,
                                ThemeType.ligma => S.of(context).ligma,
                              }),
                              trailing: const Icon(Icons.chevron_right),
                              onTap: () {
                                BottomSheetDialog.showDialog(
                                  context: context,
                                  child: ThemeView(
                                    currentTheme: settingsState.theme,
                                    onChanged: (theme) =>
                                        context.read<SettingsCubit>().edit(settingsState.copyWith(theme: theme)),
                                  ),
                                );
                              },
                            ),
                            SettingsTile(
                              leading: const Icon(Icons.screen_lock_portrait),
                              title: Row(
                                children: [
                                  Flexible(child: Text(S.of(context).enableWakelock)),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 4),
                                    child: CustomTooltip(tooltip: S.of(context).enableWakelockTooltip),
                                  ),
                                ],
                              ),
                              trailing: Switch(
                                value: settingsState.enableWakelock,
                                onChanged: (value) {
                                  context.read<SettingsCubit>().edit(settingsState.copyWith(enableWakelock: value));
                                },
                              ),
                            ),
                            SettingsTile(
                              leading: const Icon(Icons.vibration),
                              title: Text(S.of(context).enableHapticFeedback),
                              trailing: Switch(
                                value: settingsState.enableHapticFeedback,
                                onChanged: (value) {
                                  context.read<SettingsCubit>().edit(
                                    settingsState.copyWith(enableHapticFeedback: value),
                                  );
                                },
                              ),
                            ),
                            SettingsTile(
                              leading: const Icon(Icons.vibration),
                              title: Row(
                                children: [
                                  Flexible(child: Text(S.of(context).enableTimerHapticFeedback)),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 4),
                                    child: CustomTooltip(tooltip: S.of(context).timerHapticFeedbackTooltip),
                                  ),
                                ],
                              ),
                              trailing: Switch(
                                value: settingsState.enableTimerHapticFeedback,
                                onChanged: (value) {
                                  context.read<SettingsCubit>().edit(
                                    settingsState.copyWith(enableTimerHapticFeedback: value),
                                  );
                                },
                              ),
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
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      S.of(context).numberOfTeamsByDefault,
                                      style: Theme.of(context).textTheme.bodyLarge,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  QuantityStepperFormField(
                                    autovalidateMode: AutovalidateMode.onUserInteraction,
                                    initialValue: settingsState.defaultNumberOfTeams,
                                    onChanged: (value) {
                                      if (value != null && formKey.currentState!.validate()) {
                                        context.read<SettingsCubit>().edit(
                                          settingsState.copyWith(defaultNumberOfTeams: value),
                                        );
                                      }
                                    },
                                    minValue: Constants.minimumTeams,
                                    maxValue: Constants.maximumTeams,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
                        child: TextHeader(
                          title: S.of(context).improvisation,
                          tooltip: S.of(context).defaultImprovisationSettingsTooltip,
                        ),
                      ),
                      CustomCard(
                        child: Column(
                          children: [
                            SettingsTile(
                              leading: const Icon(Icons.timer),
                              title: Text(S.of(context).improvisationDurationInSeconds),
                              subTitle: Text(
                                Duration(
                                  seconds: settingsState.defaultImprovisationDurationInSeconds,
                                ).toImprovDuration(),
                              ),
                              trailing: const Icon(Icons.chevron_right),
                              onTap: () async {
                                final settingsCubit = context.read<SettingsCubit>();
                                final newDuration = await BottomSheetDialog.showDialog<Duration>(
                                  context: context,
                                  child: DurationPicker(
                                    title: S.of(context).improvisationDurationInSeconds,
                                    initialDuration: Duration(
                                      seconds: settingsState.defaultImprovisationDurationInSeconds,
                                    ),
                                  ),
                                );

                                if (newDuration != null) {
                                  settingsCubit.edit(
                                    settingsState.copyWith(
                                      defaultImprovisationDurationInSeconds: newDuration.inSeconds,
                                    ),
                                  );
                                }
                              },
                            ),
                            SettingsTile(
                              leading: const Icon(Icons.timer),
                              title: Row(
                                children: [
                                  Flexible(child: Text(S.of(context).huddleTimer)),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 4),
                                    child: CustomTooltip(tooltip: S.of(context).huddleTimerTooltip),
                                  ),
                                ],
                              ),
                              subTitle: Text(
                                Duration(seconds: settingsState.defaultHuddleTimerInSeconds).toImprovDuration(),
                              ),
                              trailing: const Icon(Icons.chevron_right),
                              onTap: () async {
                                final settingsCubit = context.read<SettingsCubit>();
                                final newDuration = await BottomSheetDialog.showDialog<Duration>(
                                  context: context,
                                  child: DurationPicker(
                                    title: S.of(context).huddleTimer,
                                    initialDuration: Duration(seconds: settingsState.defaultHuddleTimerInSeconds),
                                  ),
                                );

                                if (newDuration != null) {
                                  settingsCubit.edit(
                                    settingsState.copyWith(defaultHuddleTimerInSeconds: newDuration.inSeconds),
                                  );
                                }
                              },
                            ),
                            SettingsTile(
                              leading: const Icon(Icons.more_time),
                              title: Row(
                                children: [
                                  Flexible(child: Text(S.of(context).timeBuffer)),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 4),
                                    child: CustomTooltip(tooltip: S.of(context).timeBufferTooltip),
                                  ),
                                ],
                              ),
                              subTitle: Text(
                                Duration(seconds: settingsState.defaultTimeBufferInSeconds).toImprovDuration(),
                              ),
                              trailing: const Icon(Icons.chevron_right),
                              onTap: () async {
                                final settingsCubit = context.read<SettingsCubit>();
                                final newDuration = await BottomSheetDialog.showDialog<Duration>(
                                  context: context,
                                  child: DurationPicker(
                                    title: S.of(context).timeBuffer,
                                    initialDuration: Duration(seconds: settingsState.defaultTimeBufferInSeconds),
                                  ),
                                );

                                if (newDuration != null) {
                                  settingsCubit.edit(
                                    settingsState.copyWith(defaultTimeBufferInSeconds: newDuration.inSeconds),
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
                        // TODO: Translate
                        child: TextHeader(
                          title: 'Field Order',
                          tooltip: 'Change the order that improvisation fields will be displayed.',
                          trailing: LoadingIconButton(
                            icon: Icon(Icons.restore),
                            onPressed: () {
                              context.read<SettingsCubit>().edit(
                                settingsState.copyWith(
                                  improvisationFieldsOrder: SettingsState.defaultImprovisationFieldsOrder,
                                ),
                              );
                            },
                            tooltip: 'Reset to default order',
                          ),
                        ),
                      ),
                      CustomCard(
                        child: Column(
                          children: [
                            ImprovisationFieldsOrder(
                              fields: settingsState.improvisationFieldsOrder,
                              onChanged: (fields) => context.read<SettingsCubit>().edit(
                                settingsState.copyWith(improvisationFieldsOrder: fields),
                              ),
                              onDragStart: () {
                                context.read<SettingsCubit>().vibrate(HapticsType.selection);
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
                                  Flexible(child: Text(S.of(context).enableStatistics)),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 4),
                                    child: CustomTooltip(tooltip: S.of(context).enableStatisticsTooltip),
                                  ),
                                ],
                              ),
                              trailing: Switch(
                                value: settingsState.defaultEnableStatistics,
                                onChanged: (value) {
                                  context.read<SettingsCubit>().edit(
                                    settingsState.copyWith(defaultEnableStatistics: value),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
                        child: TextHeader(
                          title: S.of(context).penalty,
                          tooltip: S.of(context).defaultPenaltySettingsTooltip,
                        ),
                      ),
                      CustomCard(
                        child: Column(
                          children: [
                            SettingsTile(
                              leading: const Icon(Icons.sports),
                              title: Row(
                                children: [
                                  Flexible(child: Text(S.of(context).enablePenaltiesImpactPoints)),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 4),
                                    child: CustomTooltip(tooltip: S.of(context).penaltiesImpactPointsTooltip),
                                  ),
                                ],
                              ),
                              trailing: Switch(
                                value: settingsState.enableDefaultPenaltiesImpactPoints,
                                onChanged: (value) {
                                  context.read<SettingsCubit>().edit(
                                    settingsState.copyWith(enableDefaultPenaltiesImpactPoints: value),
                                  );
                                },
                              ),
                            ),
                            SettingsTile(
                              leading: const Icon(Icons.sports),
                              title: Text(S.of(context).penaltiesImpactType),
                              subTitle: Text(switch (settingsState.defaultPenaltiesImpactType) {
                                PenaltiesImpactType.addPoints => S.of(context).penaltiesImpactTypeAdd,
                                PenaltiesImpactType.substractPoints => S.of(context).penaltiesImpactTypeSubstract,
                              }),
                              trailing: const Icon(Icons.chevron_right),
                              onTap: () {
                                BottomSheetDialog.showDialog(
                                  context: context,
                                  child: PenaltiesImpactTypeView(
                                    currentPenaltiesImpactType: settingsState.defaultPenaltiesImpactType,
                                    onChanged: (penaltiesImpactType) => context.read<SettingsCubit>().edit(
                                      settingsState.copyWith(defaultPenaltiesImpactType: penaltiesImpactType),
                                    ),
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
                                      style: Theme.of(context).textTheme.bodyLarge,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  QuantityStepperFormField(
                                    autovalidateMode: AutovalidateMode.onUserInteraction,
                                    initialValue: settingsState.defaultPenaltiesRequiredToImpactPoints,
                                    onChanged: (value) {
                                      if (value != null && formKey.currentState!.validate()) {
                                        context.read<SettingsCubit>().edit(
                                          settingsState.copyWith(defaultPenaltiesRequiredToImpactPoints: value),
                                        );
                                      }
                                    },
                                    minValue: 1,
                                  ),
                                ],
                              ),
                            ),
                            const Divider(),
                            SettingsTile(
                              leading: const Icon(Icons.sports),
                              title: Row(
                                children: [
                                  Flexible(child: Text(S.of(context).enableMatchExpulsion)),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 4),
                                    child: CustomTooltip(tooltip: S.of(context).enableMatchExpulsionTooltip),
                                  ),
                                ],
                              ),
                              trailing: Switch(
                                value: settingsState.enableDefaultMatchExpulsion,
                                onChanged: (value) {
                                  context.read<SettingsCubit>().edit(
                                    settingsState.copyWith(enableDefaultMatchExpulsion: value),
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      S.of(context).penaltiesRequiredToExpel,
                                      style: Theme.of(context).textTheme.bodyLarge,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  QuantityStepperFormField(
                                    autovalidateMode: AutovalidateMode.onUserInteraction,
                                    initialValue: settingsState.defaultPenaltiesRequiredToExpel,
                                    onChanged: (value) {
                                      if (value != null && formKey.currentState!.validate()) {
                                        context.read<SettingsCubit>().edit(
                                          settingsState.copyWith(defaultPenaltiesRequiredToExpel: value),
                                        );
                                      }
                                    },
                                    minValue: 1,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: LoadingButton.filled(
                          child: Text(S.of(context).resetSettingsToDefault),
                          onPressed: () async {
                            final settingsCubit = context.read<SettingsCubit>();
                            final response = await MessageBoxDialog.questionShow(
                              context,
                              S
                                  .of(context)
                                  .areYouSureAction(action: S.of(context).resetSettingsToDefault.toLowerCase()),
                              S.of(context).confirm,
                              S.of(context).cancel,
                            );
                            if (response == true) {
                              settingsCubit.reset();
                            }
                          },
                        ),
                      ),

                      FutureBuilder(
                        future: context.read<PackageInfoService>().getAppVersion(),
                        builder: (context, snapshot) => snapshot.hasData
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  S.of(context).version(version: snapshot.data!),
                                  textAlign: TextAlign.center,
                                ),
                              )
                            : const SizedBox.shrink(),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
