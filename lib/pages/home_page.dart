import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/home_cubit.dart';
import '../views/home_view.dart';
import 'ipage.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.pages}) : super(key: key);

  final List<IPage> pages;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: HomeView(pages: pages),
    );
  }
}
