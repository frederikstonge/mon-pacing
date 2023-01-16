import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/pacing_cubit.dart';
import '../cubits/pacings_cubit.dart';
import '../cubits/settings_cubit.dart';
import '../dialogs/will_pop_dialog.dart';
import '../generated/l10n.dart';
import '../helpers/duration_helper.dart';
import '../models/improvisation_type.dart';
import '../models/pacing_model.dart';
import '../models/settings_model.dart';
import '../pages/pacing_options_page.dart';
import '../widgets/pacing_improvisation.dart';

class PacingView extends StatelessWidget {
  static const double kBottomHeight = 40.0;
  final PacingModel model;
  const PacingView({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return BlocBuilder<PacingCubit, PacingModel>(
      builder: (context, state) => WillPopScope(
        onWillPop: () async {
          if (state != model) {
            var result = await WillPopDialog.showWillPopDialog(
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
                  state.name,
                  overflow: TextOverflow.ellipsis,
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      _openPacingOptions(context, context.read<PacingCubit>());
                    },
                    icon: const Icon(Icons.settings),
                    tooltip: S.of(context).MatchView_EditDetails,
                  ),
                  IconButton(
                    onPressed: () async {
                      await _savePacing(context, state);
                    },
                    icon: const Icon(Icons.save),
                    tooltip: S.of(context).PacingView_Save,
                  ),
                ],
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(kBottomHeight),
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
                          child: BlocBuilder<SettingsCubit, SettingsModel>(
                            builder: (settingsContext, settingsState) {
                              var totalDuration = state.improvisations.fold(
                                Duration.zero,
                                (d, i) {
                                  if (i.type == ImprovisationType.mixed) {
                                    return d + i.duration;
                                  } else {
                                    return d + (i.duration * 2);
                                  }
                                },
                              );

                              if (settingsState.enablePaddingDuration) {
                                totalDuration = totalDuration + (settingsState.paddingDuration * (state.improvisations.length));
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
                itemBuilder: (context, index) {
                  var item = state.improvisations[index];
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

  _openPacingOptions(BuildContext context, PacingCubit pacingCubit) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: ((context) => PacingOptionsPage(
              bloc: pacingCubit,
            )),
      ),
    );
  }

  Future _savePacing(BuildContext context, PacingModel state) async {
    final navigator = Navigator.of(context);
    if (state.id == null) {
      await context.read<PacingsCubit>().add(state);
    } else {
      await context.read<PacingsCubit>().edit(state);
    }

    navigator.pop();
  }
}
