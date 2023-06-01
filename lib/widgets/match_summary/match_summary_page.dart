import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/match/match_cubit.dart';
import 'match_summary_view.dart';

class MatchSummaryPage extends StatelessWidget {
  final MatchCubit bloc;
  const MatchSummaryPage({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: const MatchSummaryView(),
    );
  }
}
