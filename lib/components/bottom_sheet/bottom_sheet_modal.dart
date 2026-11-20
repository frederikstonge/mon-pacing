import 'package:material_ui/material_ui.dart';

import 'bottom_sheet_content.dart';

class BottomSheetModal extends StatefulWidget {
  final Widget child;
  final VoidCallback onDismiss;

  const BottomSheetModal({super.key, required this.child, required this.onDismiss});

  @override
  State<BottomSheetModal> createState() => _BottomSheetModalState();
}

class _BottomSheetModalState extends State<BottomSheetModal> with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  bool _isClosing = false;

  @override
  void initState() {
    super.initState();
    _animationController = BottomSheet.createAnimationController(this);
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _close() {
    if (!_isClosing) {
      _isClosing = true;
      widget.onDismiss();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: theme.colorScheme.onSurface.withAlpha(100),
      child: Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(behavior: HitTestBehavior.opaque, onTap: _close),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: BottomSheet(
              animationController: _animationController,
              showDragHandle: true,
              onClosing: _close,
              builder: (context) => BottomSheetContent(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [Flexible(child: widget.child)],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
