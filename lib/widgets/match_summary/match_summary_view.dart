import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/match/match_cubit.dart';
import '../../cubits/match/match_state.dart';

class MatchSummaryView extends StatelessWidget {
  const MatchSummaryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MatchCubit, MatchState>(
      builder: (context, state) => state.when(
        initial: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
        error: (error) => Scaffold(body: Center(child: Text(error))),
        success: (match) => Scaffold(
          appBar: AppBar(
            title: Text('${match.name} Summary'),
          ),
          body: Table(
            children: [
              TableRow(
                children: [
                  const Text('Improvisation'),
                  ...match.teams.map((t) => Text(t.name)),
                ],
              ),
              ...match.improvisations
                  .map(
                    (i) => TableRow(
                      children: [
                        Text(i.order.toString()),
                        ...match.teams.map(
                          (t) {
                            final points = match.points.where((p) => p.teamId == t.id && p.improvisationId == i.id);
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
      ),
    );
  }
}
