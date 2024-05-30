import 'dart:async';

import 'package:flutter/material.dart';

import '../../../components/actions/loading_button.dart';
import '../../../components/bottom_sheet_dialog/bottom_sheet_dialog.dart';
import '../../../l10n/app_localizations.dart';
import '../../../models/match_model.dart';
import '../../match_scoreboard/match_scoreboard_shell.dart';
import '../../match_scoreboard/widgets/scoreboard.dart';

class MatchSummary extends StatelessWidget {
  final MatchModel match;
  final FutureOr<void> Function() onExport;

  const MatchSummary({
    super.key,
    required this.match,
    required this.onExport,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Scoreboard(match: match),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: LoadingButton.filledIcon(
            icon: const Icon(Icons.scoreboard),
            onPressed: () async {
              await BottomSheetDialog.showDialog(
                context: context,
                child: MatchScoreboardShell(
                  match: match,
                ),
              );
            },
            child: Text(S.of(context).scoreboard),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: LoadingButton.tonalIcon(
            icon: const Icon(Icons.upload),
            onPressed: () async {
              await onExport();
            },
            child: Text(S.of(context).exportMatchSheet),
          ),
        )
      ],
    );
  }
}
