import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:haptic_feedback/haptic_feedback.dart';

import '../../components/message_box_dialog/message_box_dialog.dart';
import '../../components/sliver_logo_appbar/sliver_logo_appbar.dart';
import '../../components/sliver_scaffold/sliver_scaffold.dart';
import '../../components/timer_banner/timer_banner.dart';
import '../../cubits/matches/matches_cubit.dart';
import '../../cubits/matches/matches_state.dart';
import '../../cubits/settings/settings_cubit.dart';
import '../../l10n/app_localizations.dart';
import '../../models/constants.dart';
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
            appBar: SliverLogoAppbar(
              title: S.of(context).matches,
            ),
            slivers: [
              const TimerBanner(),
              state.when(
                initial: () => const SliverFillRemaining(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
                error: (error) => SliverFillRemaining(
                  child: Center(
                    child: Text(error),
                  ),
                ),
                success: (matches, hasMore) => SliverList.builder(
                  itemCount: hasMore ? matches.length + 1 : matches.length,
                  itemBuilder: (context, index) {
                    if (hasMore && index != 0 && index == matches.length) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    final match = matches.elementAt(index);
                    return MatchCard(
                      match: match,
                      onLongPress: () => context.read<SettingsCubit>().vibrate(HapticsType.selection),
                      edit: () => GoRouter.of(context).goNamed(Routes.match, pathParameters: {'id': '${match.id}'}),
                      shouldDelete: () => MessageBoxDialog.questionShow(
                        context,
                        S.of(context).areYouSure(S.of(context).delete.toLowerCase(), match.name),
                        S.of(context).delete,
                        S.of(context).cancel,
                      ),
                      delete: () => context.read<MatchesCubit>().delete(match),
                    );
                  },
                ),
              ),
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
