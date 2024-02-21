import 'package:flutter/material.dart';

class SliverScaffold extends StatelessWidget {
  final List<Widget> slivers;
  final Widget? floatingActionButton;
  final Alignment floatingActionButtonAlignment;
  final ScrollController? scrollController;
  final ScrollPhysics? scrollPhysics;

  const SliverScaffold({
    super.key,
    required this.slivers,
    this.floatingActionButton,
    this.floatingActionButtonAlignment = Alignment.bottomRight,
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
