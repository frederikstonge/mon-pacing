import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:haptic_feedback/haptic_feedback.dart';

import '../../components/bottom_sheet/bottom_sheet_dialog.dart';
import '../../components/buttons/loading_icon_button.dart';
import '../../components/message_box_dialog/message_box_dialog.dart';
import '../../components/sliver_logo_appbar/sliver_logo_appbar.dart';
import '../../components/sliver_scaffold/sliver_scaffold.dart';
import '../../components/timer_banner/timer_banner.dart';
import '../../cubits/feature_flags/feature_flags_cubit.dart';
import '../../cubits/feature_flags/feature_flags_state.dart';
import '../../cubits/matches/matches_cubit.dart';
import '../../cubits/pacings/pacings_cubit.dart';
import '../../cubits/pacings/pacings_state.dart';
import '../../cubits/pacings/pacings_status.dart';
import '../../cubits/settings/settings_cubit.dart';
import '../../cubits/settings/settings_state.dart';
import '../../cubits/timer/timer_cubit.dart';
import '../../cubits/timer/timer_state.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../models/constants.dart';
import '../../router/routes.dart';
import '../match_detail/match_detail_page_shell.dart';
import '../pacing_detail/pacing_detail_page_shell.dart';
import '../pacings_search/pacings_search_page_view.dart';
import 'widgets/pacing_card.dart';

class PacingsPageView extends StatefulWidget {
  const PacingsPageView({super.key});

  @override
  State<PacingsPageView> createState() => _PacingsPageViewState();
}

class _PacingsPageViewState extends State<PacingsPageView> {
  late ScrollController _scrollController;
  final _scrollThreshold = 200.0;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PacingsCubit, PacingsState>(
      builder: (context, pacingsState) {
        return RefreshIndicator(
          edgeOffset: MediaQuery.of(context).padding.top + Constants.expandedAppbarHeight,
          onRefresh: context.read<PacingsCubit>().refresh,
          child: BlocBuilder<TimerCubit, TimerState>(
            builder: (context, timerState) {
              return SliverScaffold(
                scrollController: _scrollController,
                scrollPhysics: const AlwaysScrollableScrollPhysics(),
                floatingActionButton: FloatingActionButton(
                  heroTag: 'pacings_fab',
                  onPressed: () {
                    BottomSheetDialog.showDialog(
                      context: context,
                      child: PacingDetailPageShell(
                        editMode: false,
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
                  },
                  tooltip: S.of(context).createNewPacingTooltip,
                  child: const Icon(Icons.add),
                ),
                banner: timerState.timer != null ? TimerBanner(timer: timerState.timer!) : null,
                appBar: BlocBuilder<SettingsCubit, SettingsState>(
                  builder: (context, settingsState) {
                    return SliverLogoAppbar(
                      title: S.of(context).pacings,
                      theme: settingsState.theme,
                      primary: timerState.timer == null,
                      actions: [
                        LoadingIconButton(
                          icon: const Icon(Icons.download),
                          tooltip: S.of(context).importPacingTooltip,
                          onPressed: () async => context.read<PacingsCubit>().import(),
                        ),
                        BlocBuilder<FeatureFlagsCubit, FeatureFlagsState>(
                          builder: (context, featureFlagState) {
                            if (featureFlagState.enableIntegrations) {
                              return LoadingIconButton(
                                icon: const Icon(Icons.qr_code),
                                tooltip: S.of(context).scanner,
                                onPressed: () async => context.pushNamed(Routes.scanner),
                              );
                            }
                            return SizedBox();
                          },
                        ),
                        LoadingIconButton(
                          icon: const Icon(Icons.search),
                          tooltip: S.of(context).search(category: S.of(context).pacings),
                          onPressed: () async {
                            final router = GoRouter.of(context);
                            final result = await PacingsSearchPageView.showDialog(context);
                            if (result != null) {
                              router.goNamed(Routes.pacing, pathParameters: {'id': result.id.toString()});
                            }
                          },
                        ),
                      ],
                    );
                  },
                ),
                slivers: [
                  switch (pacingsState.status) {
                    PacingsStatus.initial => const SliverFillRemaining(
                      child: Center(child: CircularProgressIndicator()),
                    ),
                    PacingsStatus.error => SliverFillRemaining(child: Center(child: Text(pacingsState.error ?? ''))),
                    _ => SliverList.builder(
                      itemCount: pacingsState.hasMore ? pacingsState.pacings.length + 1 : pacingsState.pacings.length,
                      itemBuilder: (context, index) {
                        if (pacingsState.hasMore && index == pacingsState.pacings.length) {
                          return const Center(child: CircularProgressIndicator());
                        }

                        final pacing = pacingsState.pacings.elementAt(index);
                        return PacingCard(
                          pacing: pacing,
                          onLongPress: () => context.read<SettingsCubit>().vibrate(HapticsType.selection),
                          edit: () =>
                              GoRouter.of(context).goNamed(Routes.pacing, pathParameters: {'id': '${pacing.id}'}),
                          shouldDelete: () => MessageBoxDialog.questionShow(
                            context,
                            S
                                .of(context)
                                .areYouSureActionName(action: S.of(context).delete.toLowerCase(), name: pacing.name),
                            S.of(context).delete,
                            S.of(context).cancel,
                          ),
                          delete: () => context.read<PacingsCubit>().delete(pacing),
                          export: () => context.read<PacingsCubit>().export(pacing),
                          duplicate: () {
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
                          },
                          startMatch: () => BottomSheetDialog.showDialog(
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
                          ),
                        );
                      },
                    ),
                  },
                ],
              );
            },
          ),
        );
      },
    );
  }

  Future<void> _onScroll() async {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      await context.read<PacingsCubit>().fetch();
    }
  }
}
