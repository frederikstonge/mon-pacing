import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/home_cubit.dart';
import '../pages/ibottom_nav_page.dart';

class HomeView extends StatelessWidget {
  final List<IBottomNavPage> pages;

  const HomeView({super.key, required this.pages});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, int>(
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          title: Text(pages.elementAt(state).title, overflow: TextOverflow.ellipsis),
          actions: pages.elementAt(state).getActions(context),
        ),
        body: PageView(
          controller: context.read<HomeCubit>().pageController,
          onPageChanged: (value) {
            context.read<HomeCubit>().setPage(value, setController: false);
          },
          children: pages,
        ),
        floatingActionButton: pages.elementAt(state).getFloatingActionButton(context),
        bottomNavigationBar: BottomNavigationBar(
            onTap: (value) {
              var cubit = context.read<HomeCubit>();
              cubit.setPage(value);
            },
            currentIndex: state,
            items: pages
                .map((p) => BottomNavigationBarItem(
                      icon: p.icon,
                      label: p.title,
                    ))
                .toList()),
      ),
    );
  }
}
