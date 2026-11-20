import 'package:material_ui/material_ui.dart';

class BottomSheetContent extends StatelessWidget {
  final Widget child;

  const BottomSheetContent({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final bottomPadding = mediaQuery.viewInsets.bottom > 0 ? mediaQuery.viewInsets.bottom : mediaQuery.padding.bottom;
    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [Flexible(child: child)],
      ),
    );
  }
}
