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
        return Scaffold(
          appBar: AppBar(),
          body: PageView(
            controller: controller,
            children: [
              OnboardingGeneral(
                state: state,
                edit: context.read<SettingsCubit>().edit,
              ),
              OnboardingPacing(
                state: state,
                edit: context.read<SettingsCubit>().edit,
              ),
              OnboardingImprovisation(
                state: state,
                edit: context.read<SettingsCubit>().edit,
              ),
              OnboardingMatch(
                state: state,
                edit: context.read<SettingsCubit>().edit,
              ),
              OnboardingPenalties(
                state: state,
                edit: context.read<SettingsCubit>().edit,
              ),
            ],
          ),
          bottomNavigationBar: Container(),
        );
      },
    );
  }

  void onFinish() {
    context.read<SettingsCubit>().edit(context.read<SettingsCubit>().state.copyWith(isOnboarded: true));
    context.go(Routes.pacings);
  }
}
