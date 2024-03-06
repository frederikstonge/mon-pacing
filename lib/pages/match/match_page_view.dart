import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/actions/loading_icon_button.dart';
import '../../components/bottom_sheet_dialog/bottom_sheet_dialog.dart';
import '../../components/sliver_logo_appbar/sliver_logo_appbar.dart';
import '../../components/sliver_scaffold/sliver_scaffold.dart';
import '../../cubits/match/match_cubit.dart';
import '../../cubits/match/match_state.dart';
import '../../l10n/app_localizations.dart';
import 'widgets/match_detail_view.dart';

class MatchPageView extends StatelessWidget {
  const MatchPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MatchCubit, MatchState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            error: (error) => Center(child: Text(error)),
            success: (match) => SliverScaffold(
              slivers: [
                SliverLogoAppbar(
                  title: match.name,
                  actions: [
                    LoadingIconButton(
                      onPressed: () async {
                        await BottomSheetDialog.showDialog(
                          context: context,
                          child: MatchDetailView(
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
              ],
            ),
          );
        },
      ),
    );
  }
}