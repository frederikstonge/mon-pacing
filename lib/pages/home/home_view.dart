import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_cubit.dart';
import 'ipage.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key, required this.pages}) : super(key: key);

  final List<IPage> pages;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, int>(
      builder: (context, state) {
        var pageController = PageController(initialPage: state);
        return Scaffold(
          appBar: AppBar(
            title: Text(pages.elementAt(state).title),
          ),
          body: PageView(
            controller: pageController,
            onPageChanged: (value) => context.read<HomeCubit>().setPage(value),
            children: pages,
          ),
          floatingActionButton: pages.elementAt(state).floatingActionButton,
          bottomNavigationBar: BottomNavigationBar(
              onTap: (value) {
                pageController.animateToPage(
                  value,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOutQuint,
                );
              },
              currentIndex: state,
              items: pages
                  .map((p) =>
                      BottomNavigationBarItem(icon: p.icon, label: p.title))
                  .toList()),
        );
      },
    );
  }
}
