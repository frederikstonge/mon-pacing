import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/actions/loading_icon_button.dart';
import '../../components/bottom_sheet_dialog/bottom_sheet_dialog.dart';
import '../../components/custom_card/custom_card.dart';
import '../../components/sliver_logo_appbar/sliver_logo_appbar.dart';
import '../../components/sliver_scaffold/sliver_scaffold.dart';
import '../../l10n/app_localizations.dart';
import '../match_detail/match_detail_page_shell.dart';
import '../match_scoreboard/match_scoreboard_shell.dart';
import 'cubits/match_cubit.dart';
import 'cubits/match_state.dart';
import 'widgets/improvisation_actions.dart';
import 'widgets/improvisation_card.dart';
import 'widgets/match_persistent_header.dart';

class MatchPageView extends StatelessWidget {
  static const scoreboardHeight = 100.0;
  const MatchPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MatchCubit, MatchState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            error: (error) => Center(child: Text(error)),
            success: (match, selectedImprovisationIndex) => SliverScaffold(
              slivers: [
                SliverLogoAppbar(
                  title: match.name,
                  actions: [
                    LoadingIconButton(
                      onPressed: () async {
                        await BottomSheetDialog.showDialog(
                          context: context,
                          child: MatchScoreboardShell(
                            match: match,
                            onExport: (match) {},
                          ),
                        );
                      },
                      tooltip: S.of(context).scoreboard,
                      icon: const Icon(Icons.scoreboard),
                    ),
                    LoadingIconButton(
                      onPressed: () async {
                        await BottomSheetDialog.showDialog(
                          context: context,
                          child: MatchDetailPageShell(
                            match: match,
                            onConfirm: (match) async {
                              await context.read<MatchCubit>().edit(match);
                            },
                          ),
                        );
                      },
                      tooltip: S.of(context).editMatch,
                      icon: const Icon(Icons.edit),
                    ),
                  ],
                ),
                SliverPersistentHeader(
                  delegate: MatchPersistentHeader(
                    match: match,
                    selectedImprovisationIndex: selectedImprovisationIndex,
                    changePage: context.read<MatchCubit>().changePage,
                  ),
                  pinned: true,
                ),
                SliverToBoxAdapter(
                  child: ImprovisationCard(improvisation: match.improvisations[selectedImprovisationIndex]),
                ),
                const SliverToBoxAdapter(
                  child: CustomCard(
                    child: Text('Timer soon'),
                  ),
                ),
                SliverToBoxAdapter(
                  child: ImprovisationActions(
                    key: ValueKey(match.improvisations[selectedImprovisationIndex].hashCode),
                    match: match,
                    improvisation: match.improvisations[selectedImprovisationIndex],
                    onPointChanged: context.read<MatchCubit>().setPoint,
                  ),
                ),
                const SliverToBoxAdapter(
                  child: CustomCard(
                    child: Text('Penalties soon'),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
