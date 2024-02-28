import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../components/bottom_sheet_dialog/bottom_sheet_dialog.dart';
import '../../components/sliver_logo_appbar/sliver_logo_appbar.dart';
import '../../components/sliver_scaffold/sliver_scaffold.dart';
import '../../cubits/pacing/pacing_cubit.dart';
import '../../cubits/pacing/pacing_state.dart';
import '../../cubits/pacings/pacings_cubit.dart';
import '../../l10n/app_localizations.dart';
import 'widgets/improvisation_tile.dart';
import 'widgets/pacing_detail_view.dart';
import 'widgets/pacing_persistent_header.dart';

class PacingPageView extends StatelessWidget {
  const PacingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PacingCubit, PacingState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            error: (error) => Center(child: Text(error)),
            success: (pacing) => SliverScaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: () => context.read<PacingCubit>().addImprovisation(),
                tooltip: 'Add improvistion',
                child: const Icon(Icons.add),
              ),
              slivers: [
                SliverLogoAppbar(
                  title: pacing.name,
                  actions: [
                    IconButton(
                      onPressed: () {
                        BottomSheetDialog.showDialog(
                          context: context,
                          child: PacingDetailView(
                            pacing: pacing,
                            onConfirm: (pacing) async {
                              context.read<PacingCubit>().edit(pacing);
                            },
                          ),
                        );
                      },
                      tooltip: S.of(context).editPacing,
                      icon: const Icon(Icons.edit),
                    ),
                    IconButton(
                      onPressed: () async {
                        final router = GoRouter.of(context);
                        await context.read<PacingsCubit>().edit(pacing);
                        router.pop();
                      },
                      tooltip: S.of(context).save,
                      icon: const Icon(Icons.save),
                    ),
                  ],
                ),
                SliverPersistentHeader(
                  delegate: PacingPersistentHeader(pacing: pacing),
                  pinned: true,
                ),
                SliverReorderableList(
                  itemCount: pacing.improvisations.length,
                  itemBuilder: (context, index) {
                    final improvisation = pacing.improvisations.elementAt(index);
                    return ImprovisationTile(
                      key: ValueKey(improvisation.id),
                      improvisation: improvisation,
                      index: index,
                      onChanged: (value) => context.read<PacingCubit>().editImprovisation(value),
                    );
                  },
                  onReorder: (oldIndex, newIndex) => context.read<PacingCubit>().moveImprovisation(oldIndex, newIndex),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
