import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaisel/kaisel.dart';
import 'package:material_ui/material_ui.dart';
import 'package:toastification/toastification.dart';

import '../../components/buttons/loading_icon_button.dart';
import '../../components/custom_card/custom_card.dart';
import '../../components/sliver_logo_appbar/sliver_logo_appbar.dart';
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
import '../../router/routes.dart';
import '../../services/router_service.dart';
import '../../services/toaster_service.dart';
import 'cubits/match_cubit.dart';
import 'cubits/match_state.dart';
import 'cubits/match_status.dart';
import 'widgets/improvisation_card.dart';
import 'widgets/improvisation_statistics.dart';
import 'widgets/match_persistent_header.dart';
import 'widgets/match_summary.dart';
import 'widgets/timer_widget.dart';

class MatchPageView extends StatefulWidget {
  const MatchPageView({super.key});

  @override
  State<MatchPageView> createState() => _MatchPageViewState();
}

class _MatchPageViewState extends State<MatchPageView> {
  late final PageController _pageController;
  bool _lock = false;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, settingsState) {
          return BlocConsumer<MatchCubit, MatchState>(
            listener: (context, state) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (_lock == false &&
                    _pageController.hasClients &&
                    _pageController.page?.round() != state.selectedImprovisationIndex) {
                  _lock = true;
                  _pageController
                      .animateToPage(
                        state.selectedImprovisationIndex,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      )
                      .then((_) {
                        _lock = false;
                      });
                }
              });
            },
            listenWhen: (previous, current) =>
                previous.selectedImprovisationIndex != current.selectedImprovisationIndex,
            builder: (context, matchState) {
              return switch (matchState.status) {
                MatchStatus.initial => const Center(child: CircularProgressIndicator()),
                MatchStatus.loading => const Center(child: CircularProgressIndicator()),
                MatchStatus.error => Center(child: Text(matchState.error ?? '')),
                MatchStatus.success => Builder(
                  builder: (context) {
                    return BlocBuilder<TimerCubit, TimerState>(
                      builder: (context, timerState) {
                        final match = matchState.match!;
                        final selectedImprovisationIndex = matchState.selectedImprovisationIndex;
                        final activeTimer = timerState.timer;
                        final selectedImprovisation = match.improvisations.elementAtOrNull(selectedImprovisationIndex);
                        final showTimerBanner =
                            activeTimer != null &&
                            (activeTimer.matchId != match.id ||
                                activeTimer.improvisationId != selectedImprovisation?.id ||
                                activeTimer.durationIndex != matchState.selectedDurationIndex);
                        final canAddImprovisation =
                            match.maxNumberOfImprovisations == null ||
                            match.improvisations.length < match.maxNumberOfImprovisations!;
                        return NestedScrollView(
                          headerSliverBuilder: (context, innerBoxIsScrolled) => [
                            if (showTimerBanner) ...[
                              TimerBanner(
                                timer: activeTimer,
                                match: match,
                                improvisation: match.improvisations.elementAtOrNull(selectedImprovisationIndex),
                                selectedDurationIndex: matchState.selectedDurationIndex,
                              ),
                            ],
                            BlocBuilder<SettingsCubit, SettingsState>(
                              builder: (context, settingsState) {
                                return SliverLogoAppbar(
                                  title: match.name,
                                  theme: settingsState.theme,
                                  primary: !showTimerBanner,
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
                                      onPressed: () async {
                                        final action = await context.read<RouterService>().showMatchMenuModal(
                                          match: match,
                                          showEditDetails: match.integrationId == null,
                                        );
                                        if (!context.mounted || action == null) return;
                                        switch (action) {
                                          case MatchMenuAction.editDetails:
                                            await _editDetails(context, match);
                                          case MatchMenuAction.delete:
                                            await _delete(context, match);
                                          case MatchMenuAction.edit:
                                            break;
                                        }
                                      },
                                      icon: const Icon(Icons.more_vert),
                                    ),
                                  ],
                                );
                              },
                            ),
                            SliverPersistentHeader(
                              delegate: MatchPersistentHeader(
                                match: match,
                                selectedImprovisationIndex: selectedImprovisationIndex,
                                changePage: context.read<MatchCubit>().changePage,
                                onAdd: canAddImprovisation ? () => _addImprovisation(context, match) : null,
                              ),
                              pinned: true,
                            ),
                          ],
                          body: PageView.builder(
                            controller: _pageController,
                            onPageChanged: (value) {
                              if (_lock == false && value != matchState.selectedImprovisationIndex) {
                                _lock = true;
                                context.read<MatchCubit>().changePage(value);
                                _lock = false;
                              }
                            },
                            itemBuilder: (context, index) {
                              final summarySelected = match.enableStatistics && index == match.improvisations.length;
                              final improvisation = match.improvisations.elementAtOrNull(index);
                              final canRemoveImprovisation =
                                  match.improvisations.length > (match.minNumberOfImprovisations ?? 1);
                              final timer = !summarySelected && improvisation != null
                                  ? CustomCard(
                                      contentPadding: 4,
                                      child: TimerWidget(
                                        key: ValueKey(improvisation.id),
                                        match: match,
                                        improvisation: improvisation,
                                        initialSelectedIndex: selectedImprovisationIndex == index
                                            ? matchState.selectedDurationIndex
                                            : null,
                                        onDurationIndexChanged: (durationIndex) =>
                                            context.read<MatchCubit>().setDurationIndex(durationIndex),
                                      ),
                                    )
                                  : null;
                              final content = Column(
                                children: [
                                  if (!summarySelected && improvisation != null) ...[
                                    ImprovisationCard(
                                      improvisation: improvisation,
                                      improvisationFieldsOrder: settingsState.improvisationFieldsOrder,
                                      index: index,
                                      onEdit: (improvisation) async =>
                                          await _editImprovisation(context, match, improvisation),
                                      onDelete: canRemoveImprovisation
                                          ? (improvisation) async =>
                                                await _deleteImprovisation(context, improvisation, index)
                                          : null,
                                    ),
                                    if (match.enableStatistics) ...[
                                      ImprovisationStatistics(
                                        key: ValueKey(improvisation.hashCode),
                                        match: match,
                                        improvisation: improvisation,
                                        onPointChanged: (improvisationId, teamId, value) =>
                                            context.read<MatchCubit>().setPoint(improvisationId, teamId, value),
                                        editPenalty: _editPenalty,
                                        addPenalty: _addPenalty,
                                        removePenalty: _removePenalty,
                                      ),
                                    ],
                                  ] else ...[
                                    BlocBuilder<IntegrationsCubit, IntegrationsState>(
                                      builder: (context, integrationsState) {
                                        final integration = integrationsState.integrations
                                            .whereType<MatchIntegrationBase>()
                                            .firstWhereOrNull((i) => i.integrationId == match.integrationId);

                                        return MatchSummary(
                                          match: match,
                                          onShare: () => _share(context, match),
                                          onExportIntegration: integration != null
                                              ? () async {
                                                  await _onExportIntegration(context, match, integration);
                                                }
                                              : null,
                                        );
                                      },
                                    ),
                                  ],
                                ],
                              );
                              return LayoutBuilder(
                                builder: (context, constraints) {
                                  final textScale = MediaQuery.textScalerOf(context).scale(16) / 16;
                                  if (constraints.maxHeight < 200 * textScale) {
                                    return SingleChildScrollView(child: Column(children: [?timer, content]));
                                  }
                                  return Column(
                                    children: [
                                      ?timer,
                                      Expanded(child: SingleChildScrollView(child: content)),
                                    ],
                                  );
                                },
                              );
                            },
                            itemCount: match.improvisations.length + (match.enableStatistics ? 1 : 0),
                          ),
                        );
                      },
                    );
                  },
                ),
              };
            },
          );
        },
      ),
    );
  }

  Future<void> _share(BuildContext context, MatchModel match) async {
    final action = await context.read<RouterService>().showShareMenuModal(showShareFile: true, showSaveFile: true);
    if (!context.mounted || action == null) return;
    switch (action) {
      case ShareMenuAction.shareFile:
        await context.read<MatchCubit>().shareFile();
      case ShareMenuAction.saveFile:
        await context.read<MatchCubit>().saveFile();
      case ShareMenuAction.shareText:
        break;
    }
  }

  Future<void> _removePenalty(BuildContext context, PenaltyModel penalty) async {
    final matchCubit = context.read<MatchCubit>();
    final result = await context.read<RouterService>().showQuestion(
      question: S.of(context).areYouSureActionName(action: S.of(context).delete.toLowerCase(), name: penalty.type),
      yesLabel: S.of(context).delete,
      noLabel: S.of(context).cancel,
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
  ) async {
    final updatedPenalty = await context.read<RouterService>().showMatchPenaltyModal(
      improvisationId: improvisation.id,
      teams: match.teams,
      penalty: penalty,
      integrationPenaltyTypes: match.penaltyTypes,
    );
    if (updatedPenalty != null && context.mounted) {
      await context.read<MatchCubit>().editPenalty(updatedPenalty);
    }
  }

  Future<void> _addPenalty(BuildContext context, MatchModel match, ImprovisationModel improvisation) async {
    final penalty = await context.read<RouterService>().showMatchPenaltyModal(
      improvisationId: improvisation.id,
      teams: match.teams,
      integrationPenaltyTypes: match.penaltyTypes,
    );
    if (penalty != null && context.mounted) {
      await context.read<MatchCubit>().addPenalty(penalty);
    }
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
    final shouldDelete = await context.read<RouterService>().showQuestion(
      question: S
          .of(context)
          .areYouSureActionName(
            action: S.of(context).delete.toLowerCase(),
            name: S.of(context).improvisationNumber(order: index + 1),
          ),
      yesLabel: S.of(context).delete,
      noLabel: S.of(context).cancel,
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

    final result = await context.read<RouterService>().showMatchImprovisationModal(
      improvisation: improvisation,
      match: match,
    );
    if (result != null && context.mounted) {
      await context.read<MatchCubit>().editImprovisation(result.$1, result.$2);
    }
  }

  Future<void> _addImprovisation(BuildContext context, MatchModel match) async {
    final result = await context.read<RouterService>().showMatchImprovisationModal(match: match);
    if (result != null && context.mounted) {
      await context.read<MatchCubit>().addImprovisation(result.$1, result.$2);
    }
  }

  Future<void> _delete(BuildContext context, MatchModel match) async {
    final matchesCubit = context.read<MatchesCubit>();
    final result = await context.read<RouterService>().showQuestion(
      question: S.of(context).areYouSureActionName(action: S.of(context).delete.toLowerCase(), name: match.name),
      yesLabel: S.of(context).delete,
      noLabel: S.of(context).cancel,
    );
    if (result == true) {
      await matchesCubit.delete(match);
      if (context.mounted) {
        await context.pop();
      }
    }
  }

  Future<void> _editDetails(BuildContext context, MatchModel match) async {
    final updatedMatch = await context.read<RouterService>().showMatchDetailModal(match: match);
    if (updatedMatch != null && context.mounted) {
      await context.read<MatchCubit>().edit(updatedMatch);
    }
  }

  Future<void> _openScoreboard(BuildContext context, MatchModel match) async {
    await context.read<RouterService>().showMatchScoreboardModal(match);
  }

  Future<void> _onExportIntegration(BuildContext context, MatchModel match, MatchIntegrationBase integration) async {
    final toasterService = context.read<ToasterService>();
    final localizer = S.of(context);
    final result = await context.read<RouterService>().showQuestion(
      question: localizer.areYouSureActionName(action: localizer.shareMatchSheet.toLowerCase(), name: match.name),
      yesLabel: localizer.shareMatchSheet,
      noLabel: localizer.cancel,
    );
    if (result ?? false) {
      final exportResult = await integration.exportMatch(match);
      if (exportResult) {
        toasterService.show(title: localizer.toasterMatchResultShared, type: ToastificationType.success);
      } else {
        toasterService.show(title: localizer.toasterGenericError, type: ToastificationType.error);
      }
    }
  }
}
