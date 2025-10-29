import 'package:flutter/material.dart';

class OnboardingSlide extends StatelessWidget {
  final IconData icon;
  final bool iconLeaningLeft;
  final String title;
  final String subTitle;
  final String? description;
  final Widget child;

  const OnboardingSlide({
    super.key,
    required this.icon,
    required this.iconLeaningLeft,
    required this.title,
    required this.subTitle,
    this.description,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Transform(
              alignment: FractionalOffset.center,
              transform: Matrix4.rotationZ(iconLeaningLeft ? -0.2 : 0.2),
              child: Opacity(
                opacity: 0.2,
                child: Icon(
                  icon,
                  size: MediaQuery.sizeOf(context).width / 2,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(title, style: Theme.of(context).textTheme.headlineMedium),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(subTitle, style: Theme.of(context).textTheme.bodyLarge),
          ),
          const SizedBox(height: 8),
          if (description != null) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(description!, style: Theme.of(context).textTheme.bodySmall),
            ),
            const SizedBox(height: 8),
          ],
          child,
        ],
      ),
    );
  }
}
