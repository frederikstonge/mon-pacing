import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haptic_feedback/haptic_feedback.dart';

import '../../components/bottom_sheet/bottom_sheet_dialog.dart';
import '../../components/buttons/loading_icon_button.dart';
import '../../components/message_box_dialog/message_box_dialog.dart';
import '../../components/sliver_logo_appbar/sliver_logo_appbar.dart';
import '../../components/sliver_scaffold/sliver_scaffold.dart';
import '../../components/timer_banner/timer_banner.dart';
import '../../cubits/settings/settings_cubit.dart';
import '../../cubits/settings/settings_state.dart';
import '../../cubits/teams/teams_cubit.dart';
import '../../cubits/teams/teams_state.dart';
import '../../cubits/teams/teams_status.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../models/constants.dart';
import '../team_detail/team_detail_page_shell.dart';
import 'widgets/team_card.dart';

class TeamsPageView extends StatefulWidget {
  const TeamsPageView({super.key});

  @override
  State<TeamsPageView> createState() => _TeamsPageViewState();
}

class _TeamsPageViewState extends State<TeamsPageView> {
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
    return BlocBuilder<TeamsCubit, TeamsState>(
      builder: (context, state) {
        return RefreshIndicator(
          edgeOffset: MediaQuery.of(context).padding.top + Constants.expandedAppbarHeight,
          onRefresh: context.read<TeamsCubit>().refresh,
          child: SliverScaffold(
            scrollController: _scrollController,
            scrollPhysics: const AlwaysScrollableScrollPhysics(),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                BottomSheetDialog.showDialog(
                  context: context,
                  child: TeamDetailPageShell(
                    editMode: false,
                    onConfirm: (team) async {
                      await context.read<TeamsCubit>().add(team);
                    },
                  ),
                );
              },
              tooltip: S.of(context).createNewTeamTooltip,
              child: const Icon(Icons.add),
            ),
            appBar: BlocBuilder<SettingsCubit, SettingsState>(
              builder: (context, state) {
                return SliverLogoAppbar(
                  title: S.of(context).teams,
                  theme: state.theme,
                  actions: [
                    LoadingIconButton(
                      icon: const Icon(Icons.download),
                      tooltip: S.of(context).importTeamTooltip,
                      onPressed: () async => context.read<TeamsCubit>().import(),
                    ),
                  ],
                );
              },
            ),
            slivers: [
              const TimerBanner(),
              switch (state.status) {
                TeamsStatus.initial => const SliverFillRemaining(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                TeamsStatus.error => SliverFillRemaining(
                    child: Center(
                      child: Text(state.error ?? ''),
                    ),
                  ),
                _ => SliverList.builder(
                    itemCount: state.hasMore ? state.teams.length + 1 : state.teams.length,
                    itemBuilder: (context, index) {
                      if (state.hasMore && index == state.teams.length) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      final team = state.teams.elementAt(index);
                      return TeamCard(
                        team: team,
                        onLongPress: () => context.read<SettingsCubit>().vibrate(HapticsType.selection),
                        edit: () => BottomSheetDialog.showDialog(
                          context: context,
                          child: TeamDetailPageShell(
                            team: team,
                            editMode: true,
                            onConfirm: (team) async {
                              await context.read<TeamsCubit>().edit(team);
                            },
                          ),
                        ),
                        shouldDelete: () => MessageBoxDialog.questionShow(
                          context,
                          S.of(context).areYouSure(action: S.of(context).delete.toLowerCase(), name: team.name),
                          S.of(context).delete,
                          S.of(context).cancel,
                        ),
                        delete: () => context.read<TeamsCubit>().delete(team),
                        export: () => context.read<TeamsCubit>().export(team),
                        duplicate: () => BottomSheetDialog.showDialog(
                          context: context,
                          child: TeamDetailPageShell(
                            editMode: false,
                            team: team,
                            onConfirm: (team) async {
                              await context.read<TeamsCubit>().add(team);
                            },
                          ),
                        ),
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
      await context.read<TeamsCubit>().fetch();
    }
  }
}
