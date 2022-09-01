import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/match_cubit.dart';
import '../models/match_model.dart';
import '../views/match_view.dart';

class MatchPage extends StatelessWidget {
  final MatchModel model;

  const MatchPage({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MatchCubit(),
      child: const MatchView(),
    );
  }
}
