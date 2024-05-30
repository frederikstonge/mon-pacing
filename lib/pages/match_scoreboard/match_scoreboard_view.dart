import 'package:flutter/material.dart';

import '../../components/bottom_sheet_dialog/bottom_sheet_appbar.dart';
import '../../components/bottom_sheet_dialog/bottom_sheet_scaffold.dart';
import '../../models/match_model.dart';
import 'widgets/scoreboard.dart';
import 'widgets/scorecard.dart';

class MatchScoreboardView extends StatelessWidget {
  final MatchModel match;

  const MatchScoreboardView({
    super.key,
    required this.match,
  });

  @override
  Widget build(BuildContext context) {
    return BottomSheetScaffold(
      appBar: BottomSheetAppbar(
        title: match.name,
      ),
      isBodyExpanded: true,
      body: Column(
        children: [
          const SizedBox(height: 16),
          Scoreboard(match: match),
          Scorecard(match: match),
        ],
      ),
    );
  }
}
