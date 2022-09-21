import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/home_cubit.dart';
import '../pages/ibottom_nav_page.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key, required this.pages}) : super(key: key);

  final List<IBottomNavPage> pages;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, int>(
      builder: (context, state) {
        var pageController = PageController(initialPage: state);
        return Scaffold(
          appBar: AppBar(
            title: Text(pages.elementAt(state).title),
            actions: pages.elementAt(state).getActions(context),
          ),
          body: PageView(
            controller: pageController,
            onPageChanged: (value) => context.read<HomeCubit>().setPage(value),
            children: pages,
          ),
          floatingActionButton: pages.elementAt(state).getFloatingActionButton(context),
          bottomNavigationBar: BottomNavigationBar(
              onTap: (value) {
                pageController.animateToPage(
                  value,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOutQuint,
                );
              },
              currentIndex: state,
              items: pages.map((p) => BottomNavigationBarItem(icon: p.icon, label: p.title)).toList()),
        );
      },
    );
  }
}
