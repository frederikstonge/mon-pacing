import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'match_cubit.dart';
import '../match_improvisations/match_improvisations_cubit.dart';
import '../dialogs/will_pop_dialog.dart';
import '../models/match_model.dart';
import '../widgets/improvisation.dart';
import 'match_options_view.dart';
import 'match_summary_view.dart';

class MatchView extends StatelessWidget {
  final PageController _pageController = PageController();
  MatchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var matchCubit = context.read<MatchCubit>();
    if (matchCubit.state.teams.isEmpty) {
      Future.microtask(() => openMatchOptions(context, matchCubit));
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => MatchSummaryView(
                          bloc: matchCubit,
                        )),
                  ),
                );
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
        body: BlocListener<MatchImprovisationsCubit, int>(
          listener: (context, state) {
            _pageController.animateToPage(
              state,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOutQuint,
            );
          },
          listenWhen: (previous, current) {
            return _pageController.page == _pageController.page?.toInt() && _pageController.page != current;
          },
          child: PageView(
            controller: _pageController,
            children: matchCubit.state.improvisations.map((e) => ImprovisationView(improvisation: e)).toList(),
            onPageChanged: (value) {
              context.read<MatchImprovisationsCubit>().setPage(value);
            },
          ),
        ),
      ),
    );
  }

  openMatchOptions(BuildContext context, MatchCubit matchCubit) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: ((context) => MatchOptionsView(
              bloc: matchCubit,
            )),
      ),
    );
  }
}
