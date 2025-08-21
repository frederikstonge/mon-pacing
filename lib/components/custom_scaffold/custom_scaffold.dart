import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;
  final NestedScrollViewHeaderSliversBuilder headerSliverBuilder;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final ScrollController? scrollController;
  final ScrollPhysics? scrollPhysics;

  const CustomScaffold({
    super.key,
    required this.body,
    required this.headerSliverBuilder,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.scrollController,
    this.scrollPhysics,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
    floatingActionButtonLocation: floatingActionButtonLocation,
    floatingActionButton: floatingActionButton,
    body: NestedScrollView(
      controller: scrollController,
      physics: scrollPhysics,
      headerSliverBuilder: headerSliverBuilder,
      body: body,
    ),
  );
}
