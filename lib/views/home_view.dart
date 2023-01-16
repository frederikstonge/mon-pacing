import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/home_cubit.dart';
import '../pages/ibottom_nav_page.dart';

class HomeView extends StatefulWidget {
  final List<IBottomNavPage> pages;

  const HomeView({super.key, required this.pages});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, int>(
      listener: (context, state) {
        if (_pageController.hasClients && _pageController.page != state) {
          _pageController.jumpToPage(state);
        }
      },
      child: BlocBuilder<HomeCubit, int>(
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: Text(widget.pages.elementAt(state).title, overflow: TextOverflow.ellipsis),
            actions: widget.pages.elementAt(state).getActions(context),
          ),
          body: PageView(
            controller: _pageController,
            onPageChanged: (value) {
              context.read<HomeCubit>().setPage(value);
            },
            children: widget.pages,
          ),
          floatingActionButton: widget.pages.elementAt(state).getFloatingActionButton(context),
          bottomNavigationBar: BottomNavigationBar(
              onTap: (value) {
                var cubit = context.read<HomeCubit>();
                cubit.setPage(value);
              },
              currentIndex: state,
              items: widget.pages
                  .map((p) => BottomNavigationBarItem(
                        icon: p.icon,
                        label: p.title,
                      ))
                  .toList()),
        ),
      ),
    );
  }
}
