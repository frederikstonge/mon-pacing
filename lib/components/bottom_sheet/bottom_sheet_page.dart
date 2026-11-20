import 'package:material_ui/material_ui.dart';

class BottomSheetPage extends Page<Object?> {
  const BottomSheetPage({
    required this.child,
    this.isScrollControlled = false,
    super.key,
    super.name,
    super.arguments,
  });

  final Widget child;
  final bool isScrollControlled;

  @override
  Route<Object?> createRoute(BuildContext context) {
    return ModalBottomSheetRoute<Object?>(
      builder: (_) => child,
      isScrollControlled: isScrollControlled,
      isDismissible: true,
      enableDrag: true,
      showDragHandle: true,
      useSafeArea: true,
      modalBarrierColor: Theme.of(context).colorScheme.onSurface.withAlpha(100),
      settings: this,
    );
  }
}
