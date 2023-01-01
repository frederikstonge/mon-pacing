import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/match_cubit.dart';
import '../generated/l10n.dart';
import '../helpers/duration_helper.dart';
import '../models/improvisation_model.dart';
import '../models/improvisation_type.dart';
import '../models/match_model.dart';
import 'improvisation_timer.dart';

class MatchImprovisation extends StatelessWidget {
  final ImprovisationModel improvisation;
  final MatchModel match;
  const MatchImprovisation({super.key, required this.improvisation, required this.match});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Improvisation #${improvisation.order + 1}",
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                S.of(context).PacingView_ImprovisationSubtitle(
                      improvisation.type == ImprovisationType.compared
                          ? S.of(context).ImprovisationType_compared
                          : S.of(context).ImprovisationType_mixed,
                      improvisation.category.isNotEmpty ? improvisation.category : "-",
                      improvisation.theme.isNotEmpty ? improvisation.theme : "-",
                      improvisation.performers ?? "-",
                      DurationHelper.getDurationString(improvisation.duration),
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: LayoutBuilder(
                builder: (context, constraints) => ToggleButtons(
                  borderRadius: BorderRadius.circular(6),
                  constraints: BoxConstraints.expand(width: constraints.maxWidth / 4),
                  isSelected: match.teams
                      .map((e) => match.points.any((element) => element.teamId == e.id && element.improvisationId == improvisation.id))
                      .toList(),
                  children: match.teams
                      .map(
                        (e) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              CircleAvatar(
                                backgroundColor: Color(e.color),
                              ),
                              Text(
                                textAlign: TextAlign.center,
                                e.name,
                                overflow: TextOverflow.fade,
                              )
                            ],
                          ),
                        ),
                      )
                      .toList(),
                  onPressed: (index) async {
                    await context.read<MatchCubit>().setPoint(improvisation.id, match.teams[index].id);
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ImprovisationTimer(improvisation: improvisation),
            ),
          ],
        ),
      ),
    );
  }
}
