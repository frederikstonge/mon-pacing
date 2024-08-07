import 'package:flutter/material.dart';

import '../../../components/actions/loading_button.dart';
import '../../../components/actions/loading_icon_button.dart';

class OnboardingBottomNavigation extends StatelessWidget {
  final void Function()? next;
  final void Function()? finish;
  final void Function()? previous;
  final void Function()? skip;

  const OnboardingBottomNavigation({
    super.key,
    required this.next,
    required this.finish,
    required this.previous,
    required this.skip,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kBottomNavigationBarHeight,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: NavigationToolbar(
            leading: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (previous != null) ...[
                  LoadingIconButton.filled(
                    onPressed: previous,
                    icon: const Icon(Icons.arrow_back),
                  ),
                ],
              ],
            ),
            trailing: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (skip != null) ...[
                  LoadingButton.filled(
                    onPressed: skip,
                    child: const Text('Skip'),
                  ),
                ],
                if (next != null) ...[
                  LoadingIconButton.filled(
                    onPressed: next,
                    icon: const Icon(Icons.arrow_forward),
                  ),
                ],
                if (finish != null) ...[
                  LoadingButton.filled(
                    onPressed: finish,
                    child: const Text('Finish'),
                  ),
                ],
              ],
            )),
      ),
    );
  }
}
