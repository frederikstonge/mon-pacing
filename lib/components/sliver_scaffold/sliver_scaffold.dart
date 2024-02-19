import 'package:flutter/material.dart';

class SliverScaffold extends StatelessWidget {
  final List<Widget> slivers;
  const SliverScaffold({
    super.key,
    required this.slivers,
  });

  @override
  Widget build(BuildContext context) => SafeArea(
        child: CustomScrollView(
          slivers: [
            ...slivers,
          ],
        ),
      );
}
