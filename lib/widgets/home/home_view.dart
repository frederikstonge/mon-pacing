import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_cubit.dart';
import 'ibottom_nav_page.dart';

class HomeView extends StatefulWidget {
  final List<IBottomNavPage> pages;

  const HomeView({super.key, required this.pages});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final selectedPage = context.select((HomeCubit cubit) => cubit.state);
    return BlocListener<HomeCubit, int>(
      listener: (context, state) {
        if (_pageController.hasClients && _pageController.page == _pageController.page?.roundToDouble() && _pageController.page != state) {
          _pageController.jumpToPage(state);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.pages.elementAt(selectedPage).title, overflow: TextOverflow.ellipsis),
          actions: widget.pages.elementAt(selectedPage).getActions(context),
        ),
        body: PageView(
          controller: _pageController,
          onPageChanged: (value) {
            context.read<HomeCubit>().setPage(value);
          },
          children: widget.pages,
        ),
        floatingActionButton: widget.pages.elementAt(selectedPage).getFloatingActionButton(context),
        bottomNavigationBar: BottomNavigationBar(
            onTap: (value) {
              var cubit = context.read<HomeCubit>();
              cubit.setPage(value);
            },
            currentIndex: selectedPage,
            items: widget.pages
                .map((p) => BottomNavigationBarItem(
                      icon: p.icon,
                      label: p.title,
                    ))
                .toList()),
      ),
    );
  }
}
