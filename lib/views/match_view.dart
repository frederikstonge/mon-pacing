import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/match_cubit.dart';
import '../dialogs/will_pop_dialog.dart';
import '../generated/l10n.dart';
import '../models/match_model.dart';
import '../widgets/match_improvisation.dart';
import '../pages/match_options_page.dart';
import 'match_summary_view.dart';

class MatchView extends StatefulWidget {
  const MatchView({super.key});

  @override
  State<MatchView> createState() => _MatchViewState();
}

class _MatchViewState extends State<MatchView> {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    var matchCubit = context.read<MatchCubit>();
    if (matchCubit.state.teams.isEmpty) {
      Future.microtask(() {
        matchCubit.initialize();
        openMatchOptions(context, matchCubit);
      });
    }

    return WillPopScope(
      onWillPop: () async {
        var result = await WillPopDialog.showWillPopDialog(
          context,
          S.of(context).MatchView_WillPopDialog_Title,
          S.of(context).MatchView_WillPopDialog_Title,
        );
        return result ?? false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: BlocBuilder<MatchCubit, MatchModel>(builder: (_, state) => Text(state.name)),
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
          controller: _pageController,
          children: matchCubit.state.improvisations.map((e) => MatchImprovisation(improvisation: e)).toList(),
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
