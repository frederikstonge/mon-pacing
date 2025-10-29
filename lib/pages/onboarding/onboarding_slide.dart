import 'package:flutter/widgets.dart';

class OnboardingSlide extends StatelessWidget {
  final Widget icon;
  final Widget child;

  const OnboardingSlide({super.key, required this.icon, required this.child});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: Column(children: [icon, const SizedBox(height: 100), child]));
  }
}
