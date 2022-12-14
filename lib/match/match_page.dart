import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'match_cubit.dart';
import '../match_improvisations/match_improvisations_cubit.dart';
import '../models/match_model.dart';
import 'match_view.dart';

class MatchPage extends StatelessWidget {
  final MatchModel model;

  const MatchPage({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => MatchCubit(model: model),
        ),
        BlocProvider(
          create: (_) => MatchImprovisationsCubit(),
        ),
      ],
      child: MatchView(),
    );
  }
}
