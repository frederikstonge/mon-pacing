import 'package:flutter/material.dart';

class SliverLogoAppbar extends StatefulWidget {
  final String title;
  final double expandedHeight;

  const SliverLogoAppbar({
    super.key,
    required this.title,
    this.expandedHeight = 112,
  });

  @override
  State<SliverLogoAppbar> createState() => _SliverLogoAppbarState();
}

class _SliverLogoAppbarState extends State<SliverLogoAppbar> with TickerProviderStateMixin {
  static const toolbarHeight = kToolbarHeight + 8;
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
    return SliverAppBar.medium(
      title: Text(widget.title),
      centerTitle: true,
      expandedHeight: widget.expandedHeight,
      flexibleSpace: LayoutBuilder(builder: (context, constraints) {
        final opacity = (constraints.maxHeight - toolbarHeight) / toolbarHeight;
        animationController.value = opacity;
        return Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: toolbarHeight,
                    child: Image.asset(
                      'assets/lni-logo.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
            FadeTransition(
              opacity: animationController,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(widget.title, style: Theme.of(context).textTheme.titleLarge),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
