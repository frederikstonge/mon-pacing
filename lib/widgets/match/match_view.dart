import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../match_summary/match_summary_page.dart';
import 'match_cubit.dart';
import '../../dialogs/will_pop_dialog.dart';
import '../../generated/l10n.dart';
import '../../models/match_model.dart';
import 'match_improvisation.dart';
import '../match_options/match_options_page.dart';

class MatchView extends StatefulWidget {
  const MatchView({super.key});

  @override
  State<MatchView> createState() => _MatchViewState();
}

class _MatchViewState extends State<MatchView> {
  final _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        var result = await WillPopDialog.showWillPopDialog(
          context,
          S.of(context).MatchView_WillPopDialog_Title,
          S.of(context).MatchView_WillPopDialog_Content,
        );
        return result ?? false;
      },
      child: BlocBuilder<MatchCubit, MatchModel>(
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: Text(state.name, overflow: TextOverflow.ellipsis),
            actions: [
              IconButton(
                onPressed: () {
                  _openMatchSummary(context);
                },
                icon: const Icon(Icons.summarize),
                tooltip: S.of(context).MatchView_ViewMatchSummary,
              ),
              IconButton(
                onPressed: () {
                  _openMatchOptions(context);
                },
                icon: const Icon(Icons.settings),
                tooltip: S.of(context).MatchView_EditDetails,
              ),
            ],
          ),
          body: PageView(
            controller: _pageController,
            children: state.improvisations.map((e) => MatchImprovisation(improvisation: e, match: state)).toList(),
          ),
        ),
      ),
    );
  }

  Future<void> _openMatchOptions(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: ((_) => MatchOptionsPage(bloc: context.read<MatchCubit>()))),
    );
  }

  Future<void> _openMatchSummary(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: ((_) => MatchSummaryPage(bloc: context.read<MatchCubit>()))),
    );
  }
}
