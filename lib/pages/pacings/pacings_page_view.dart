import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:kaisel/kaisel.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '../../components/bottom_sheet/bottom_sheet_dialog.dart';
import '../../components/buttons/loading_icon_button.dart';
import '../../components/message_box_dialog/message_box_dialog.dart';
import '../../components/share_menu/share_menu.dart';
import '../../components/sliver_logo_appbar/sliver_logo_appbar.dart';
import '../../components/tag_filters/pinned_tag_filters.dart';
import '../../components/timer_banner/timer_banner.dart';
import '../../cubits/integrations/integrations_cubit.dart';
import '../../cubits/integrations/integrations_state.dart';
import '../../cubits/matches/matches_cubit.dart';
import '../../cubits/pacings/pacings_cubit.dart';
import '../../cubits/pacings/pacings_state.dart';
import '../../cubits/pacings/pacings_status.dart';
import '../../cubits/settings/settings_cubit.dart';
import '../../cubits/settings/settings_state.dart';
import '../../cubits/timer/timer_cubit.dart';
import '../../cubits/timer/timer_state.dart';
import '../../cubits/tutorials/tutorials_cubit.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../models/pacing_model.dart';
import '../../router/routes.dart';
import '../../services/router_service.dart';
import '../pacings_search/pacings_search_page_view.dart';
import '../tutorial_mixin.dart';
import 'widgets/pacing_card.dart';

class PacingsPageView extends StatefulWidget {
  const PacingsPageView({super.key});

  @override
  State<PacingsPageView> createState() => _PacingsPageViewState();
}

