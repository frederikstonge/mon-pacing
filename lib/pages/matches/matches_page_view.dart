import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:haptic_feedback/haptic_feedback.dart';

import '../../components/actions/loading_icon_button.dart';
import '../../components/message_box_dialog/message_box_dialog.dart';
import '../../components/search_dialog/matches_search.dart';
import '../../components/sliver_logo_appbar/sliver_logo_appbar.dart';
import '../../components/sliver_scaffold/sliver_scaffold.dart';
import '../../components/timer_banner/timer_banner.dart';
import '../../cubits/feature_flags/feature_flags_cubit.dart';
import '../../cubits/feature_flags/feature_flags_state.dart';
import '../../cubits/matches/matches_cubit.dart';
import '../../cubits/matches/matches_state.dart';
import '../../cubits/settings/settings_cubit.dart';
import '../../cubits/settings/settings_state.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../models/constants.dart';
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
      builder: (context, state) {
        return RefreshIndicator(
          edgeOffset: MediaQuery.of(context).padding.top + Constants.expandedAppbarHeight,
          onRefresh: context.read<MatchesCubit>().refresh,
          child: SliverScaffold(
            scrollController: _scrollController,
            scrollPhysics: const AlwaysScrollableScrollPhysics(),
            appBar: BlocBuilder<SettingsCubit, SettingsState>(
              builder: (context, state) {
                return SliverLogoAppbar(
                  title: S.of(context).matches,
                  theme: state.theme,
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
                        final result = await MatchesSearch.showDialog(
                          context,
                          context.read<MatchesRepository>().search,
                          context.read<MatchesRepository>().getAllTags,
                        );
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
              const TimerBanner(),
              switch (state.status) {
                MatchesStatus.initial => const SliverFillRemaining(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                MatchesStatus.error => SliverFillRemaining(
                    child: Center(
                      child: Text(state.error ?? ''),
                    ),
                  ),
                _ => SliverList.builder(
                    itemCount: state.hasMore ? state.matches.length + 1 : state.matches.length,
                    itemBuilder: (context, index) {
                      if (state.hasMore && index == state.matches.length) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      final match = state.matches.elementAt(index);
                      return MatchCard(
                        match: match,
                        onLongPress: () => context.read<SettingsCubit>().vibrate(HapticsType.selection),
                        edit: () => GoRouter.of(context).goNamed(Routes.match, pathParameters: {'id': '${match.id}'}),
                        shouldDelete: () => MessageBoxDialog.questionShow(
                          context,
                          S.of(context).areYouSure(action: S.of(context).delete.toLowerCase(), name: match.name),
                          S.of(context).delete,
                          S.of(context).cancel,
                        ),
                        delete: () => context.read<MatchesCubit>().delete(match),
                      );
                    },
                  ),
              },
            ],
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
