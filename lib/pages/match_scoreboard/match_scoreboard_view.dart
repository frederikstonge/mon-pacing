import 'dart:async';

import 'package:flutter/material.dart';

import '../../components/actions/loading_icon_button.dart';
import '../../components/bottom_sheet_dialog/bottom_sheet_appbar.dart';
import '../../components/bottom_sheet_dialog/bottom_sheet_scaffold.dart';
import '../../l10n/app_localizations.dart';
import '../../models/match_model.dart';
import 'widgets/scoreboard.dart';
import 'widgets/scorecard.dart';

class MatchScoreboardView extends StatelessWidget {
  final MatchModel match;
  final FutureOr<void> Function() onExport;

  const MatchScoreboardView({
    super.key,
    required this.match,
    required this.onExport,
  });

  @override
  Widget build(BuildContext context) {
    return BottomSheetScaffold(
      appBar: BottomSheetAppbar(
        title: match.name,
        trailing: LoadingIconButton(
          icon: const Icon(Icons.upload),
          tooltip: S.of(context).export,
          onPressed: () async {
            await onExport.call();
          },
        ),
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
