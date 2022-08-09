import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home/ipage.dart';
import 'matches_cubit.dart';
import 'matches_view.dart';

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
