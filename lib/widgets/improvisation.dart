import 'package:flutter/material.dart';

import '../generated/l10n.dart';
import '../helpers/duration_helper.dart';
import '../models/improvisation_model.dart';
import '../models/improvisation_type.dart';
import 'improvisation_timer.dart';

class ImprovisationView extends StatelessWidget {
  final ImprovisationModel improvisation;
  const ImprovisationView({super.key, required this.improvisation});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                    getDurationString(improvisation.duration),
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ImprovisationTimer(improvisation: improvisation),
          ),
        ],
      ),
    );
  }
}
