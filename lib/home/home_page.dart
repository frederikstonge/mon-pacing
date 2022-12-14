import 'package:flutter/material.dart';
import 'ibottom_nav_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.pages}) : super(key: key);

  final List<IBottomNavPage> pages;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _pageController = PageController();
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pages.elementAt(_page).title),
        actions: widget.pages.elementAt(_page).getActions(context),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (value) {
          setState(() {
            _page = value;
          });
        },
        children: widget.pages,
      ),
      floatingActionButton: widget.pages.elementAt(_page).getFloatingActionButton(context),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              _page = value;
            });

            _pageController.jumpToPage(value);
          },
          currentIndex: _page,
          items: widget.pages.map((p) => BottomNavigationBarItem(icon: p.icon, label: p.title)).toList()),
    );
  }
}
