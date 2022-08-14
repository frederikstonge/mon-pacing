import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monpacing/views/pacings_view.dart';

import '../blocs/pacing_bloc.dart';
import '../events/pacing_event.dart';
import '../repositories/pacing_repository.dart';
import 'ipage.dart';

class PacingsPage extends StatelessWidget implements IPage {
  const PacingsPage({Key? key}) : super(key: key);

  @override
  Icon get icon => const Icon(Icons.list);

  @override
  String get title => "Pacings";

  @override
  FloatingActionButton? get floatingActionButton => FloatingActionButton(
        onPressed: () {},
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
