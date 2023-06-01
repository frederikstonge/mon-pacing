import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/match/match_cubit.dart';
import '../../models/match_model.dart';

class MatchSummaryView extends StatelessWidget {
  const MatchSummaryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MatchCubit, MatchModel>(
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          title: Text('${state.name} Summary'),
        ),
        body: Table(
          children: [
            TableRow(
              children: [
                const Text('Improvisation'),
                ...state.teams.map((t) => Text(t.name)),
              ],
            ),
            ...state.improvisations
                .map(
                  (i) => TableRow(
                    children: [
                      Text(i.order.toString()),
                      ...state.teams.map(
                        (t) {
                          final points = state.points.where((p) => p.teamId == t.id && p.improvisationId == i.id);
                          if (points.isEmpty) {
                            return const Text('');
                          }

                          return Text(points.first.value.toString());
                        },
                      ).toList()
                    ],
                  ),
                )
                .toList()
          ],
        ),
      ),
    );
  }
}
