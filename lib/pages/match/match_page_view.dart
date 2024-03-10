import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_up_panel2/sliding_up_panel2.dart';

import '../../components/actions/loading_icon_button.dart';
import '../../components/bottom_sheet_dialog/bottom_sheet_dialog.dart';
import '../../components/sliver_logo_appbar/sliver_logo_appbar.dart';
import '../../components/sliver_scaffold/sliver_scaffold.dart';
import '../../l10n/app_localizations.dart';
import '../match_detail/pacing_detail_page_shell.dart';
import 'cubits/match_cubit.dart';
import 'cubits/match_state.dart';

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
            success: (match) => SlidingUpPanel(
              body: SliverScaffold(
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
                ],
              ),
              parallaxEnabled: false,
              renderPanelSheet: false,
              margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              maxHeight: MediaQuery.of(context).size.height,
              panelBuilder: () => BottomSheet(
                constraints: const BoxConstraints.expand(),
                dragHandleColor: Theme.of(context).colorScheme.onPrimary.withAlpha(100),
                backgroundColor: Theme.of(context).colorScheme.primary,
                onClosing: () {},
                builder: (context) => Padding(
                  padding: EdgeInsets.only(
                      bottom: (MediaQuery.of(context).viewInsets.bottom > 0
                              ? MediaQuery.of(context).viewInsets.bottom
                              : MediaQuery.of(context).padding.bottom) +
                          MediaQuery.of(context).padding.top),
                  child: DefaultTextStyle.merge(
                    style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text('test'),
                        Expanded(
                          child: Placeholder(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
