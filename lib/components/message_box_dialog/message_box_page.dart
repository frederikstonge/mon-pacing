import 'package:material_ui/material_ui.dart';

class MessageBoxPage extends Page<Object?> {
  const MessageBoxPage({required this.child, super.key, super.name, super.arguments});

  final Widget child;

  @override
  Route<Object?> createRoute(BuildContext context) {
    return DialogRoute<Object?>(
      context: context,
      builder: (_) => child,
      barrierDismissible: true,
      useSafeArea: true,
      barrierColor: Theme.of(context).colorScheme.onSurface.withAlpha(100),
      settings: this,
    );
  }
}
