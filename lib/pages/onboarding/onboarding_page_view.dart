import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../cubits/settings/settings_cubit.dart';
import '../../cubits/settings/settings_state.dart';
import '../../router/routes.dart';
import 'widgets/onboarding_general.dart';
import 'widgets/onboarding_improvisation.dart';
import 'widgets/onboarding_match.dart';
import 'widgets/onboarding_pacing.dart';
import 'widgets/onboarding_penalties.dart';

class OnboardingPageView extends StatefulWidget {
  const OnboardingPageView({super.key});

  @override
  State<OnboardingPageView> createState() => _OnboardingPageViewState();
}

class _OnboardingPageViewState extends State<OnboardingPageView> {
  static Duration transitionDuration = const Duration(milliseconds: 200);
  static Curve transitionCurve = Curves.linear;
  late final PageController controller;

  @override
  void initState() {
    controller = PageController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return Stack(
          children: [
            Container(color: Theme.of(context).colorScheme.primary),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.secondary.withOpacity(0.0),
                    Theme.of(context).colorScheme.secondary.withOpacity(0.5),
                    Theme.of(context).colorScheme.secondary,
                  ],
                  begin: FractionalOffset.topLeft,
                  end: FractionalOffset.bottomRight,
                  stops: const [0.0, 0.5, 0.7],
                  tileMode: TileMode.clamp,
                ),
              ),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: PageView(
                  controller: controller,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    OnboardingGeneral(
                      state: state,
                      edit: context.read<SettingsCubit>().edit,
                      next: () => nextPage(),
                      skip: () => onFinish(),
                    ),
                    OnboardingPacing(
                      state: state,
                      edit: context.read<SettingsCubit>().edit,
                      next: () => nextPage(),
                      previous: () => previousPage(),
                      skip: () => onFinish(),
                    ),
                    OnboardingImprovisation(
                      state: state,
                      edit: context.read<SettingsCubit>().edit,
                      next: () => nextPage(),
                      previous: () => previousPage(),
                      skip: () => onFinish(),
                    ),
                    OnboardingMatch(
                      state: state,
                      edit: context.read<SettingsCubit>().edit,
                      next: () => nextPage(),
                      previous: () => previousPage(),
                      skip: () => onFinish(),
                    ),
                    OnboardingPenalties(
                      state: state,
                      edit: context.read<SettingsCubit>().edit,
                      finish: () => onFinish(),
                      previous: () => previousPage(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void nextPage() {
    controller.nextPage(duration: transitionDuration, curve: transitionCurve);
  }

  void previousPage() {
    controller.previousPage(duration: transitionDuration, curve: transitionCurve);
  }

  void onFinish() {
    context.read<SettingsCubit>().edit(context.read<SettingsCubit>().state.copyWith(isOnboarded: true));
    context.goNamed(Routes.pacings);
  }
}
