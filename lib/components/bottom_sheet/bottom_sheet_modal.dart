import 'package:material_ui/material_ui.dart';

import 'bottom_sheet_content.dart';

class BottomSheetModal extends StatefulWidget {
  final Widget child;
  final VoidCallback onDismiss;
  final bool draggable;

  const BottomSheetModal({super.key, required this.child, required this.onDismiss, this.draggable = false});

  @override
  State<BottomSheetModal> createState() => _BottomSheetModalState();
}

class _BottomSheetModalState extends State<BottomSheetModal> with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<Offset> _positionAnimation;
  bool _isClosing = false;

  @override
  void initState() {
    super.initState();
    _animationController = BottomSheet.createAnimationController(this);
    _positionAnimation = Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.fastOutSlowIn,
        reverseCurve: Curves.easeIn,
      ),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _close() async {
    if (_isClosing) {
      return;
    }

    _isClosing = true;
    if (_animationController.value > 0) {
      await _animationController.animateBack(0);
    }
    if (mounted) {
      widget.onDismiss();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      children: [
        Positioned.fill(
          child: FadeTransition(
            opacity: _animationController,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: _close,
              child: ColoredBox(color: theme.colorScheme.onSurface.withAlpha(100)),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: SafeArea(
            bottom: false,
            child: SlideTransition(
              position: _positionAnimation,
              child: widget.draggable ? _buildDraggableSheet(context) : _buildBottomSheet(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomSheet() {
    return BottomSheet(
      animationController: _animationController,
      showDragHandle: true,
      onClosing: _close,
      builder: (context) => BottomSheetContent(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [Flexible(child: widget.child)],
        ),
      ),
    );
  }

  Widget _buildDraggableSheet(BuildContext context) {
    return NotificationListener<DraggableScrollableNotification>(
      onNotification: (notification) {
        if (notification.shouldCloseOnMinExtent && notification.extent <= notification.minExtent) {
          _close();
        }
        return false;
      },
      child: DraggableScrollableSheet(
        expand: false,
        minChildSize: 0.35,
        initialChildSize: 0.9,
        maxChildSize: 1,
        snap: true,
        snapSizes: const [0.6, 0.9, 1],
        shouldCloseOnMinExtent: true,
        builder: (context, scrollController) {
          return BottomSheet(
            enableDrag: false,
            onClosing: _close,
            builder: (context) => PrimaryScrollController(
              controller: scrollController,
              child: BottomSheetContent(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildDragHandle(context),
                    Flexible(child: widget.child),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildDragHandle(BuildContext context) {
    final theme = Theme.of(context);
    final handleSize = theme.bottomSheetTheme.dragHandleSize ?? const Size(32, 4);
    final handleColor =
        WidgetStateProperty.resolveAs(
          theme.bottomSheetTheme.dragHandleColor,
          const <WidgetState>{},
        ) ??
        theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.4);
    return SizedBox(
      height: kMinInteractiveDimension,
      child: Center(
        child: Container(
          width: handleSize.width,
          height: handleSize.height,
          decoration: BoxDecoration(
            color: handleColor,
            borderRadius: BorderRadius.circular(handleSize.height / 2),
          ),
        ),
      ),
    );
  }
}
