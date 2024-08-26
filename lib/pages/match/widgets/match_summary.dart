import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haptic_feedback/haptic_feedback.dart';

import '../../../components/actions/loading_button.dart';
import '../../../components/actions/loading_icon_button.dart';
import '../../../components/bottom_sheet_dialog/bottom_sheet_dialog.dart';
import '../../../components/custom_card/custom_card.dart';
import '../../../components/scoreboard/scoreboard.dart';
import '../../../components/text_header/text_header.dart';
import '../../../cubits/settings/settings_cubit.dart';
import '../../../l10n/app_localizations.dart';
import '../../../models/match_model.dart';
import '../../match_scoreboard/match_scoreboard_shell.dart';
import '../cubits/match_cubit.dart';
import 'match_stars.dart';

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
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Scoreboard(match: match),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 8, right: 16),
          child: TextHeader(
            title: S.of(context).stars,
            trailing: LoadingIconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                context.read<MatchCubit>().addStar();
              },
            ),
          ),
        ),
        CustomCard(
          child: match.stars.isEmpty
              ? Row(
                  children: [
                    Expanded(child: Text(S.of(context).noStar)),
                  ],
                )
              : MatchStars(
                  stars: match.stars,
                  teams: match.teams,
                  onChanged: context.read<MatchCubit>().editStar,
                  onRemove: context.read<MatchCubit>().removeStar,
                  onDrag: context.read<MatchCubit>().moveStar,
                  onDragStart: () => context.read<SettingsCubit>().vibrate(HapticsType.selection),
                ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: LoadingButton.filledIcon(
            icon: const Icon(Icons.scoreboard),
            onPressed: () async {
              await BottomSheetDialog.showDialog(
                context: context,
                builder: (context) => MatchScoreboardShell(
                  match: match,
                ),
              );
            },
            child: Text(S.of(context).scoreboard),
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
