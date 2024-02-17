import 'package:flutter/material.dart';

class SliverScaffold extends StatelessWidget {
  final Widget appBar;
  final List<Widget> slivers;
  const SliverScaffold({
    super.key,
    required this.appBar,
    required this.slivers,
  });

  @override
  Widget build(BuildContext context) => SafeArea(
        child: CustomScrollView(
          slivers: [
            appBar,
            ...slivers,
          ],
        ),
      );
}
