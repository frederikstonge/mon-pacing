import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/match_cubit.dart';
import '../dialogs/will_pop_dialog.dart';
import '../generated/l10n.dart';
import '../models/match_model.dart';
import '../widgets/match_improvisation.dart';
import '../pages/match_options_page.dart';
import 'match_summary_view.dart';

class MatchView extends StatelessWidget {
  const MatchView({super.key});

  @override
  Widget build(BuildContext context) {
    var matchCubit = context.read<MatchCubit>();
    if (matchCubit.state.teams.isEmpty) {
      Future.microtask(() {
        matchCubit.initialize();
        openMatchOptions(context, matchCubit);
      });
    }

    return BlocBuilder<MatchCubit, MatchModel>(
      builder: (context, state) => WillPopScope(
        onWillPop: () async {
          var result = await WillPopDialog.showWillPopDialog(
            context,
            S.of(context).MatchView_WillPopDialog_Title,
            S.of(context).MatchView_WillPopDialog_Content,
          );
          return result ?? false;
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(state.name, overflow: TextOverflow.ellipsis),
            actions: [
              IconButton(
                onPressed: () {
                  openMatchSummary(context, matchCubit);
                },
                icon: const Icon(Icons.summarize),
                tooltip: S.of(context).MatchView_ViewMatchSummary,
              ),
              IconButton(
                onPressed: () {
                  openMatchOptions(context, matchCubit);
                },
                icon: const Icon(Icons.edit),
                tooltip: S.of(context).MatchView_EditDetails,
              ),
            ],
          ),
          body: PageView(
            controller: matchCubit.pageController,
            children: matchCubit.state.improvisations.map((e) => MatchImprovisation(improvisation: e, match: state)).toList(),
          ),
        ),
      ),
    );
  }

  openMatchOptions(BuildContext context, MatchCubit matchCubit) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: ((context) => MatchOptionsPage(
              bloc: matchCubit,
            )),
      ),
    );
  }

  openMatchSummary(BuildContext context, MatchCubit matchCubit) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: ((context) => MatchSummaryView(
              bloc: matchCubit,
            )),
      ),
    );
  }
}
