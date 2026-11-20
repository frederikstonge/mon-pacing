import 'dart:math' as math;

import 'package:material_ui/material_ui.dart';

class MessageBoxPage extends Page<Object?> {
  const MessageBoxPage({required this.child, super.key, super.name, super.arguments});

  final Widget child;

  @override
  Route<Object?> createRoute(BuildContext context) {
    return DialogRoute<Object?>(
      context: context,
      builder: (context) {
        final padding = MediaQuery.paddingOf(context);
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: math.max(padding.left, padding.right),
            vertical: math.max(padding.top, padding.bottom),
          ),
          child: child,
        );
      },
      barrierDismissible: true,
      useSafeArea: false,
      barrierColor: Theme.of(context).colorScheme.onSurface.withAlpha(100),
      settings: this,
    );
  }
}
