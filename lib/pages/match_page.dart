import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/match_cubit.dart';
import '../views/match_view.dart';

class MatchPage extends StatelessWidget {
  const MatchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MatchCubit(),
      child: const MatchView(),
    );
  }
}
