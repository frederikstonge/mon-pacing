import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monpacing/views/pacings_view.dart';

import '../blocs/pacing_bloc.dart';
import '../events/pacing_event.dart';
import '../repositories/pacing_repository.dart';
import 'ibottom_nav_page.dart';
import 'pacing_page.dart';

class PacingsPage extends StatelessWidget implements IBottomNavPage {
  const PacingsPage({Key? key}) : super(key: key);

  @override
  Icon get icon => const Icon(Icons.list);

  @override
  String get title => "Pacings";

  @override
  FloatingActionButton? getFloatingActionButton(BuildContext context) => FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: ((context) => const PacingPage())));
        },
        tooltip: "Add pacing",
        child: const Icon(Icons.add),
      );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PacingBloc(
        repository: context.read<PacingRepository>(),
      )..add(const PacingFetchEvent()),
      child: PacingsView(),
    );
  }
}
