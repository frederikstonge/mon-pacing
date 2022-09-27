import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/home_cubit.dart';
import '../pages/ibottom_nav_page.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key, required this.pages}) : super(key: key);
  final _pageController = PageController();
  final List<IBottomNavPage> pages;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: BlocBuilder<HomeCubit, int>(
          builder: (context, state) => AppBar(
            title: Text(pages.elementAt(state).title),
            actions: pages.elementAt(state).getActions(context),
          ),
        ),
      ),
      body: BlocListener<HomeCubit, int>(
        listener: (context, state) async {
          await _navigateToPage(state);
        },
        listenWhen: (previous, current) {
          return _pageController.page == _pageController.page?.toInt() && _pageController.page != current;
        },
        child: PageView(
          controller: _pageController,
          onPageChanged: (value) {
            context.read<HomeCubit>().setPage(value);
          },
          children: pages,
        ),
      ),
      floatingActionButton: BlocBuilder<HomeCubit, int>(
        builder: (context, state) => pages.elementAt(state).getFloatingActionButton(context) ?? Container(),
      ),
      bottomNavigationBar: BlocBuilder<HomeCubit, int>(
        builder: (context, state) => BottomNavigationBar(
            onTap: (value) async {
              context.read<HomeCubit>().setPage(value);
            },
            currentIndex: state,
            items: pages.map((p) => BottomNavigationBarItem(icon: p.icon, label: p.title)).toList()),
      ),
    );
  }

  _navigateToPage(int value) async {
    await _pageController.animateToPage(
      value,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOutQuint,
    );
  }
}
