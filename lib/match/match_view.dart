import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'match_cubit.dart';
import '../dialogs/will_pop_dialog.dart';
import '../models/match_model.dart';
import 'improvisation_view.dart';
import 'match_options_page.dart';
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
        var result = await WillPopDialog.showWillPopDialog(context);
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
              tooltip: "View match summary",
            ),
            IconButton(
              onPressed: () {
                openMatchOptions(context, matchCubit);
              },
              icon: const Icon(Icons.edit),
              tooltip: "Edit details",
            ),
          ],
        ),
        body: PageView(
          controller: _pageController,
          children: matchCubit.state.improvisations.map((e) => ImprovisationView(improvisation: e)).toList(),
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
