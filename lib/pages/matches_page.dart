import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../views/matches_view.dart';
import 'ipage.dart';
import '../cubits/matches_cubit.dart';

class MatchesPage extends StatelessWidget implements IPage {
  const MatchesPage({Key? key}) : super(key: key);

  @override
  Icon get icon => const Icon(Icons.list_alt);

  @override
  String get title => "Matches";

  @override
  FloatingActionButton? get floatingActionButton => null;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MatchesCubit(),
      child: const MatchesView(),
    );
  }
}
