import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../components/bottom_sheet/bottom_sheet_dialog.dart';
import '../../components/buttons/loading_button.dart';
import '../../components/custom_tooltip/custom_tooltip.dart';
import '../../components/display_language/display_language.dart';
import '../../components/duration_picker/duration_picker.dart';
import '../../components/penalties_impact_type/penalties_impact_type_view.dart';
import '../../components/quantity_stepper/quantity_stepper_form_field.dart';
import '../../components/settings_tile/settings_tile.dart';
import '../../cubits/onboarding/onboarding_cubit.dart';
import '../../cubits/settings/settings_cubit.dart';
import '../../cubits/settings/settings_state.dart';
import '../../extensions/duration_extensions.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../models/constants.dart';
import '../../models/penalties_impact_type.dart';
import '../../router/routes.dart';
import '../settings/widgets/language_view.dart';

class OnboardingPageView extends StatefulWidget {
  const OnboardingPageView({super.key});

  @override
  State<OnboardingPageView> createState() => _OnboardingPageViewState();
}

class _OnboardingPageViewState extends State<OnboardingPageView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<IntroductionScreenState> introKey = GlobalKey<IntroductionScreenState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, settingsState) {
        return IntroductionScreen(
          key: introKey,
          controlsPadding: EdgeInsets.only(bottom: MediaQuery.viewPaddingOf(context).bottom, left: 8, right: 8),
          pages: [
            PageViewModel(
              decoration: PageDecoration(
                imageFlex: 1,
                bodyFlex: 2,
                footerFlex: 1,
                imagePadding: EdgeInsets.zero,
                imageAlignment: Alignment.topCenter,
                safeArea: MediaQuery.viewPaddingOf(context).bottom,
              ),
              image: Padding(
                padding: EdgeInsets.only(top: MediaQuery.viewPaddingOf(context).top),
                child: Center(
                  child: Transform(
                    alignment: FractionalOffset.center,
                    transform: Matrix4.rotationZ(-0.2),
                    child: Opacity(
                      opacity: 0.8,
                      child: Icon(
                        Icons.language,
                        size: MediaQuery.sizeOf(context).width / 2,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ),
              ),
              titleWidget: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(S.of(context).onboardingLanguageTitle, style: Theme.of(context).textTheme.headlineMedium),
                  const SizedBox(height: 8),
                  Text(S.of(context).onboardingLanguageDescription, style: Theme.of(context).textTheme.bodyLarge),
                ],
              ),
              bodyWidget: Column(
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
                ],
              ),
            ),
            PageViewModel(
              decoration: PageDecoration(
                imageFlex: 1,
                bodyFlex: 2,
                footerFlex: 1,
                imagePadding: EdgeInsets.zero,
                imageAlignment: Alignment.topCenter,
                safeArea: MediaQuery.viewPaddingOf(context).bottom,
              ),
              image: Padding(
                padding: EdgeInsets.only(top: MediaQuery.viewPaddingOf(context).top),
                child: Center(
                  child: Transform(
                    alignment: FractionalOffset.center,
                    transform: Matrix4.rotationZ(0.2),
                    child: Opacity(
                      opacity: 0.8,
                      child: Icon(
                        Icons.list,
                        size: MediaQuery.sizeOf(context).width / 2,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ),
              ),
              titleWidget: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(S.of(context).onboardingPacingsTitle, style: Theme.of(context).textTheme.headlineMedium),
                  const SizedBox(height: 8),
                  Text(S.of(context).onboardingPacingsDescription, style: Theme.of(context).textTheme.bodyLarge),
                  const SizedBox(height: 8),
                  Text(S.of(context).onboardingByDefault, style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
              bodyWidget: Column(
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
                            if (value != null) {
                              context.read<SettingsCubit>().edit(settingsState.copyWith(defaultNumberOfTeams: value));
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
            PageViewModel(
              decoration: PageDecoration(
                imageFlex: 1,
                bodyFlex: 2,
                footerFlex: 1,
                imagePadding: EdgeInsets.zero,
                imageAlignment: Alignment.topCenter,
                safeArea: MediaQuery.viewPaddingOf(context).bottom,
              ),
              image: Padding(
                padding: EdgeInsets.only(top: MediaQuery.viewPaddingOf(context).top),
                child: Center(
                  child: Transform(
                    alignment: FractionalOffset.center,
                    transform: Matrix4.rotationZ(-0.2),
                    child: Opacity(
                      opacity: 0.8,
                      child: Icon(
                        Icons.card_membership,
                        size: MediaQuery.sizeOf(context).width / 2,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ),
              ),
              titleWidget: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(S.of(context).onboardingImprovisationsTitle, style: Theme.of(context).textTheme.headlineMedium),
                  const SizedBox(height: 8),
                  Text(S.of(context).onboardingImprovisationsDescription, style: Theme.of(context).textTheme.bodyLarge),
                  const SizedBox(height: 8),
                  Text(S.of(context).onboardingByDefault, style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
              bodyWidget: Column(
                children: [
                  SettingsTile(
                    leading: const Icon(Icons.timer),
                    title: Text(S.of(context).improvisationDurationInSeconds),
                    subTitle: Text(
                      Duration(seconds: settingsState.defaultImprovisationDurationInSeconds).toImprovDuration(),
                    ),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () async {
                      final settingsCubit = context.read<SettingsCubit>();
                      final newDuration = await BottomSheetDialog.showDialog<Duration>(
                        context: context,
                        child: DurationPicker(
                          title: S.of(context).improvisationDurationInSeconds,
                          initialDuration: Duration(seconds: settingsState.defaultImprovisationDurationInSeconds),
                        ),
                      );

                      if (newDuration != null) {
                        settingsCubit.edit(
                          settingsState.copyWith(defaultImprovisationDurationInSeconds: newDuration.inSeconds),
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
                    subTitle: Text(Duration(seconds: settingsState.defaultHuddleTimerInSeconds).toImprovDuration()),
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
                        settingsCubit.edit(settingsState.copyWith(defaultHuddleTimerInSeconds: newDuration.inSeconds));
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
                    subTitle: Text(Duration(seconds: settingsState.defaultTimeBufferInSeconds).toImprovDuration()),
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
                        settingsCubit.edit(settingsState.copyWith(defaultTimeBufferInSeconds: newDuration.inSeconds));
                      }
                    },
                  ),
                ],
              ),
            ),
            PageViewModel(
              decoration: PageDecoration(
                imageFlex: 1,
                bodyFlex: 2,
                footerFlex: 1,
                imagePadding: EdgeInsets.zero,
                imageAlignment: Alignment.topCenter,
                safeArea: MediaQuery.viewPaddingOf(context).bottom,
              ),
              image: Padding(
                padding: EdgeInsets.only(top: MediaQuery.viewPaddingOf(context).top),
                child: Center(
                  child: Transform(
                    alignment: FractionalOffset.center,
                    transform: Matrix4.rotationZ(0.2),
                    child: Opacity(
                      opacity: 0.8,
                      child: Icon(
                        Icons.list_alt,
                        size: MediaQuery.sizeOf(context).width / 2,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ),
              ),
              titleWidget: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(S.of(context).onboardingMatchesTitle, style: Theme.of(context).textTheme.headlineMedium),
                  const SizedBox(height: 8),
                  Text(S.of(context).onboardingMatchesDescription, style: Theme.of(context).textTheme.bodyLarge),
                  const SizedBox(height: 8),
                  Text(S.of(context).onboardingByDefault, style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
              bodyWidget: Column(
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
                        context.read<SettingsCubit>().edit(settingsState.copyWith(defaultEnableStatistics: value));
                      },
                    ),
                  ),
                ],
              ),
            ),
            if (settingsState.defaultEnableStatistics) ...[
              PageViewModel(
                decoration: PageDecoration(
                  imageFlex: 1,
                  bodyFlex: 2,
                  footerFlex: 1,
                  imagePadding: EdgeInsets.zero,
                  imageAlignment: Alignment.topCenter,
                  safeArea: MediaQuery.viewPaddingOf(context).bottom,
                ),
                image: Padding(
                  padding: EdgeInsets.only(top: MediaQuery.viewPaddingOf(context).top),
                  child: Center(
                    child: Transform(
                      alignment: FractionalOffset.center,
                      transform: Matrix4.rotationZ(0.2),
                      child: Opacity(
                        opacity: 0.8,
                        child: Icon(
                          Icons.sports,
                          size: MediaQuery.sizeOf(context).width / 2,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ),
                ),
                titleWidget: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(S.of(context).onboardingPenaltiesTitle, style: Theme.of(context).textTheme.headlineMedium),
                    const SizedBox(height: 8),
                    Text(S.of(context).onboardingPenaltiesDescription, style: Theme.of(context).textTheme.bodyLarge),
                    const SizedBox(height: 8),
                    Text(S.of(context).onboardingByDefault, style: Theme.of(context).textTheme.bodySmall),
                  ],
                ),
                bodyWidget: Column(
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
            ],
          ],
          showBackButton: true,
          overrideNext: LoadingButton.filled(
            onPressed: () => introKey.currentState?.next(),
            child: Text(S.of(context).onboardingNext),
          ),
          overrideBack: LoadingButton.tonal(
            onPressed: () => introKey.currentState?.previous(),
            child: Text(S.of(context).onboardingPrevious),
          ),
          overrideDone: LoadingButton.filled(
            onPressed: () {
              context.read<OnboardingCubit>().finishOnboarding();
              context.goNamed(Routes.pacings);
            },
            child: Text(S.of(context).onboardingDone),
          ),
        );
      },
    );
  }
}
