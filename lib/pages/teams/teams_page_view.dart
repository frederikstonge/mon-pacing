import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haptic_feedback/haptic_feedback.dart';

import '../../components/bottom_sheet/bottom_sheet_dialog.dart';
import '../../components/buttons/loading_icon_button.dart';
import '../../components/custom_scaffold/custom_scaffold.dart';
import '../../components/message_box_dialog/message_box_dialog.dart';
import '../../components/sliver_logo_appbar/sliver_logo_appbar.dart';
import '../../components/tag_filters/pinned_tag_filters.dart';
import '../../components/timer_banner/timer_banner.dart';
import '../../cubits/settings/settings_cubit.dart';
import '../../cubits/settings/settings_state.dart';
import '../../cubits/teams/teams_cubit.dart';
import '../../cubits/teams/teams_state.dart';
import '../../cubits/teams/teams_status.dart';
import '../../cubits/timer/timer_cubit.dart';
import '../../cubits/timer/timer_state.dart';
import '../../l10n/generated/app_localizations.dart';
import '../team_detail/team_detail_page_shell.dart';
import 'widgets/team_card.dart';

class TeamsPageView extends StatefulWidget {
  const TeamsPageView({super.key});

  @override
  State<TeamsPageView> createState() => _TeamsPageViewState();
}

class _TeamsPageViewState extends State<TeamsPageView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TeamsCubit, TeamsState>(
      builder: (context, teamsState) {
        return BlocBuilder<TimerCubit, TimerState>(
          builder: (context, timerState) {
            return CustomScaffold(
              scrollPhysics: const AlwaysScrollableScrollPhysics(),
              floatingActionButton: FloatingActionButton(
                heroTag: 'teams_fab',
                onPressed: () {
                  BottomSheetDialog.showDialog(
                    context: context,
                    child: TeamDetailPageShell(
                      editMode: false,
                      onConfirm: (team, dialogContext) async {
                        final navigator = Navigator.of(dialogContext);
                        await context.read<TeamsCubit>().add(team);
                        navigator.pop();
                      },
                    ),
                  );
                },
                tooltip: S.of(context).createNewTeamTooltip,
                child: const Icon(Icons.add),
              ),
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                if (timerState.timer != null) ...[TimerBanner(timer: timerState.timer!)],
                BlocBuilder<SettingsCubit, SettingsState>(
                  builder: (context, settingsState) {
                    return SliverLogoAppbar(
                      title: S.of(context).teams,
                      theme: settingsState.theme,
                      primary: timerState.timer == null,
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
                if (teamsState.tags.isNotEmpty) ...[
                  SliverPersistentHeader(
                    delegate: PinnedTagFilters(
                      allTags: teamsState.tags,
                      selectedTags: teamsState.selectedTags,
                      onTagSelected: context.read<TeamsCubit>().selectTag,
                      onTagDeselected: context.read<TeamsCubit>().deselectTag,
                    ),
                    pinned: true,
                    floating: false,
                  ),
                ],
              ],
              body: RefreshIndicator(
                onRefresh: context.read<TeamsCubit>().refresh,
                child: CustomScrollView(
                  slivers: [
                    switch (teamsState.status) {
                      TeamsStatus.initial => const SliverFillRemaining(
                        child: Center(child: CircularProgressIndicator()),
                      ),
                      TeamsStatus.error => SliverFillRemaining(child: Center(child: Text(teamsState.error ?? ''))),
                      _ => SliverList.builder(
                        itemCount: teamsState.hasMore ? teamsState.teams.length + 1 : teamsState.teams.length,
                        itemBuilder: (context, index) {
                          if (teamsState.hasMore && index == teamsState.teams.length) {
                            if (teamsState.status == TeamsStatus.success) {
                              context.read<TeamsCubit>().fetch();
                            }
                            return const Center(child: CircularProgressIndicator());
                          }

                          final team = teamsState.teams.elementAt(index);
                          return TeamCard(
                            team: team,
                            onLongPress: () => context.read<SettingsCubit>().vibrate(HapticsType.selection),
                            edit: () => BottomSheetDialog.showDialog(
                              context: context,
                              child: TeamDetailPageShell(
                                team: team,
                                editMode: true,
                                onConfirm: (team, dialogContext) async {
                                  final navigator = Navigator.of(dialogContext);
                                  await context.read<TeamsCubit>().edit(team);
                                  navigator.pop();
                                },
                              ),
                            ),
                            shouldDelete: () => MessageBoxDialog.questionShow(
                              context,
                              S
                                  .of(context)
                                  .areYouSureActionName(action: S.of(context).delete.toLowerCase(), name: team.name),
                              S.of(context).delete,
                              S.of(context).cancel,
                            ),
                            delete: () => context.read<TeamsCubit>().delete(team),
                            export: () => context.read<TeamsCubit>().export(team),
                            duplicate: () => BottomSheetDialog.showDialog(
                              context: context,
                              child: TeamDetailPageShell(
                                editMode: false,
                                team: team.copyWith(
                                  id: 0,
                                  // Temporary id to support ReorderableListView
                                  performers: team.performers.map((e) => e.copyWith(id: -e.id)).toList(),
                                  tags: team.tags.map((e) => e.copyWith(id: 0)).toList(),
                                ),
                                onConfirm: (team, dialogContext) async {
                                  final navigator = Navigator.of(dialogContext);
                                  await context.read<TeamsCubit>().add(team);
                                  navigator.pop();
                                },
                              ),
                            ),
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
        );
      },
    );
  }
}
