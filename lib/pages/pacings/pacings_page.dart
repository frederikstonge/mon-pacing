import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monpacing/pages/pacings/pacings_cubit.dart';
import 'package:monpacing/pages/pacings/pacings_view.dart';

import '../../repositories/pacings_repository.dart';
import '../home/ipage.dart';

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
      create: (_) => PacingsCubit(
        repository: context.read<PacingsRepository>(),
      ),
      child: const PacingsView(),
    );
  }
}