class _PacingsPageViewState extends State<PacingsPageView> with TutorialMixin {
  KaiselRouter<PacingsRoute>? _pacingsRouter;
  final GlobalKey _addPacingButtonKey = GlobalKey();
  final GlobalKey _firstPacingCardKey = GlobalKey();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final router = context.router<PacingsRoute>();
    if (_pacingsRouter != router) {
      _pacingsRouter?.removeListener(_showTutorials);
      _pacingsRouter = router;
      _pacingsRouter?.addListener(_showTutorials);
    }
  }

  @override
  void dispose() {
    _pacingsRouter?.removeListener(_showTutorials);
    cancelTutorialCoachMark();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PacingsCubit, PacingsState>(
      listener: (_, _) {
        _showTutorials();
      },
      builder: (context, pacingsState) => BlocBuilder<TimerCubit, TimerState>(
        builder: (context, timerState) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              key: _addPacingButtonKey,
              heroTag: 'pacings_fab',
              onPressed: _addPacing,
              tooltip: S.of(context).createNewPacingTooltip,
              child: const Icon(Icons.add),
            ),
            body: RefreshIndicator(
              onRefresh: context.read<PacingsCubit>().refresh,
              child: CustomScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                slivers: [
                  if (timerState.timer != null) ...[TimerBanner(timer: timerState.timer!)],
                  BlocBuilder<SettingsCubit, SettingsState>(
                    builder: (context, settingsState) {
                      return SliverLogoAppbar(
                        title: S.of(context).pacings,
                        theme: settingsState.theme,
                        primary: timerState.timer == null,
                        actions: [
                          LoadingIconButton(
                            icon: const Icon(Icons.download),
                            tooltip: S.of(context).importPacingTooltip,
                            onPressed: () async => _onImportPressed(context),
                          ),
                          BlocBuilder<IntegrationsCubit, IntegrationsState>(
                            builder: (context, integrationsState) {
                              if (integrationsState.integrations.isNotEmpty) {
                                return LoadingIconButton(
                                  icon: const Icon(Icons.qr_code),
                                  tooltip: S.of(context).scanner,
                                  onPressed: () async => _onIntegrationPressed(context),
                                );
                              }
                              return SizedBox();
                            },
                          ),
                          LoadingIconButton(
                            icon: const Icon(Icons.search),
                            tooltip: S.of(context).search(category: S.of(context).pacings),
                            onPressed: () async => await _onSearchPressed(context),
                          ),
                        ],
                      );
                    },
                  ),
                  if (pacingsState.tags.isNotEmpty) ...[
                    SliverPersistentHeader(
                      delegate: PinnedTagFilters(
                        allTags: pacingsState.tags,
                        selectedTags: pacingsState.selectedTags,
                        onTagSelected: context.read<PacingsCubit>().selectTag,
                        onTagDeselected: context.read<PacingsCubit>().deselectTag,
                      ),
                      pinned: true,
                      floating: true,
                    ),
                  ],

                  switch (pacingsState.status) {
                    PacingsStatus.initial => const SliverFillRemaining(
                      child: Center(child: CircularProgressIndicator()),
                    ),
                    PacingsStatus.error => SliverFillRemaining(child: Center(child: Text(pacingsState.error ?? ''))),
                    _ => SliverList.builder(
                      itemCount: pacingsState.hasMore ? pacingsState.pacings.length + 1 : pacingsState.pacings.length,
                      itemBuilder: (context, index) {
                        if (pacingsState.hasMore && index == pacingsState.pacings.length) {
                          if (pacingsState.status == PacingsStatus.success) {
                            context.read<PacingsCubit>().fetch();
                          }
                          return const Center(child: CircularProgressIndicator());
                        }

                        final pacing = pacingsState.pacings.elementAt(index);
                        return PacingCard(
                          key: index == 0 ? _firstPacingCardKey : null,
                          pacing: pacing,
                          onLongPress: () => _onLongPress(context),
                          edit: () => _edit(context, pacing),
                          shouldDelete: () => _shouldDelete(context, pacing),
                          delete: () => _delete(context, pacing),
                          share: () => _share(context, pacing),
                          duplicate: () => _duplicate(context, pacing),
                          startMatch: () => _startMatch(context, pacing),
                        );
                      },
                    ),
                  },
                  SliverPadding(
                    padding: EdgeInsets.only(top: 16 * 2, bottom: MediaQuery.paddingOf(context).bottom + 46),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Future<PacingModel?> _onImportPressed(BuildContext context) => context.read<PacingsCubit>().import();

  Future<void> _onIntegrationPressed(BuildContext context) => context.router<AppRoute>().push(const ScannerRoute());

  Future<void> _onSearchPressed(BuildContext context) async {
    final routerService = context.read<RouterService>();
    final result = await PacingsSearchPageView.showDialog(context);
    if (result != null && context.mounted) {
      await routerService.showPacingDetails(result.id);
    }
  }

  Future<void> _onLongPress(BuildContext context) => context.read<SettingsCubit>().vibrate(HapticsType.selection);

  Future<void> _share(BuildContext context, PacingModel pacing) => BottomSheetDialog.showDialog(
    context: context,
    child: ShareMenu(
      shareText: () => context.read<PacingsCubit>().shareText(pacing),
      shareFile: () => context.read<PacingsCubit>().shareFile(pacing),
      saveFile: () => context.read<PacingsCubit>().saveFile(pacing),
    ),
  );

  Future<void> _delete(BuildContext context, PacingModel pacing) => context.read<PacingsCubit>().delete(pacing);

  void _edit(BuildContext context, PacingModel pacing) =>
      unawaited(context.read<RouterService>().showPacingDetails(pacing.id));

  Future<bool?> _shouldDelete(BuildContext context, PacingModel pacing) {
    return MessageBoxDialog.questionShow(
      context,
      S.of(context).areYouSureActionName(action: S.of(context).delete.toLowerCase(), name: pacing.name),
      S.of(context).delete,
      S.of(context).cancel,
    );
  }

  Future<void> _startMatch(BuildContext context, PacingModel pacing) {
    final routerService = context.read<RouterService>();
    return routerService.showMatchDetailModal(pacing: pacing).then((match) async {
      if (match == null || !context.mounted) {
        return;
      }
      final matchModel = await context.read<MatchesCubit>().add(match);
      if (matchModel != null && context.mounted) {
        await routerService.showMatchDetails(id: matchModel.id);
      }
    });
  }

  Future<void> _duplicate(BuildContext context, PacingModel pacing) {
    final routerService = context.read<RouterService>();
    return routerService.showPacingDetailModal(pacing: pacing, editMode: false).then((pacing) async {
      if (pacing == null || !context.mounted) {
        return;
      }
      final pacingModel = await context.read<PacingsCubit>().add(pacing);
      if (pacingModel != null && context.mounted) {
        await routerService.showPacingDetails(pacingModel.id);
      }
    });
  }

  Future<void> _addPacing() async {
    final routerService = context.read<RouterService>();
    final pacing = await routerService.showPacingDetailModal(editMode: false);
    if (pacing == null || !mounted) {
      return;
    }
    final pacingModel = await context.read<PacingsCubit>().add(pacing);
    if (pacingModel != null && mounted) {
      await routerService.showPacingDetails(pacingModel.id);
    }
  }

  void _showTutorials() {
    if (!mounted) return;
    final pacingsCubit = context.read<PacingsCubit>();
    final tutorialsCubit = context.read<TutorialsCubit>();

    bool displayAddPacing() =>
        _pacingsRouter?.stack.last is PacingsTabRoute &&
        pacingsCubit.state.status == PacingsStatus.success &&
        pacingsCubit.state.pacings.isEmpty &&
        !tutorialsCubit.state.addPacingFinished;

    bool displayStartMatch() =>
        _pacingsRouter?.stack.last is PacingsTabRoute &&
        pacingsCubit.state.status == PacingsStatus.success &&
        pacingsCubit.state.pacings.isNotEmpty &&
        !tutorialsCubit.state.startMatchFinished;

    if (displayAddPacing()) {
      initTutorialCoachMark(
        targets: [
          TargetFocus(
            keyTarget: _addPacingButtonKey,
            enableOverlayTab: true,
            shape: ShapeLightFocus.Circle,
            contents: [
              TargetContent(
                align: ContentAlign.top,
                child: Text(
                  S.of(context).tutorialAddPacing,
                  style: Theme.of(context).textTheme.titleLarge!
                      .copyWith(color: Theme.of(context).colorScheme.onInverseSurface),
                ),
              ),
            ],
          ),
        ],
        onFinish: tutorialsCubit.setAddPacingFinished,
      );
    } else if (displayStartMatch()) {
      initTutorialCoachMark(
        targets: [
          TargetFocus(
            keyTarget: _firstPacingCardKey,
            enableOverlayTab: true,
            shape: ShapeLightFocus.RRect,
            contents: [
              TargetContent(
                align: ContentAlign.bottom,
                child: Text(
                  S.of(context).tutorialStartMatch,
                  style: Theme.of(context).textTheme.titleLarge!
                      .copyWith(color: Theme.of(context).colorScheme.onInverseSurface),
                ),
              ),
            ],
          ),
        ],
        onFinish: tutorialsCubit.setStartMatchFinished,
      );
    } else {
      cancelTutorialCoachMark();
      return;
    }

    scheduleTutorialCoachMark(context, shouldShow: () => displayAddPacing() || displayStartMatch());
  }
}
