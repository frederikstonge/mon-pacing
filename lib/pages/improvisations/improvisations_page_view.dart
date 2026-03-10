import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/bottom_sheet/bottom_sheet_dialog.dart';
import '../../components/custom_card/custom_card.dart';
import '../../components/improvisation_detail/improvisation_short_detail.dart';
import '../../components/sliver_logo_appbar/sliver_logo_appbar.dart';
import '../../components/timer_banner/timer_banner.dart';
import '../../cubits/improvisations/improvisations_cubit.dart';
import '../../cubits/improvisations/improvisations_state.dart';
import '../../cubits/improvisations/improvisations_status.dart';
import '../../cubits/settings/settings_cubit.dart';
import '../../cubits/settings/settings_state.dart';
import '../../cubits/timer/timer_cubit.dart';
import '../../cubits/timer/timer_state.dart';
import '../../l10n/generated/app_localizations.dart';
import '../improvisation_detail/improvisation_detail_page_shell.dart';

class ImprovisationsPageView extends StatefulWidget {
  const ImprovisationsPageView({super.key});

  @override
  State<ImprovisationsPageView> createState() => _ImprovisationsPageViewState();
}

class _ImprovisationsPageViewState extends State<ImprovisationsPageView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImprovisationsCubit, ImprovisationsState>(
      builder: (context, improvisationsState) {
        return BlocBuilder<TimerCubit, TimerState>(
          builder: (context, timerState) {
            return Scaffold(
              floatingActionButton: FloatingActionButton(
                heroTag: 'improvisations_fab',
                onPressed: () {
                  BottomSheetDialog.showDialog(
                    context: context,
                    child: ImprovisationDetailPageShell(
                      improvisation: null,
                      match: null,
                      onConfirm: (improvisation, index, dialogContext) async {
                        final navigator = Navigator.of(dialogContext);
                        await context.read<ImprovisationsCubit>().add(improvisation);
                        navigator.pop();
                      },
                    ),
                  );
                },
                tooltip: S.of(context).addImprovisation,
                child: const Icon(Icons.add),
              ),
              body: RefreshIndicator(
                onRefresh: context.read<ImprovisationsCubit>().refresh,
                child: CustomScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  slivers: [
                    if (timerState.timer != null) ...[TimerBanner(timer: timerState.timer!)],
                    BlocBuilder<SettingsCubit, SettingsState>(
                      builder: (context, settingsState) {
                        return SliverLogoAppbar(
                          title: S.of(context).improvisations,
                          theme: settingsState.theme,
                          primary: timerState.timer == null,
                        );
                      },
                    ),
                    switch (improvisationsState.status) {
                      ImprovisationsStatus.initial => const SliverFillRemaining(
                        child: Center(child: CircularProgressIndicator()),
                      ),
                      ImprovisationsStatus.error => SliverFillRemaining(
                        child: Center(child: Text(improvisationsState.error ?? '')),
                      ),
                      _ => SliverList.builder(
                        itemCount: improvisationsState.hasMore
                            ? improvisationsState.improvisations.length + 1
                            : improvisationsState.improvisations.length,
                        itemBuilder: (context, index) {
                          if (improvisationsState.hasMore && index == improvisationsState.improvisations.length) {
                            if (improvisationsState.status == ImprovisationsStatus.success) {
                              context.read<ImprovisationsCubit>().fetch();
                            }
                            return const Center(child: CircularProgressIndicator());
                          }

                          final improvisation = improvisationsState.improvisations.elementAt(index);
                          return InkWell(
                            onTap: () => BottomSheetDialog.showDialog(
                              context: context,
                              child: ImprovisationDetailPageShell(
                                improvisation: improvisation,
                                match: null,
                                onConfirm: (improvisation, index, dialogContext) async {
                                  final navigator = Navigator.of(dialogContext);
                                  await context.read<ImprovisationsCubit>().edit(improvisation);
                                  navigator.pop();
                                },
                              ),
                            ),
                            child: CustomCard(
                              child: ImprovisationShortDetail(
                                improvisation: improvisation,
                                improvisationFieldsOrder: context.read<SettingsCubit>().state.improvisationFieldsOrder,
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
