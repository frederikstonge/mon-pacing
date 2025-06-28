import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../router/routes.dart';

class OnboardingPageView extends StatelessWidget {
  const OnboardingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: 'Welcome to Our App',
          body: 'Discover amazing features and functionalities.',
          image: Center(child: Icon(Icons.star, size: 100)),
        ),
        PageViewModel(
          title: 'Stay Connected',
          body: 'Connect with friends and family effortlessly.',
          image: Center(child: Icon(Icons.chat, size: 100)),
        ),
        PageViewModel(
          title: 'Get Started',
          body: "Let's dive in and explore the app!",
          image: Center(child: Icon(Icons.check_circle, size: 100)),
        ),
      ],
      onDone: () {
        context.goNamed(Routes.pacings);
      },
      done: const Text('Get Started'),
      next: const Text('Next'),
    );
  }
}
