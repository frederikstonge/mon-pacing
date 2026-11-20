import 'package:material_ui/material_ui.dart';

class BottomSheetPage extends Page<Object?> {
  const BottomSheetPage({required this.child, this.isScrollControlled = false, super.key, super.name, super.arguments});

  final Widget child;
  final bool isScrollControlled;

  @override
  Route<Object?> createRoute(BuildContext context) {
    return ModalBottomSheetRoute<Object?>(
      builder: (context) {
        final mediaQuery = MediaQuery.of(context);
        return Padding(
          padding: EdgeInsets.only(
            bottom: mediaQuery.viewInsets.bottom > 0 ? mediaQuery.viewInsets.bottom : mediaQuery.padding.bottom,
          ),
          child: child,
        );
      },
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
