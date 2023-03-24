import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../../cubits/match_cubit.dart';
import '../../dialogs/modal_bottom_sheet_dialog.dart';
import '../../dialogs/will_pop_dialog.dart';
import '../../l10n/generated/l10n.dart';
import '../../models/match_model.dart';
import '../match_options/match_options_page.dart';
import '../match_summary/match_summary_page.dart';
import 'match_improvisation.dart';

class MatchView extends StatefulWidget {
  const MatchView({super.key});

  @override
  State<MatchView> createState() => _MatchViewState();
}

class _MatchViewState extends State<MatchView> {
  final _pageController = PageController();
  bool _isDialOpen = false;
  late final ValueNotifier<bool> _dialValueNotifier;
  int _page = 0;

  @override
  void initState() {
    _dialValueNotifier = ValueNotifier(_isDialOpen);
    _dialValueNotifier.addListener(_onDialOpen);
    super.initState();
  }

  @override
  void dispose() {
    _dialValueNotifier.removeListener(_onDialOpen);
    _dialValueNotifier.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _dialValueNotifier.value = false;
        final result = await WillPopDialog.showWillPopDialog(
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
            onPageChanged: (value) => setState(() => _page = value),
          ),
          floatingActionButton: SpeedDial(
            icon: _isDialOpen ? Icons.arrow_drop_down : Icons.arrow_drop_up,
            openCloseDial: _dialValueNotifier,
            children: [
              SpeedDialChild(
                child: FloatingActionButton(
                  onPressed: () {
                    _dialValueNotifier.value = false;
                    _onScorePressed();
                  },
                  tooltip: 'Score',
                  child: const Icon(Icons.scoreboard),
                ),
              ),
              SpeedDialChild(
                child: FloatingActionButton(
                  onPressed: () {
                    _dialValueNotifier.value = false;
                    _onPenaltiesPressed();
                  },
                  tooltip: 'Penalties',
                  child: const Icon(Icons.sports),
                ),
              ),
            ],
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

  void _onDialOpen() {
    setState(() {
      _isDialOpen = !_isDialOpen;
    });
  }

  void _onPenaltiesPressed() {
    ModalBottomSheetDialog.showDialog(context, const Text('penalties'), () => null, () => null, 'Confirm');
  }

  void _onScorePressed() {
    ModalBottomSheetDialog.showDialog(context, const Text('score'), () => null, () => null, 'Confirm');
  }
}
