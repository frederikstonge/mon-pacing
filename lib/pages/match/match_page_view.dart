import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:toastification/toastification.dart';

import '../../components/bottom_sheet/bottom_sheet_dialog.dart';
import '../../components/buttons/loading_icon_button.dart';
import '../../components/custom_card/custom_card.dart';
import '../../components/match_menu/match_menu.dart';
import '../../components/message_box_dialog/message_box_dialog.dart';
import '../../components/sliver_logo_appbar/sliver_logo_appbar.dart';
import '../../components/sliver_scaffold/sliver_scaffold.dart';
import '../../components/team_color_avatar/team_color_avatar.dart';
import '../../components/timer_banner/timer_banner.dart';
import '../../cubits/matches/matches_cubit.dart';
import '../../cubits/settings/settings_cubit.dart';
import '../../cubits/settings/settings_state.dart';
import '../../cubits/timer/timer_cubit.dart';
import '../../cubits/timer/timer_state.dart';
import '../../extensions/match_extensions.dart';
import '../../extensions/penalty_extensions.dart';
import '../../integrations/match_integration_base.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../models/match_model.dart';
import '../../services/integration_service.dart';
import '../../services/toaster_service.dart';
import '../match_detail/match_detail_page_shell.dart';
import '../match_improvisation/match_improvisation_shell.dart';
import '../match_penalty/match_penalty_shell.dart';
import '../match_scoreboard/match_scoreboard_shell.dart';
import 'cubits/match_cubit.dart';
import 'cubits/match_state.dart';
import 'cubits/match_status.dart';
import 'widgets/improvisation_actions.dart';
import 'widgets/improvisation_card.dart';
import 'widgets/match_persistent_header.dart';
import 'widgets/match_summary.dart';
import 'widgets/timer_widget.dart';

