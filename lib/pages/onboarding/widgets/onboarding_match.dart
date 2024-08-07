import 'package:flutter/material.dart';

import '../../../cubits/settings/settings_state.dart';
import 'onboarding_bottom_navigation.dart';

class OnboardingMatch extends StatelessWidget {
  final SettingsState state;
  final void Function(SettingsState model) edit;
  final void Function()? next;
  final void Function()? finish;
  final void Function()? previous;
  final void Function()? skip;

  const OnboardingMatch({
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
