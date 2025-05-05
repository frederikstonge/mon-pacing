import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:haptic_feedback/haptic_feedback.dart';

import '../../components/bottom_sheet/bottom_sheet_dialog.dart';
import '../../components/buttons/loading_icon_button.dart';
import '../../components/message_box_dialog/message_box_dialog.dart';
import '../../components/pacing_menu/pacing_menu.dart';
import '../../components/sliver_logo_appbar/sliver_logo_appbar.dart';
import '../../components/sliver_scaffold/sliver_scaffold.dart';
import '../../components/timer_banner/timer_banner.dart';
import '../../cubits/matches/matches_cubit.dart';
import '../../cubits/pacings/pacings_cubit.dart';
import '../../cubits/settings/settings_cubit.dart';
import '../../cubits/settings/settings_state.dart';
import '../../cubits/timer/timer_cubit.dart';
import '../../cubits/timer/timer_state.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../repositories/pacings_repository.dart';
import '../../router/routes.dart';
import '../match_detail/match_detail_page_shell.dart';
import '../pacing_detail/pacing_detail_page_shell.dart';
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

class _PacingPageViewState extends State<PacingPageView> {
  late final GlobalKey<FormState> formKey;

  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PacingCubit, PacingState>(
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
                    return SliverScaffold(
                      floatingActionButton: FloatingActionButton(
                        heroTag: 'pacing_tab',
                        onPressed: () => context.read<PacingCubit>().addImprovisation(),
                        tooltip: S.of(context).addImprovisation,
                        child: const Icon(Icons.add),
                      ),
                      banner: timerState.timer != null ? TimerBanner(timer: timerState.timer!) : null,
                      appBar: BlocBuilder<SettingsCubit, SettingsState>(
                        builder: (context, settingsState) {
                          return SliverLogoAppbar(
                            title: pacing.name,
                            theme: settingsState.theme,
                            primary: timerState.timer == null,
                            actions: [
                              LoadingIconButton(
                                tooltip: S.of(context).more,
                                onPressed:
                                    () => BottomSheetDialog.showDialog(
                                      context: context,
                                      child: PacingMenu(
                                        pacing: pacing,
                                        startMatch: () {
                                          BottomSheetDialog.showDialog(
                                            context: context,
                                            child: MatchDetailPageShell(
                                              pacing: pacing,
                                              onConfirm: (match) async {
                                                final router = GoRouter.of(context);
                                                final matchModel = await context.read<MatchesCubit>().add(match);
                                                if (matchModel != null) {
                                                  router.pop();
                                                  router.goNamed(
                                                    Routes.match,
                                                    pathParameters: {'id': '${matchModel.id}'},
                                                  );
                                                  return true;
                                                }

                                                return false;
                                              },
                                            ),
                                          );
                                        },
                                        editDetails: () async {
                                          await BottomSheetDialog.showDialog(
                                            context: context,
                                            child: PacingDetailPageShell(
                                              pacing: pacing,
                                              editMode: true,
                                              onConfirm: (pacing) async {
                                                await context.read<PacingCubit>().edit(pacing);
                                                return true;
                                              },
                                            ),
                                          );
                                        },
                                        delete: () async {
                                          final pacingsCubit = context.read<PacingsCubit>();
                                          final router = GoRouter.of(context);
                                          final result = await MessageBoxDialog.questionShow(
                                            context,
                                            S
                                                .of(context)
                                                .areYouSureActionName(
                                                  action: S.of(context).delete.toLowerCase(),
                                                  name: pacing.name,
                                                ),
                                            S.of(context).delete,
                                            S.of(context).cancel,
                                          );
                                          if (result == true) {
                                            await pacingsCubit.delete(pacing);
                                            router.pop();
                                          }
                                        },
                                        export: () async {
                                          await context.read<PacingsCubit>().export(pacing);
                                        },
                                        duplicate: () {
                                          return BottomSheetDialog.showDialog(
                                            context: context,
                                            child: PacingDetailPageShell(
                                              editMode: false,
                                              pacing: pacing,
                                              onConfirm: (pacing) async {
                                                final router = GoRouter.of(context);
                                                final pacingModel = await context.read<PacingsCubit>().add(pacing);
                                                if (pacingModel != null) {
                                                  router.pop();
                                                  router.goNamed(
                                                    Routes.pacing,
                                                    pathParameters: {'id': '${pacingModel.id}'},
                                                  );
                                                  return true;
                                                }

                                                return false;
                                              },
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                icon: const Icon(Icons.more_vert),
                              ),
                            ],
                          );
                        },
                      ),
                      slivers: [
                        SliverPersistentHeader(delegate: PacingPersistentHeader(pacing: pacing), pinned: true),
                        Form(
                          key: formKey,
                          child: SliverReorderableList(
                            itemCount: pacing.improvisations.length,
                            itemBuilder: (context, index) {
                              final improvisation = pacing.improvisations.elementAt(index);
                              return ImprovisationTile(
                                key: ValueKey(improvisation.id),
                                pacing: pacing,
                                improvisation: improvisation,
                                index: index,
                                getAllCategories: ({String? search}) async {
                                  return await context.read<PacingsRepository>().getAllCategories(search: search ?? '');
                                },
                                onChanged: (value) => context.read<PacingCubit>().editImprovisation(index, value),
                                onConfirmDelete:
                                    (value) async => await MessageBoxDialog.questionShow(
                                      context,
                                      S
                                          .of(context)
                                          .areYouSureActionName(
                                            action: S.of(context).delete.toLowerCase(),
                                            name: S.of(context).improvisationNumber(order: index + 1),
                                          ),
                                      S.of(context).delete,
                                      S.of(context).cancel,
                                    ),
                                onDelete: (value) => context.read<PacingCubit>().removeImprovisation(index),
                                dragEnabled: pacing.improvisations.length > 1,
                                onDragStart: _onDragStart,
                              );
                            },
                            onReorderStart: (index) => _onDragStart(),
                            onReorder:
                                (oldIndex, newIndex) =>
                                    context.read<PacingCubit>().moveImprovisation(oldIndex, newIndex),
                          ),
                        ),
                      ],
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

  Future<void> _onDragStart() async {
    await context.read<SettingsCubit>().vibrate(HapticsType.selection);
  }
}
