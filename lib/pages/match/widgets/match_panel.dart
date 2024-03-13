import 'package:flutter/material.dart';
import 'package:sliding_up_panel2/sliding_up_panel2.dart';

import '../../../components/sliver_scaffold/sliver_scaffold.dart';

class MatchPanel extends StatefulWidget {
  final List<Widget> slivers;
  final PreferredSizeWidget panelHeader;
  final Widget panelBody;
  final ScrollController? scrollController;

  const MatchPanel({
    super.key,
    required this.slivers,
    required this.panelHeader,
    required this.panelBody,
    this.scrollController,
  });

  @override
  State<MatchPanel> createState() => _MatchPanelState();
}

class _MatchPanelState extends State<MatchPanel> with TickerProviderStateMixin {
  late final AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(vsync: this)..value = 1;
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomPadding =
        MediaQuery.of(context).viewInsets.bottom > 0 ? MediaQuery.of(context).viewInsets.bottom : MediaQuery.of(context).padding.bottom;
    return SlidingUpPanel(
      scrollController: widget.scrollController,
      body: SliverScaffold(
        slivers: [
          ...widget.slivers,
          SliverPadding(
            padding: EdgeInsets.only(bottom: widget.panelHeader.preferredSize.height + kMinInteractiveDimension),
          ),
        ],
      ),
      renderPanelSheet: false,
      onPanelSlide: (position) => animationController.value = 1 - position,
      margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      maxHeight: MediaQuery.of(context).size.height,
      minHeight: widget.panelHeader.preferredSize.height + kMinInteractiveDimension + bottomPadding,
      panelBuilder: () => BottomSheet(
        constraints: const BoxConstraints.expand(),
        animationController: BottomSheet.createAnimationController(this),
        dragHandleColor: Theme.of(context).colorScheme.onPrimary.withOpacity(0.4),
        backgroundColor: Theme.of(context).colorScheme.primary,
        onClosing: () {},
        builder: (context) => Padding(
          padding: EdgeInsets.only(
            left: 8.0,
            right: 8.0,
            bottom: bottomPadding + MediaQuery.of(context).padding.top,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
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
    );
  }
}
