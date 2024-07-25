import 'package:flutter/material.dart';

import '../../../cubits/settings/settings_state.dart';

class OnboardingImprovisation extends StatelessWidget {
  final SettingsState state;
  final void Function(SettingsState model) edit;

  const OnboardingImprovisation({
    super.key,
    required this.state,
    required this.edit,
  });

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
