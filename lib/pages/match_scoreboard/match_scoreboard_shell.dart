import 'package:flutter/material.dart';

import '../../models/match_model.dart';
import 'match_scoreboard_view.dart';

class MatchScoreboardShell extends StatelessWidget {
  final MatchModel match;

  const MatchScoreboardShell({super.key, required this.match});

  @override
  Widget build(BuildContext context) {
    return MatchScoreboardView(match: match);
  }
}
