import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SliverScaffold extends StatelessWidget {
  final List<Widget> slivers;
  final Widget? banner;
  final Widget? appBar;
  final Widget? floatingActionButton;
  final Alignment floatingActionButtonAlignment;
  final double floatingActionButtonHeight;
  final ScrollController? scrollController;
  final ScrollPhysics? scrollPhysics;

  const SliverScaffold({
    super.key,
    required this.slivers,
    this.banner,
    this.appBar,
    this.floatingActionButton,
    this.floatingActionButtonAlignment = Alignment.bottomRight,
    this.floatingActionButtonHeight = 46,
    this.scrollController,
    this.scrollPhysics,
  });

  @override
  Widget build(BuildContext context) => SafeArea(
        top: false,
        child: Stack(
          alignment: floatingActionButtonAlignment,
          children: [
            CustomScrollView(
              controller: scrollController,
              physics: scrollPhysics,
              slivers: [
                if (banner != null) ...[
                  banner!,
                ],
                if (appBar != null) ...[
                  appBar!,
                ],
                ...slivers,
                if (floatingActionButton != null) ...[
                  SliverPadding(
                    padding: EdgeInsets.only(top: 16 * 2, bottom: floatingActionButtonHeight),
                  ),
                ],
              ],
            ),
            if (floatingActionButton != null) ...[
              Padding(
                padding: const EdgeInsets.all(16),
                child: floatingActionButton,
              ),
            ],
          ],
        ),
      );
}
