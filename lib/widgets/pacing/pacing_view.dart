import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/pacing/pacing_cubit.dart';
import '../../cubits/pacing/pacing_state.dart';
import '../../cubits/pacings/pacings_cubit.dart';
import '../../dialogs/will_pop_dialog.dart';
import '../../helpers/duration_helper.dart';
import '../../l10n/generated/l10n.dart';
import '../../models/improvisation_type.dart';
import '../../models/pacing_model.dart';
import '../pacing_options/pacing_options_page.dart';
import 'pacing_improvisation.dart';

class PacingView extends StatefulWidget {
  static const double kBottomHeight = 40.0;

  const PacingView({super.key});

  @override
  State<PacingView> createState() => _PacingViewState();
}

class _PacingViewState extends State<PacingView> {
  PacingModel? initialPacing;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PacingCubit, PacingState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (pacing) {
            initialPacing ??= pacing;
          },
        );
      },
      builder: (context, state) => state.when(
        initial: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
        error: (error) => Scaffold(body: Center(child: Text(error))),
        success: (pacing) => WillPopScope(
          onWillPop: () async {
            if (pacing != initialPacing) {
              final result = await WillPopDialog.showWillPopDialog(
                context,
                S.of(context).PacingView_WillPopDialog_Title,
                S.of(context).PacingView_WillPopDialog_Content,
              );
              return result ?? false;
            }

            return true;
          },
          child: Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                context.read<PacingCubit>().addImprovisation();
              },
              tooltip: S.of(context).PacingView_AddImprovisation,
              child: const Icon(Icons.add),
            ),
            body: CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  snap: true,
                  floating: true,
                  title: Text(
                    pacing.name,
                    overflow: TextOverflow.ellipsis,
                  ),
                  actions: [
                    IconButton(
                      onPressed: () {
                        _openPacingOptions(context);
                      },
                      icon: const Icon(Icons.settings),
                      tooltip: S.of(context).MatchView_EditDetails,
                    ),
                    IconButton(
                      onPressed: () async {
                        await _savePacing(context, pacing);
                      },
                      icon: const Icon(Icons.save),
                      tooltip: S.of(context).Dialog_Save,
                    ),
                  ],
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(PacingView.kBottomHeight),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              S.of(context).PacingView_TotalImprovisations(pacing.improvisations.length),
                              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                            ),
                          ),
                          Expanded(
                            child: Builder(
                              builder: (context) {
                                var totalDuration = pacing.improvisations.fold(
                                  Duration.zero,
                                  (t, e) {
                                    if (e.type == ImprovisationType.mixed) {
                                      return t + e.durations.reduce((total, element) => total + element);
                                    } else {
                                      return t + (e.durations.reduce((total, element) => total + element) * pacing.defaultNumberOfTeams);
                                    }
                                  },
                                );

                                if (pacing.enablePaddingDuration) {
                                  totalDuration = totalDuration + (pacing.paddingDuration * (pacing.improvisations.length));
                                }

                                return Text(
                                  S.of(context).PacingView_TotalDuration(DurationHelper.getDurationString(totalDuration)),
                                  textAlign: TextAlign.end,
                                  style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverReorderableList(
                  onReorder: (oldIndex, newIndex) {
                    context.read<PacingCubit>().moveImprovisation(oldIndex, newIndex);
                  },
                  itemBuilder: (_, index) {
                    final item = pacing.improvisations[index];
                    return PacingImprovisation(key: ValueKey("${item.id}"), improvisation: item, index: index);
                  },
                  itemCount: pacing.improvisations.length,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _openPacingOptions(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: ((_) => PacingOptionsPage(bloc: context.read<PacingCubit>()))),
    );
  }

  Future<void> _savePacing(BuildContext context, PacingModel state) async {
    final navigator = Navigator.of(context);
    await context.read<PacingsCubit>().edit(state);
    navigator.pop();
  }
}
