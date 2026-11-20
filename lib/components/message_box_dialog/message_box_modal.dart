import 'package:material_ui/material_ui.dart';

class MessageBoxModal extends StatelessWidget {
  final Widget child;
  final VoidCallback onDismiss;

  const MessageBoxModal({super.key, required this.child, required this.onDismiss});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.onSurface.withAlpha(100),
      child: Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(behavior: HitTestBehavior.opaque, onTap: onDismiss),
          ),
          Center(child: child),
        ],
      ),
    );
  }
}
