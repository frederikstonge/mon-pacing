import 'dart:async';

import 'package:flutter/material.dart';

import '../../models/match_model.dart';
import 'match_scoreboard_view.dart';

class MatchScoreboardShell extends StatelessWidget {
  final MatchModel match;
  final FutureOr<void> Function() onExport;

  const MatchScoreboardShell({
    super.key,
    required this.match,
    required this.onExport,
  });

  @override
  Widget build(BuildContext context) {
    return MatchScoreboardView(
      match: match,
      onExport: onExport,
    );
  }
}
