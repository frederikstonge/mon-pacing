import 'package:flutter/material.dart';
import 'package:sliding_up_panel2/sliding_up_panel2.dart';

class MatchPanel extends StatefulWidget {
  final Widget body;
  final PreferredSizeWidget panelHeader;
  final Widget panelBody;

  const MatchPanel({
    super.key,
    required this.body,
    required this.panelHeader,
    required this.panelBody,
  });

  @override
  State<MatchPanel> createState() => _MatchPanelState();
}

class _MatchPanelState extends State<MatchPanel> with TickerProviderStateMixin {
  late final AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).viewInsets.bottom > 0
        ? MediaQuery.of(context).viewInsets.bottom
        : MediaQuery.of(context).padding.bottom;
    return SlidingUpPanel(
      body: widget.body,
      renderPanelSheet: false,
      onPanelSlide: (position) => animationController.value = 1 - position,
      margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      maxHeight: MediaQuery.of(context).size.height,
      minHeight: widget.panelHeader.preferredSize.height +
          kMinInteractiveDimension +
          bottomPadding,
      panelBuilder: () => BottomSheet(
        constraints: const BoxConstraints.expand(),
        animationController: BottomSheet.createAnimationController(this),
        dragHandleColor:
            Theme.of(context).colorScheme.onPrimary.withOpacity(0.4),
        backgroundColor: Theme.of(context).colorScheme.primary,
        onClosing: () {},
        builder: (context) => Padding(
          padding: EdgeInsets.only(
              bottom: bottomPadding + MediaQuery.of(context).padding.top),
          child: DefaultTextStyle.merge(
            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: widget.panelHeader.preferredSize.height,
                  child: widget.panelHeader,
                ),
                SizeTransition(
                  sizeFactor: animationController,
                  child: SizedBox(
                    height: bottomPadding,
                  ),
                ),
                widget.panelBody,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
