import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/actions/loading_icon_button.dart';
import '../../components/bottom_sheet_dialog/bottom_sheet_dialog.dart';
import '../../components/sliver_logo_appbar/sliver_logo_appbar.dart';
import '../../l10n/app_localizations.dart';
import '../match_detail/pacing_detail_page_shell.dart';
import 'cubits/match_cubit.dart';
import 'cubits/match_state.dart';
import 'widgets/match_panel.dart';
import 'widgets/scoreboard.dart';
import 'widgets/scorecard.dart';

class MatchPageView extends StatefulWidget {
  static const scoreboardHeight = 100.0;
  const MatchPageView({super.key});

  @override
  State<MatchPageView> createState() => _MatchPageViewState();
}

class _MatchPageViewState extends State<MatchPageView> {
  late final ScrollController scrollController;

  @override
  void initState() {
    scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MatchCubit, MatchState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            error: (error) => Center(child: Text(error)),
            success: (match) => MatchPanel(
              scrollController: scrollController,
              slivers: [
                SliverLogoAppbar(
                  title: match.name,
                  actions: [
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
                const SliverFillRemaining(child: Placeholder()),
              ],
              panelHeader: Scoreboard(match: match, height: MatchPageView.scoreboardHeight),
              panelBody: Scorecard(match: match, scrollController: scrollController),
            ),
          );
        },
      ),
    );
  }
}
