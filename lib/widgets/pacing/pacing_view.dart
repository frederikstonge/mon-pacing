import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'pacing_cubit.dart';
import '../pacings/pacings_cubit.dart';
import '../../dialogs/will_pop_dialog.dart';
import '../../generated/l10n.dart';
import '../../helpers/duration_helper.dart';
import '../../models/improvisation_type.dart';
import '../../models/pacing_model.dart';
import '../pacing_options/pacing_options_page.dart';
import 'pacing_improvisation.dart';

class PacingView extends StatefulWidget {
  static const double kBottomHeight = 40.0;
  final PacingModel model;
  const PacingView({super.key, required this.model});

  @override
  State<PacingView> createState() => _PacingViewState();
}

class _PacingViewState extends State<PacingView> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return WillPopScope(
      onWillPop: () async {
        if (context.read<PacingCubit>().state != widget.model) {
          final result = await WillPopDialog.showWillPopDialog(
            context,
            S.of(context).PacingView_WillPopDialog_Title,
            S.of(context).PacingView_WillPopDialog_Content,
          );
          return result ?? false;
        }

        return true;
      },
      child: BlocBuilder<PacingCubit, PacingModel>(
        builder: (context, state) => Scaffold(
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
                  state.name,
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
                      await _savePacing(context, state);
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
                            S.of(context).PacingView_TotalImprovisations(state.improvisations.length),
                            style: TextStyle(color: theme.colorScheme.onPrimary),
                          ),
                        ),
                        Expanded(
                          child: Builder(
                            builder: (context) {
                              var totalDuration = state.improvisations.fold(
                                Duration.zero,
                                (t, e) {
                                  if (e.type == ImprovisationType.mixed) {
                                    return t + e.durations.reduce((total, element) => total + element);
                                  } else {
                                    return t + (e.durations.reduce((total, element) => total + element) * state.defaultNumberOfTeams);
                                  }
                                },
                              );

                              if (state.enablePaddingDuration) {
                                totalDuration = totalDuration + (state.paddingDuration * (state.improvisations.length));
                              }

                              return Text(
                                S.of(context).PacingView_TotalDuration(DurationHelper.getDurationString(totalDuration)),
                                style: TextStyle(color: theme.colorScheme.onPrimary),
                                textAlign: TextAlign.end,
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
                  final item = state.improvisations[index];
                  return PacingImprovisation(key: ValueKey("${item.id}"), improvisation: item, index: index);
                },
                itemCount: state.improvisations.length,
              ),
            ],
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
