import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:haptic_feedback/haptic_feedback.dart';

import '../../components/bottom_sheet/bottom_sheet_dialog.dart';
import '../../components/custom_card/custom_card.dart';
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
import '../settings/widgets/improvisation_fields_order.dart';
import '../settings/widgets/language_view.dart';
import 'onboarding_slide.dart';

class OnboardingPageView extends StatefulWidget {
  const OnboardingPageView({super.key});

  @override
  State<OnboardingPageView> createState() => _OnboardingPageViewState();
}

class _OnboardingPageViewState extends State<OnboardingPageView> {
  final GlobalKey<FormState> pacingsFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> penaltiesFormKey = GlobalKey<FormState>();

  late final PageController _pageController;

  int index = 0;

  bool get isPacingsValid => index != 1 || pacingsFormKey.currentState?.validate() == true;

  bool get isPenaltiesValid => index != 5 || penaltiesFormKey.currentState?.validate() == true;

  @override
  void initState() {
    _pageController = PageController(initialPage: index);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, settingsState) {
        return Scaffold(
          body: SafeArea(
            child: PageView(
              controller: _pageController,
              onPageChanged: (value) {
                setState(() {
                  index = value;
                });
              },
              physics: NeverScrollableScrollPhysics(),
              children: [
                OnboardingSlide(
                  iconLeaningLeft: true,
                  icon: Icons.language,
                  title: S.of(context).onboardingLanguageTitle,
                  subTitle: S.of(context).onboardingLanguageDescription,
                  child: CustomCard(
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
                      ],
                    ),
                  ),
                ),
                OnboardingSlide(
                  iconLeaningLeft: false,
                  icon: Icons.list,
                  title: S.of(context).onboardingPacingsTitle,
                  subTitle: S.of(context).onboardingPacingsDescription,
                  description: S.of(context).onboardingByDefault,
                  child: CustomCard(
                    child: Form(
                      key: pacingsFormKey,
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
                                    if (value != null && pacingsFormKey.currentState!.validate()) {
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
                  ),
                ),
                OnboardingSlide(
                  iconLeaningLeft: true,
                  icon: Icons.card_membership,
                  title: S.of(context).onboardingImprovisationsTitle,
                  subTitle: S.of(context).onboardingImprovisationsDescription,
                  description: S.of(context).onboardingByDefault,
                  child: CustomCard(
                    child: Column(
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
                ),
                OnboardingSlide(
                  iconLeaningLeft: false,
                  icon: Icons.card_membership,
                  title: S.of(context).onboardingImprovisationFieldsOrderTitle,
                  subTitle: S.of(context).onboardingImprovisationFieldsOrderDescription,
                  description: S.of(context).onboardingByDefault,
                  child: CustomCard(
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
                ),
                OnboardingSlide(
                  iconLeaningLeft: true,
                  icon: Icons.list_alt,
                  title: S.of(context).onboardingMatchesTitle,
                  subTitle: S.of(context).onboardingMatchesDescription,
                  description: S.of(context).onboardingByDefault,
                  child: CustomCard(
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
                ),
                if (settingsState.defaultEnableStatistics) ...[
                  OnboardingSlide(
                    iconLeaningLeft: false,
                    icon: Icons.sports,
                    title: S.of(context).onboardingPenaltiesTitle,
                    subTitle: S.of(context).onboardingPenaltiesDescription,
                    description: S.of(context).onboardingByDefault,
                    child: CustomCard(
                      child: Form(
                        key: penaltiesFormKey,
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
                                      if (value != null && penaltiesFormKey.currentState!.validate()) {
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
                                      if (value != null && penaltiesFormKey.currentState!.validate()) {
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
                    ),
                  ),
                ],
              ],
            ),
          ),
          persistentFooterDecoration: const BoxDecoration(),
          persistentFooterButtons: [
            Stack(
              alignment: Alignment.center,
              children: [
                DotsIndicator(
                  dotsCount: settingsState.defaultEnableStatistics ? 6 : 5,
                  position: index.toDouble(),
                  decorator: DotsDecorator(
                    size: const Size.square(9.0),
                    activeSize: const Size(18.0, 9.0),
                    activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (index != 0) ...[
                      TextButton(
                        onPressed: () {
                          if (!isPacingsValid || !isPenaltiesValid) {
                            return;
                          }

                          _pageController.previousPage(duration: Duration(milliseconds: 200), curve: Curves.bounceIn);
                        },
                        child: Text(S.of(context).onboardingPrevious),
                      ),
                    ] else ...[
                      const SizedBox.shrink(),
                    ],
                    if (index != (settingsState.defaultEnableStatistics ? 5 : 4)) ...[
                      TextButton(
                        onPressed: () {
                          if (!isPacingsValid || !isPenaltiesValid) {
                            return;
                          }

                          _pageController.nextPage(duration: Duration(milliseconds: 200), curve: Curves.bounceIn);
                        },
                        child: Text(S.of(context).onboardingNext),
                      ),
                    ] else ...[
                      TextButton(
                        onPressed: () {
                          if (!isPacingsValid || !isPenaltiesValid) {
                            return;
                          }

                          context.read<OnboardingCubit>().finishOnboarding();
                          context.goNamed(Routes.pacings);
                        },
                        child: Text(S.of(context).onboardingDone),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
