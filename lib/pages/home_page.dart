import 'package:flutter/material.dart';
import '../views/home_view.dart';
import 'ibottom_nav_page.dart';

class HomePage extends StatelessWidget {
  final List<IBottomNavPage> pages;
  const HomePage({super.key, required this.pages});

  @override
  Widget build(BuildContext context) {
    return HomeView(pages: pages);
  }
}
