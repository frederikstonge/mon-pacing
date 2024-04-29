import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../components/actions/loading_icon_button.dart';
import '../../components/bottom_sheet_dialog/bottom_sheet_dialog.dart';
import '../../components/message_box_dialog/message_box_dialog.dart';
import '../../components/sliver_logo_appbar/sliver_logo_appbar.dart';
import '../../components/sliver_scaffold/sliver_scaffold.dart';
import '../../components/timer_banner/timer_banner.dart';
import '../../cubits/pacings/pacings_cubit.dart';
import '../../l10n/app_localizations.dart';
import '../pacing_detail/pacing_detail_page_shell.dart';
import 'cubits/pacing_cubit.dart';
import 'cubits/pacing_state.dart';
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
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            error: (error) => Center(child: Text(error)),
            success: (pacing) => PopScope(
              canPop: false,
              onPopInvoked: (didPop) async {
                if (didPop) return;
                final router = GoRouter.of(context);
                if (context.read<PacingCubit>().initialPacing != pacing) {
                  final response = await MessageBoxDialog.questionShow(
                    context,
                    S.of(context).discardChanges,
                    S.of(context).confirm,
                    S.of(context).cancel,
                  );
                  if (response == true) {
                    router.pop();
                  }
                } else {
                  router.pop();
                }
              },
              child: SliverScaffold(
                floatingActionButton: FloatingActionButton(
                  onPressed: () => context.read<PacingCubit>().addImprovisation(),
                  tooltip: S.of(context).addImprovisation,
                  child: const Icon(Icons.add),
                ),
                appBar: SliverLogoAppbar(
                  title: pacing.name,
                  actions: [
                    LoadingIconButton(
                      onPressed: () async {
                        await BottomSheetDialog.showDialog(
                          context: context,
                          child: PacingDetailPageShell(
                            pacing: pacing,
                            editMode: true,
                            onConfirm: (pacing) async {
                              context.read<PacingCubit>().edit(pacing);
                            },
                          ),
                        );
                      },
                      tooltip: S.of(context).editPacing,
                      icon: const Icon(Icons.edit),
                    ),
                    LoadingIconButton(
                      onPressed: () async {
                        if (formKey.currentState?.validate() ?? false) {
                          final router = GoRouter.of(context);
                          await context.read<PacingsCubit>().edit(pacing);
                          router.pop();
                        }
                      },
                      tooltip: S.of(context).save,
                      icon: const Icon(Icons.save),
                    ),
                  ],
                ),
                slivers: [
                  const TimerBanner(),
                  SliverPersistentHeader(
                    delegate: PacingPersistentHeader(pacing: pacing),
                    pinned: true,
                  ),
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
                          onChanged: (value) => context.read<PacingCubit>().editImprovisation(index, value),
                          onConfirmDelete: (value) async => await MessageBoxDialog.questionShow(
                            context,
                            S.of(context).areYouSure(S.of(context).delete.toLowerCase(), S.of(context).improvisationNumber(index + 1)),
                            S.of(context).delete,
                            S.of(context).cancel,
                          ),
                          onDelete: (value) async => context.read<PacingCubit>().removeImprovisation(index),
                          dragEnabled: pacing.improvisations.length > 1,
                        );
                      },
                      onReorder: (oldIndex, newIndex) => context.read<PacingCubit>().moveImprovisation(oldIndex, newIndex),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
