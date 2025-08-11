import 'package:collection/collection.dart';
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
import '../../components/timer_banner/timer_banner.dart';
import '../../cubits/integrations/integrations_cubit.dart';
import '../../cubits/integrations/integrations_state.dart';
import '../../cubits/matches/matches_cubit.dart';
import '../../cubits/settings/settings_cubit.dart';
import '../../cubits/settings/settings_state.dart';
import '../../cubits/timer/timer_cubit.dart';
import '../../cubits/timer/timer_state.dart';
import '../../integrations/match_integration_base.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../models/improvisation_model.dart';
import '../../models/match_model.dart';
import '../../models/penalty_model.dart';
import '../../services/toaster_service.dart';
import '../match_detail/match_detail_page_shell.dart';
import '../match_improvisation/match_improvisation_shell.dart';
import '../match_penalty/match_penalty_shell.dart';
import '../match_scoreboard/match_scoreboard_shell.dart';
import 'cubits/match_cubit.dart';
import 'cubits/match_state.dart';
import 'cubits/match_status.dart';
import 'widgets/improvisation_card.dart';
import 'widgets/improvisation_penalties.dart';
import 'widgets/improvisation_points.dart';
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
                final summarySelected =
                    match.enableStatistics && selectedImprovisationIndex == match.improvisations.length;
                final improvisation = match.improvisations.elementAtOrNull(selectedImprovisationIndex);
                final canAddImprovisation =
                    match.maxNumberOfImprovisations == null ||
                    match.improvisations.length < match.maxNumberOfImprovisations!;
                final canRemoveImprovisation = match.improvisations.length > (match.minNumberOfImprovisations ?? 1);

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
                                    await _openScoreboard(context, match);
                                  },
                                  tooltip: S.of(context).scoreboard,
                                  icon: const Icon(Icons.scoreboard),
                                ),
                              ],
                              LoadingIconButton(
                                tooltip: S.of(context).more,
                                onPressed: () => BottomSheetDialog.showDialog(
                                  context: context,
                                  child: MatchMenu(
                                    match: match,
                                    editDetails: match.integrationId == null
                                        ? () async {
                                            await _editDetails(context, match);
                                          }
                                        : null,
                                    delete: () async {
                                      await _delete(context, match);
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
                            onAdd: canAddImprovisation ? () => _addImprovisation(context, match) : null,
                          ),
                          pinned: true,
                        ),
                        if (!summarySelected && improvisation != null) ...[
                          SliverToBoxAdapter(
                            child: ImprovisationCard(
                              improvisation: improvisation,
                              index: selectedImprovisationIndex,
                              onEdit: (improvisation) async => await _editImprovisation(context, match, improvisation),
                              onDelete: canRemoveImprovisation
                                  ? (improvisation) async =>
                                        await _deleteImprovisation(context, improvisation, selectedImprovisationIndex)
                                  : null,
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: CustomCard(
                              child: TimerWidget(
                                match: match,
                                improvisation: improvisation,
                                durationIndex: selectedDurationIndex,
                                onDurationIndexChanged: (durationIndex) =>
                                    context.read<MatchCubit>().changeDuration(durationIndex),
                              ),
                            ),
                          ),
                          if (match.enableStatistics) ...[
                            SliverToBoxAdapter(
                              child: ImprovisationPoints(
                                key: ValueKey(improvisation.hashCode),
                                match: match,
                                improvisation: improvisation,
                                onPointChanged: (improvisationId, teamId, value) =>
                                    context.read<MatchCubit>().setPoint(improvisationId, teamId, value),
                              ),
                            ),
                            SliverToBoxAdapter(
                              child: ImprovisationPenalties(
                                match: match,
                                improvisation: improvisation,
                                editPenalty: _editPenalty,
                                addPenalty: _addPenalty,
                                removePenalty: _removePenalty,
                              ),
                            ),
                          ],
                        ] else ...[
                          SliverToBoxAdapter(
                            child: BlocBuilder<IntegrationsCubit, IntegrationsState>(
                              builder: (context, integrationsState) {
                                final integration = integrationsState.integrations
                                    .whereType<MatchIntegrationBase>()
                                    .firstWhereOrNull((i) => i.integrationId == match.integrationId);

                                return MatchSummary(
                                  match: match,
                                  onExport: () => _export(context),
                                  onExportIntegration: integration != null
                                      ? () async {
                                          await _onExportIntegration(context, match, integration);
                                        }
                                      : null,
                                );
                              },
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

  Future<bool> _export(BuildContext context) => context.read<MatchCubit>().exportExcel();

  Future<void> _removePenalty(BuildContext context, PenaltyModel penalty) async {
    final matchCubit = context.read<MatchCubit>();
    final result = await MessageBoxDialog.questionShow(
      context,
      S.of(context).areYouSureActionName(action: S.of(context).delete.toLowerCase(), name: penalty.type),
      S.of(context).delete,
      S.of(context).cancel,
    );
    if (result ?? false) {
      await matchCubit.removePenalty(penalty.id);
    }
  }

  Future<void> _editPenalty(
    BuildContext context,
    MatchModel match,
    ImprovisationModel improvisation,
    PenaltyModel penalty,
  ) async => BottomSheetDialog.showDialog(
    context: context,
    child: MatchPenaltyShell(
      improvisationId: improvisation.id,
      teams: match.teams,
      penalty: penalty,
      integrationPenaltyTypes: match.penaltyTypes,
      onSave: (penalty) async => await context.read<MatchCubit>().editPenalty(penalty),
    ),
  );

  Future<void> _addPenalty(BuildContext context, MatchModel match, ImprovisationModel improvisation) async {
    await BottomSheetDialog.showDialog(
      context: context,
      child: MatchPenaltyShell(
        improvisationId: improvisation.id,
        teams: match.teams,
        onSave: (penalty) async => await context.read<MatchCubit>().addPenalty(penalty),
        integrationPenaltyTypes: match.penaltyTypes,
      ),
    );
  }

  Future<void> _deleteImprovisation(BuildContext context, ImprovisationModel improvisation, int index) async {
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
      S
          .of(context)
          .areYouSureActionName(
            action: S.of(context).delete.toLowerCase(),
            name: S.of(context).improvisationNumber(order: index + 1),
          ),
      S.of(context).delete,
      S.of(context).cancel,
    );

    if (shouldDelete == true) {
      await matchCubit.removeImprovisation(improvisation);
    }
  }

  Future<void> _editImprovisation(BuildContext context, MatchModel match, ImprovisationModel improvisation) async {
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
        onConfirm: (improvisation, index, dialogContext) async {
          final navigator = Navigator.of(dialogContext);
          await context.read<MatchCubit>().editImprovisation(improvisation, index);
          navigator.pop();
        },
      ),
    );
  }

  void _addImprovisation(BuildContext context, MatchModel match) {
    BottomSheetDialog.showDialog(
      context: context,
      child: MatchImprovisationShell(
        match: match,
        onConfirm: (improvisation, index, dialogContext) async {
          final navigator = Navigator.of(dialogContext);
          await context.read<MatchCubit>().addImprovisation(improvisation, index);
          navigator.pop();
        },
      ),
    );
  }

  Future<void> _delete(BuildContext context, MatchModel match) async {
    final matchesCubit = context.read<MatchesCubit>();
    final router = GoRouter.of(context);
    final result = await MessageBoxDialog.questionShow(
      context,
      S.of(context).areYouSureActionName(action: S.of(context).delete.toLowerCase(), name: match.name),
      S.of(context).delete,
      S.of(context).cancel,
    );
    if (result == true) {
      await matchesCubit.delete(match);
      router.pop();
    }
  }

  Future<void> _editDetails(BuildContext context, MatchModel match) async {
    await BottomSheetDialog.showDialog(
      context: context,
      child: MatchDetailPageShell(
        match: match,
        onConfirm: (match, dialogContext) async {
          final navigator = Navigator.of(dialogContext);
          await context.read<MatchCubit>().edit(match);
          navigator.pop();
        },
      ),
    );
  }

  Future<void> _openScoreboard(BuildContext context, MatchModel match) async {
    await BottomSheetDialog.showDialog(
      context: context,
      child: MatchScoreboardShell(match: match),
    );
  }

  Future<void> _onExportIntegration(BuildContext context, MatchModel match, MatchIntegrationBase integration) async {
    final toasterService = context.read<ToasterService>();
    final localizer = S.of(context);
    final result = await MessageBoxDialog.questionShow(
      context,
      localizer.areYouSureActionName(action: localizer.exportMatchSheet.toLowerCase(), name: match.name),
      localizer.exportMatchSheet,
      localizer.cancel,
    );
    if (result ?? false) {
      final exportResult = await integration.exportMatch(match);
      if (exportResult) {
        toasterService.show(title: localizer.toasterMatchResultExported, type: ToastificationType.success);
      } else {
        toasterService.show(title: localizer.toasterGenericError, type: ToastificationType.error);
      }
    }
  }
}
