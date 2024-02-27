import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/bottom_sheet_dialog/bottom_sheet_dialog.dart';
import '../../components/sliver_logo_appbar/sliver_logo_appbar.dart';
import '../../components/sliver_scaffold/sliver_scaffold.dart';
import '../../cubits/pacing/pacing_cubit.dart';
import '../../cubits/pacing/pacing_state.dart';
import '../../cubits/pacings/pacings_cubit.dart';
import '../../l10n/app_localizations.dart';
import 'widgets/pacing_detail_view.dart';

class PacingPageView extends StatelessWidget {
  const PacingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PacingCubit, PacingState>(
      builder: (context, state) {
        return state.when(
          initial: () => const Center(child: CircularProgressIndicator()),
          error: (error) => Center(child: Text(error)),
          success: (pacing) => SliverScaffold(
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
                    onPressed: () {
                      context.read<PacingsCubit>().edit(pacing);
                    },
                    tooltip: S.of(context).save,
                    icon: const Icon(Icons.save),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
