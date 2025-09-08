import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '../../components/bottom_sheet/bottom_sheet_dialog.dart';
import '../../components/buttons/loading_icon_button.dart';
import '../../components/custom_scaffold/custom_scaffold.dart';
import '../../components/message_box_dialog/message_box_dialog.dart';
import '../../components/pacing_menu/pacing_menu.dart';
import '../../components/share_menu/share_menu.dart';
import '../../components/sliver_logo_appbar/sliver_logo_appbar.dart';
import '../../components/timer_banner/timer_banner.dart';
import '../../cubits/matches/matches_cubit.dart';
import '../../cubits/pacings/pacings_cubit.dart';
import '../../cubits/settings/settings_cubit.dart';
import '../../cubits/settings/settings_state.dart';
import '../../cubits/timer/timer_cubit.dart';
import '../../cubits/timer/timer_state.dart';
import '../../cubits/tutorials/tutorials_cubit.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../models/improvisation_model.dart';
import '../../models/pacing_model.dart';
import '../../repositories/pacings_repository.dart';
import '../../router/routes.dart';
import '../match_detail/match_detail_page_shell.dart';
import '../pacing_detail/pacing_detail_page_shell.dart';
import '../tutorial_mixin.dart';
import 'cubits/pacing_cubit.dart';
import 'cubits/pacing_state.dart';
import 'cubits/pacing_status.dart';
import 'widgets/improvisation_tile.dart';
import 'widgets/pacing_persistent_header.dart';

class PacingPageView extends StatefulWidget {
  const PacingPageView({super.key});

  @override
  State<PacingPageView> createState() => _PacingPageViewState();
}

