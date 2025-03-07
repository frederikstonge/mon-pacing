import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:haptic_feedback/haptic_feedback.dart';

import '../../components/buttons/loading_icon_button.dart';
import '../../components/message_box_dialog/message_box_dialog.dart';
import '../../components/search/matches_search.dart';
import '../../components/sliver_logo_appbar/sliver_logo_appbar.dart';
import '../../components/sliver_scaffold/sliver_scaffold.dart';
import '../../components/timer_banner/timer_banner.dart';
import '../../cubits/feature_flags/feature_flags_cubit.dart';
import '../../cubits/feature_flags/feature_flags_state.dart';
import '../../cubits/matches/matches_cubit.dart';
import '../../cubits/matches/matches_state.dart';
import '../../cubits/matches/matches_status.dart';
import '../../cubits/settings/settings_cubit.dart';
import '../../cubits/settings/settings_state.dart';
import '../../cubits/timer/timer_cubit.dart';
import '../../cubits/timer/timer_state.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../models/constants.dart';
import '../../models/match_model.dart';
import '../../repositories/matches_repository.dart';
import '../../router/routes.dart';
import 'widgets/match_card.dart';

class MatchesPageView extends StatefulWidget {
  const MatchesPageView({super.key});

  @override
  State<MatchesPageView> createState() => _MatchesPageViewState();
}

class _MatchesPageViewState extends State<MatchesPageView> {
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
    return BlocBuilder<MatchesCubit, MatchesState>(
      builder: (context, matchesState) {
        return RefreshIndicator(
          edgeOffset: MediaQuery.of(context).padding.top + Constants.expandedAppbarHeight,
          onRefresh: context.read<MatchesCubit>().refresh,
          child: BlocBuilder<TimerCubit, TimerState>(
            builder: (context, timerState) {
              return SliverScaffold(
                scrollController: _scrollController,
                scrollPhysics: const AlwaysScrollableScrollPhysics(),
                banner: timerState.timer != null ? TimerBanner(timer: timerState.timer!) : null,
                appBar: BlocBuilder<SettingsCubit, SettingsState>(
                  builder: (context, settingsState) {
                    return SliverLogoAppbar(
                      title: S.of(context).matches,
                      theme: settingsState.theme,
                      primary: timerState.timer == null,
                      actions: [
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
                          tooltip: S.of(context).search(category: S.of(context).matches),
                          onPressed: () async {
                            final router = GoRouter.of(context);
                            final result = await MatchesSearch.showDialog(context, (
                              String search,
                              List<String> selectedTags,
                            ) async {
                              final response = await context.read<MatchesRepository>().search(search, selectedTags);
                              return response.map((e) => MatchModel.fromEntity(entity: e)).toList();
                            }, context.read<MatchesRepository>().getAllTags);
                            if (result != null) {
                              router.goNamed(Routes.match, pathParameters: {'id': result.id.toString()});
                            }
                          },
                        ),
                      ],
                    );
                  },
                ),
                slivers: [
                  switch (matchesState.status) {
                    MatchesStatus.initial => const SliverFillRemaining(
                      child: Center(child: CircularProgressIndicator()),
                    ),
                    MatchesStatus.error => SliverFillRemaining(child: Center(child: Text(matchesState.error ?? ''))),
                    _ => SliverList.builder(
                      itemCount: matchesState.hasMore ? matchesState.matches.length + 1 : matchesState.matches.length,
                      itemBuilder: (context, index) {
                        if (matchesState.hasMore && index == matchesState.matches.length) {
                          return const Center(child: CircularProgressIndicator());
                        }
                        final match = matchesState.matches.elementAt(index);
                        return MatchCard(
                          match: match,
                          onLongPress: () => context.read<SettingsCubit>().vibrate(HapticsType.selection),
                          edit: () => GoRouter.of(context).goNamed(Routes.match, pathParameters: {'id': '${match.id}'}),
                          shouldDelete:
                              () => MessageBoxDialog.questionShow(
                                context,
                                S
                                    .of(context)
                                    .areYouSureActionName(action: S.of(context).delete.toLowerCase(), name: match.name),
                                S.of(context).delete,
                                S.of(context).cancel,
                              ),
                          delete: () => context.read<MatchesCubit>().delete(match),
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
      await context.read<MatchesCubit>().fetch();
    }
  }
}
