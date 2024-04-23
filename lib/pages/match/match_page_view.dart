import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../components/actions/loading_icon_button.dart';
import '../../components/bottom_sheet_dialog/bottom_sheet_dialog.dart';
import '../../components/custom_card/custom_card.dart';
import '../../components/message_box_dialog/message_box_dialog.dart';
import '../../components/sliver_logo_appbar/sliver_logo_appbar.dart';
import '../../components/sliver_scaffold/sliver_scaffold.dart';
import '../../components/team_color_avatar/team_color_avatar.dart';
import '../../components/timer_banner/timer_banner.dart';
import '../../extensions/match_extensions.dart';
import '../../extensions/penalty_extensions.dart';
import '../../l10n/app_localizations.dart';
import '../match_detail/match_detail_page_shell.dart';
import '../match_penalty/match_penalty_shell.dart';
import '../match_scoreboard/match_scoreboard_shell.dart';
import 'cubits/match_cubit.dart';
import 'cubits/match_state.dart';
import 'widgets/improvisation_actions.dart';
import 'widgets/improvisation_card.dart';
import 'widgets/match_persistent_header.dart';
import 'widgets/timer_widget.dart';

class MatchPageView extends StatelessWidget {
  const MatchPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MatchCubit, MatchState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            error: (error) => Center(child: Text(error)),
            success: (match, selectedImprovisationIndex, selectedDurationIndex) => Builder(
              builder: (context) {
                final improvisation = match.improvisations.elementAt(selectedImprovisationIndex);
                return SliverScaffold(
                  appBar: SliverLogoAppbar(
                    title: match.name,
                    actions: [
                      LoadingIconButton(
                        onPressed: () async {
                          await BottomSheetDialog.showDialog(
                            context: context,
                            child: MatchScoreboardShell(
                              match: match,
                              onExport: () => context.read<MatchCubit>().exportExcel(match),
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
                  slivers: [
                    TimerBanner(
                      match: match,
                      improvisation: improvisation,
                      selectedDurationIndex: selectedDurationIndex,
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
                      child: ImprovisationCard(
                        improvisation: improvisation,
                        index: selectedImprovisationIndex,
                        onSave: context.read<MatchCubit>().editImprovisation,
                        onDelete: context.read<MatchCubit>().removeImprovisation,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: CustomCard(
                        child: TimerWidget(
                          match: match,
                          improvisation: improvisation,
                          durationIndex: selectedDurationIndex,
                          onDurationIndexChanged: (durationIndex) => context.read<MatchCubit>().changeDuration(durationIndex),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: ImprovisationActions(
                        key: ValueKey(improvisation.hashCode),
                        match: match,
                        improvisation: improvisation,
                        onPointChanged: context.read<MatchCubit>().setPoint,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: CustomCard(
                        child: Column(
                          children: [
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: Text(S.of(context).penalties, style: const TextStyle(fontWeight: FontWeight.bold)),
                              trailing: LoadingIconButton(
                                icon: const Icon(Icons.add),
                                tooltip: S.of(context).addPenalty,
                                onPressed: () async => await BottomSheetDialog.showDialog(
                                  context: context,
                                  child: MatchPenaltyShell(
                                    improvisationId: improvisation.id,
                                    teams: match.teams,
                                    onSave: (penalty) async => await context.read<MatchCubit>().addPenalty(penalty),
                                  ),
                                ),
                              ),
                            ),
                            ...match.penalties.where((p) => p.improvisationId == improvisation.id).map(
                                  (e) => InkWell(
                                    onTap: () => BottomSheetDialog.showDialog(
                                      context: context,
                                      child: MatchPenaltyShell(
                                        improvisationId: improvisation.id,
                                        teams: match.teams,
                                        penalty: e,
                                        onSave: (penalty) async => await context.read<MatchCubit>().editPenalty(penalty),
                                      ),
                                    ),
                                    child: ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      leading: TeamColorAvatar(color: match.getTeamColor(e.teamId)),
                                      title: Text(e.getPenaltyString(S.of(context))),
                                      subtitle: Text(e.performer),
                                      trailing: LoadingIconButton(
                                          icon: const Icon(Icons.remove),
                                          tooltip: S.of(context).delete,
                                          onPressed: () async {
                                            final matchCubit = context.read<MatchCubit>();
                                            final result = await MessageBoxDialog.questionShow(
                                              context,
                                              S.of(context).areYouSure(S.of(context).delete.toLowerCase(), e.type),
                                              S.of(context).delete,
                                              S.of(context).cancel,
                                            );
                                            if (result ?? false) {
                                              await matchCubit.removePenalty(e.id);
                                            }
                                          }),
                                    ),
                                  ),
                                ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
