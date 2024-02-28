import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SliverScaffold extends StatelessWidget {
  final List<Widget> slivers;
  final Widget? floatingActionButton;
  final Alignment floatingActionButtonAlignment;
  final double floatingActionButtonHeight;
  final ScrollController? scrollController;
  final ScrollPhysics? scrollPhysics;

  const SliverScaffold({
    super.key,
    required this.slivers,
    this.floatingActionButton,
    this.floatingActionButtonAlignment = Alignment.bottomRight,
    this.floatingActionButtonHeight = 62,
    this.scrollController,
    this.scrollPhysics,
  });

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Stack(
          alignment: floatingActionButtonAlignment,
          children: [
            CustomScrollView(
              controller: scrollController,
              physics: scrollPhysics,
              slivers: [
                ...slivers,
                if (floatingActionButton != null) ...[
                  SliverPadding(
                    padding: EdgeInsets.only(top: 16, bottom: floatingActionButtonHeight),
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