class MatchPageView extends StatelessWidget {
  const MatchPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MatchCubit, MatchState>(
        builder: (context, matchState) {
          return switch (matchState.status) {
            MatchStatus.initial => const Center(child: CircularProgressIndicator()),
            MatchStatus.loading => const Center(child: CircularProgressIndicator()),
            MatchStatus.error => Center(child: Text(matchState.error ?? '')),
            MatchStatus.success => Builder(
                builder: (context) {
                  final match = matchState.match!;
                  final selectedImprovisationIndex = matchState.selectedImprovisationIndex;
                  final selectedDurationIndex = matchState.selectedDurationIndex;
                  final summarySelected = match.enableStatistics && selectedImprovisationIndex == match.improvisations.length;
                  final improvisation = match.improvisations.elementAtOrNull(selectedImprovisationIndex);
                  final canAddImprovisation =
                      match.integrationMaxNumberOfImprovisations == null || match.improvisations.length < match.integrationMaxNumberOfImprovisations!;
                  final canRemoveImprovisation = match.improvisations.length > (match.integrationMinNumberOfImprovisations ?? 1);

                  return BlocBuilder<TimerCubit, TimerState>(
                    builder: (context, timerState) {
                      return SliverScaffold(
                        banner: timerState.timer != null
                            ? TimerBanner(
                                timer: timerState.timer!,
                                match: match,
                                improvisation: improvisation,
                                selectedDurationIndex: selectedDurationIndex,
                              )
                            : null,
                        appBar: BlocBuilder<SettingsCubit, SettingsState>(
                          builder: (context, settingsState) {
                            return SliverLogoAppbar(
                              title: match.name,
                              theme: settingsState.theme,
                              primary: timerState.timer == null,
                              actions: [
                                if (match.enableStatistics) ...[
                                  LoadingIconButton(
                                    onPressed: () async {
                                      await BottomSheetDialog.showDialog(
                                        context: context,
                                        child: MatchScoreboardShell(
                                          match: match,
                                        ),
                                      );
                                    },
                                    tooltip: S.of(context).scoreboard,
                                    icon: const Icon(Icons.scoreboard),
                                  ),
                                ],
                                LoadingIconButton(
                                  onPressed: () => BottomSheetDialog.showDialog(
                                    context: context,
                                    child: MatchMenu(
                                      match: match,
                                      editDetails: () async {
                                        await BottomSheetDialog.showDialog(
                                          context: context,
                                          child: MatchDetailPageShell(
                                            match: match,
                                            onConfirm: (match) async {
                                              await context.read<MatchCubit>().edit(match);
                                              return true;
                                            },
                                          ),
                                        );
                                      },
                                      delete: () async {
                                        final matchesCubit = context.read<MatchesCubit>();
                                        final router = GoRouter.of(context);
                                        final result = await MessageBoxDialog.questionShow(
                                          context,
                                          S.of(context).areYouSure(action: S.of(context).delete.toLowerCase(), name: match.name),
                                          S.of(context).delete,
                                          S.of(context).cancel,
                                        );
                                        if (result == true) {
                                          await matchesCubit.delete(match);
                                          router.pop();
                                        }
                                      },
                                    ),
                                  ),
                                  icon: const Icon(Icons.more_vert),
                                ),
                              ],
                            );
                          },
                        ),
                        slivers: [
                          SliverPersistentHeader(
                            delegate: MatchPersistentHeader(
                              match: match,
                              selectedImprovisationIndex: selectedImprovisationIndex,
                              changePage: context.read<MatchCubit>().changePage,
                              onAdd: canAddImprovisation
                                  ? () {
                                      BottomSheetDialog.showDialog(
                                        context: context,
                                        child: MatchImprovisationShell(
                                          match: match,
                                          onConfirm: (improvisation, index) async =>
                                              await context.read<MatchCubit>().addImprovisation(improvisation, index),
                                        ),
                                      );
                                    }
                                  : null,
                            ),
                            pinned: true,
                          ),
                          if (!summarySelected && improvisation != null) ...[
                            SliverToBoxAdapter(
                              child: ImprovisationCard(
                                improvisation: improvisation,
                                index: selectedImprovisationIndex,
                                onEdit: (improvisation) async {
                                  if (improvisation.id == context.read<TimerCubit>().state.timer?.improvisationId) {
                                    context.read<ToasterService>().show(
                                          title: S.of(context).timerIsActiveError(action: S.of(context).edit.toLowerCase()),
                                          type: ToastificationType.error,
                                        );
                                    return;
                                  }

                                  await BottomSheetDialog.showDialog(
                                    context: context,
                                    child: MatchImprovisationShell(
                                      improvisation: improvisation,
                                      match: match,
                                      onConfirm: (improvisation, index) async =>
                                          await context.read<MatchCubit>().editImprovisation(improvisation, index),
                                    ),
                                  );
                                },
                                onDelete: canRemoveImprovisation
                                    ? (improvisation) async {
                                        if (improvisation.id == context.read<TimerCubit>().state.timer?.improvisationId) {
                                          context.read<ToasterService>().show(
                                                title: S.of(context).timerIsActiveError(action: S.of(context).delete.toLowerCase()),
                                                type: ToastificationType.error,
                                              );
                                          return;
                                        }

                                        final matchCubit = context.read<MatchCubit>();
                                        final shouldDelete = await MessageBoxDialog.questionShow(
                                          context,
                                          S.of(context).areYouSure(
                                                action: S.of(context).delete.toLowerCase(),
                                                name: S.of(context).improvisationNumber(order: selectedImprovisationIndex + 1),
                                              ),
                                          S.of(context).delete,
                                          S.of(context).cancel,
                                        );

                                        if (shouldDelete == true) {
                                          await matchCubit.removeImprovisation(improvisation);
                                        }
                                      }
                                    : null,
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
                            if (match.enableStatistics) ...[
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
                                              integrationPenaltyTypes: match.integrationPenaltyTypes,
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
                                                  integrationPenaltyTypes: match.integrationPenaltyTypes,
                                                  onSave: (penalty) async => await context.read<MatchCubit>().editPenalty(penalty),
                                                ),
                                              ),
                                              child: ListTile(
                                                contentPadding: EdgeInsets.zero,
                                                leading: TeamColorAvatar(color: match.getTeamColor(e.teamId)),
                                                title: Text(e.getPenaltyString(S.of(context), match, includePerformerName: false)),
                                                subtitle: e.performerId != null
                                                    ? Text(match.teams
                                                        .firstWhere((t) => t.id == e.teamId)
                                                        .performers
                                                        .firstWhere((p) => p.id == e.performerId)
                                                        .name)
                                                    : null,
                                                trailing: LoadingIconButton(
                                                  icon: const Icon(Icons.remove),
                                                  tooltip: S.of(context).delete,
                                                  onPressed: () async {
                                                    final matchCubit = context.read<MatchCubit>();
                                                    final result = await MessageBoxDialog.questionShow(
                                                      context,
                                                      S.of(context).areYouSure(action: S.of(context).delete.toLowerCase(), name: e.type),
                                                      S.of(context).delete,
                                                      S.of(context).cancel,
                                                    );
                                                    if (result ?? false) {
                                                      await matchCubit.removePenalty(e.id);
                                                    }
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ] else ...[
                            SliverToBoxAdapter(
                              child: MatchSummary(
                                match: match,
                                onExport: () => context.read<MatchCubit>().exportExcel(),
                                onExportIntegration: match.integrationId != null
                                    ? () async {
                                        await _onExportIntegration(context, match);
                                      }
                                    : null,
                              ),
                            ),
                          ],
                        ],
                      );
                    },
                  );
                },
              ),
          };
        },
      ),
    );
  }

  Future<void> _onExportIntegration(BuildContext context, MatchModel match) async {
    final integration = context.read<IntegrationService>().getIntegration<MatchIntegrationBase>(match.integrationId!);
    final toasterService = context.read<ToasterService>();
    final localizer = S.of(context);
    final result = await MessageBoxDialog.questionShow(
      context,
      localizer.areYouSure(action: localizer.exportMatchSheet.toLowerCase(), name: match.name),
      localizer.exportMatchSheet,
      localizer.cancel,
    );
    if (result ?? false) {
      final exportResult = await integration.exportMatch(match);
      if (exportResult) {
        toasterService.show(
          title: localizer.toasterMatchResultExported,
          type: ToastificationType.success,
        );
      } else {
        toasterService.show(
          title: localizer.toasterGenericError,
          type: ToastificationType.error,
        );
      }
    }
  }
}