class _PacingPageViewState extends State<PacingPageView> with TutorialMixin {
  late final GoRouter? router = GoRouter.maybeOf(context);
  final GlobalKey _addImprovisationButtonKey = GlobalKey();
  final GlobalKey _firstImprovisationCardKey = GlobalKey();
  final GlobalKey _firstImprovisationDragKey = GlobalKey();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    router?.routerDelegate.addListener(_showTutorials);
    super.initState();
  }

  @override
  void dispose() {
    router?.routerDelegate.removeListener(_showTutorials);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<PacingCubit, PacingState>(
        listener: (_, pacingState) {
          _showTutorials();
        },
        builder: (context, pacingState) {
          return switch (pacingState.status) {
            PacingStatus.initial => const Center(child: CircularProgressIndicator()),
            PacingStatus.loading => const Center(child: CircularProgressIndicator()),
            PacingStatus.error => Center(child: Text(pacingState.error ?? '')),
            PacingStatus.success => Builder(
              builder: (context) {
                final pacing = pacingState.pacing!;
                return BlocBuilder<TimerCubit, TimerState>(
                  builder: (context, timerState) {
                    return Form(
                      key: formKey,
                      child: CustomScaffold(
                        floatingActionButton: FloatingActionButton(
                          key: _addImprovisationButtonKey,
                          heroTag: 'pacing_tab',
                          onPressed: () => _onAddImprovisationPressed(context),
                          tooltip: S.of(context).addImprovisation,
                          child: const Icon(Icons.add),
                        ),
                        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [
                          if (timerState.timer != null) ...[TimerBanner(timer: timerState.timer!)],
                          BlocBuilder<SettingsCubit, SettingsState>(
                            builder: (context, settingsState) {
                              return SliverLogoAppbar(
                                title: pacing.name,
                                theme: settingsState.theme,
                                primary: timerState.timer == null,
                                actions: [
                                  LoadingIconButton(
                                    tooltip: S.of(context).more,
                                    onPressed: () => BottomSheetDialog.showDialog(
                                      context: context,
                                      child: PacingMenu(
                                        pacing: pacing,
                                        startMatch: () {
                                          _startMatch(context, pacing);
                                        },
                                        editDetails: () async {
                                          await _editDetails(context, pacing);
                                        },
                                        delete: () async {
                                          await _delete(context, pacing);
                                        },
                                        share: () async => BottomSheetDialog.showDialog(
                                          context: context,
                                          child: ShareMenu(
                                            shareText: () => context.read<PacingsCubit>().shareText(pacing),
                                            shareFile: () => context.read<PacingsCubit>().shareFile(pacing),
                                            saveFile: () => context.read<PacingsCubit>().saveFile(pacing),
                                          ),
                                        ),
                                        duplicate: () {
                                          return _duplicate(context, pacing);
                                        },
                                      ),
                                    ),
                                    icon: const Icon(Icons.more_vert),
                                  ),
                                ],
                              );
                            },
                          ),
                          SliverPersistentHeader(delegate: PacingPersistentHeader(pacing: pacing), pinned: true),
                        ],
                        body: CustomScrollView(
                          slivers: [
                            SliverReorderableList(
                              itemCount: pacing.improvisations.length,
                              itemBuilder: (context, index) {
                                final improvisation = pacing.improvisations.elementAt(index);
                                return ImprovisationTile(
                                  key: ValueKey(improvisation.id),
                                  cardKey: index == 0 ? _firstImprovisationCardKey : null,
                                  dragKey: index == 0 ? _firstImprovisationDragKey : null,
                                  pacing: pacing,
                                  improvisation: improvisation,
                                  index: index,
                                  getAllCategories: ({String? search}) async =>
                                      await _getAllCategories(context, search),
                                  onChanged: (value) => _onChanged(context, value),
                                  onConfirmDelete: (value) async => await _onConfirmDelete(context, index),
                                  onDelete: (value) => _onDelete(context, value),
                                  dragEnabled: pacing.improvisations.length > 1,
                                  onDragStart: _onDragStart,
                                );
                              },
                              onReorderStart: (index) => _onDragStart(),
                              onReorder: (oldIndex, newIndex) => _onReorder(context, oldIndex, newIndex),
                            ),
                            SliverPadding(
                              padding: EdgeInsets.only(top: 16 * 2, bottom: MediaQuery.paddingOf(context).bottom + 46),
                            ),
                          ],
                        ),
                      ),
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

  Future<void> _onReorder(BuildContext context, int oldIndex, int newIndex) =>
      context.read<PacingCubit>().moveImprovisation(oldIndex, newIndex);

  Future<void> _onDelete(BuildContext context, ImprovisationModel value) =>
      context.read<PacingCubit>().removeImprovisation(value);

  Future<bool?> _onConfirmDelete(BuildContext context, int index) async {
    return await MessageBoxDialog.questionShow(
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
  }

  Future<void> _onChanged(BuildContext context, ImprovisationModel value) =>
      context.read<PacingCubit>().editImprovisation(value);

  Future<List<String>> _getAllCategories(BuildContext context, String? search) async {
    return await context.read<PacingsRepository>().getAllCategories(search: search ?? '');
  }

  Future<void> _onAddImprovisationPressed(BuildContext context) => context.read<PacingCubit>().addImprovisation();

  Future<void> _duplicate(BuildContext context, PacingModel pacing) {
    return BottomSheetDialog.showDialog(
      context: context,
      child: PacingDetailPageShell(
        editMode: false,
        pacing: pacing.copyWith(
          id: 0,
          // Temporary id to support ReorderableListView
          improvisations: pacing.improvisations.map((e) => e.copyWith(id: -e.id)).toList(),
          tags: pacing.tags.map((e) => e.copyWith(id: 0)).toList(),
        ),
        onConfirm: (pacing, dialogContext) async {
          final navigator = Navigator.of(dialogContext);
          final router = GoRouter.of(context);
          final pacingModel = await context.read<PacingsCubit>().add(pacing);
          if (pacingModel != null) {
            navigator.pop();
            router.goNamed(Routes.pacing, pathParameters: {'id': '${pacingModel.id}'});
          }
        },
      ),
    );
  }

  Future<void> _delete(BuildContext context, PacingModel pacing) async {
    final pacingsCubit = context.read<PacingsCubit>();
    final router = GoRouter.of(context);
    final result = await MessageBoxDialog.questionShow(
      context,
      S.of(context).areYouSureActionName(action: S.of(context).delete.toLowerCase(), name: pacing.name),
      S.of(context).delete,
      S.of(context).cancel,
    );
    if (result == true) {
      await pacingsCubit.delete(pacing);
      router.pop();
    }
  }

  Future<void> _editDetails(BuildContext context, PacingModel pacing) async {
    await BottomSheetDialog.showDialog(
      context: context,
      child: PacingDetailPageShell(
        pacing: pacing,
        editMode: true,
        onConfirm: (pacing, dialogContext) async {
          final navigator = Navigator.of(dialogContext);
          await context.read<PacingCubit>().edit(pacing);
          navigator.pop();
        },
      ),
    );
  }

  void _startMatch(BuildContext context, PacingModel pacing) {
    BottomSheetDialog.showDialog(
      context: context,
      child: MatchDetailPageShell(
        pacing: pacing,
        onConfirm: (match, dialogContext) async {
          final navigator = Navigator.of(dialogContext);
          final router = GoRouter.of(context);
          final matchModel = await context.read<MatchesCubit>().add(match);
          if (matchModel != null) {
            navigator.pop();
            router.goNamed(Routes.match, pathParameters: {'id': '${matchModel.id}'});
          }
        },
      ),
    );
  }

  Future<void> _onDragStart() async {
    await context.read<SettingsCubit>().vibrate(HapticsType.selection);
  }

  Future<void> _showTutorials() async {
    if (!mounted) return;
    final pacingCubit = context.read<PacingCubit>();
    final tutorialsCubit = context.read<TutorialsCubit>();

    final displayAddImprovisation =
        router?.state.name == Routes.pacing &&
        pacingCubit.state.status == PacingStatus.success &&
        pacingCubit.state.pacing!.improvisations.isEmpty &&
        !tutorialsCubit.state.addImprovisationFinished;

    final displayImprovisation =
        router?.state.name == Routes.pacing &&
        pacingCubit.state.status == PacingStatus.success &&
        pacingCubit.state.pacing!.improvisations.isNotEmpty &&
        !tutorialsCubit.state.improvisationFinished;

    if (displayAddImprovisation) {
      initTutorialCoachMark(
        targets: [
          TargetFocus(
            keyTarget: _addImprovisationButtonKey,
            enableOverlayTab: true,
            shape: ShapeLightFocus.Circle,
            contents: [
              TargetContent(
                align: ContentAlign.top,
                child: Text(
                  S.of(context).tutorialAddImprovisation,
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.onInverseSurface),
                ),
              ),
            ],
          ),
        ],
      );
    } else if (displayImprovisation) {
      initTutorialCoachMark(
        targets: [
          TargetFocus(
            keyTarget: _firstImprovisationCardKey,
            enableOverlayTab: true,
            shape: ShapeLightFocus.RRect,
            contents: [
              TargetContent(
                align: ContentAlign.bottom,
                child: Text(
                  S.of(context).tutorialFirstImprovisationCard,
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.onInverseSurface),
                ),
              ),
            ],
          ),
          TargetFocus(
            keyTarget: _firstImprovisationDragKey,
            enableOverlayTab: true,
            shape: ShapeLightFocus.Circle,
            contents: [
              TargetContent(
                align: ContentAlign.bottom,
                child: Text(
                  S.of(context).tutorialFirstImprovisationDrag,
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.onInverseSurface),
                ),
              ),
            ],
          ),
        ],
      );
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 500), () {
        if (mounted && (displayAddImprovisation || displayImprovisation)) {
          showTutorialCoachMark(context, () {
            if (displayAddImprovisation) {
              tutorialsCubit.setAddImprovisationFinished();
            } else if (displayImprovisation) {
              tutorialsCubit.setImprovisationFinished();
            }
          });
        }
      });
    });
  }
}
