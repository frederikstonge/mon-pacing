import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_picker/flutter_picker.dart';

import '../cubits/pacings_cubit.dart';
import '../cubits/settings_cubit.dart';
import '../dialogs/will_pop_dialog.dart';
import '../generated/l10n.dart';
import '../helpers/duration_helper.dart';
import '../models/improvisation_type.dart';
import '../cubits/pacing_cubit.dart';
import '../models/pacing_model.dart';
import '../dialogs/delete_dialog.dart';
import '../models/settings_model.dart';
import '../widgets/expansion_tile_card.dart';

class PacingView extends StatelessWidget {
  static const double kExpandedHeight = 150.0;
  static const double kBottomHeight = 36.0;
  final PacingModel? model;
  const PacingView({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    var foregroundColor =
        Theme.of(context).brightness == Brightness.light ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onSurface;
    return WillPopScope(
      onWillPop: () async {
        if (context.read<PacingCubit>().state != model) {
          var result = await WillPopDialog.showWillPopDialog(
            context,
            S.of(context).PacingView_WillPopDialog_Title,
            S.of(context).PacingView_WillPopDialog_Title,
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
              expandedHeight: kExpandedHeight,
              pinned: true,
              snap: true,
              floating: true,
              title: BlocBuilder<PacingCubit, PacingModel>(
                builder: (context, state) => Text(state.name.isNotEmpty ? state.name : S.of(context).PacingView_NewPacing),
              ),
              actions: [
                BlocBuilder<PacingCubit, PacingModel>(
                  builder: (context, state) => IconButton(
                    onPressed: () async {
                      final navigator = Navigator.of(context);
                      if (state.id == null) {
                        await context.read<PacingsCubit>().add(state);
                      } else {
                        await context.read<PacingsCubit>().edit(state);
                      }

                      navigator.pop();
                    },
                    icon: const Icon(Icons.save),
                    tooltip: S.of(context).PacingView_Save,
                  ),
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                expandedTitleScale: 1,
                titlePadding: const EdgeInsets.fromLTRB(10, 10, 10, kBottomHeight),
                title: BlocBuilder<PacingCubit, PacingModel>(
                  builder: (context, state) {
                    var controller = context.read<PacingCubit>().nameController;
                    return TextField(
                      style: TextStyle(color: Theme.of(context).textTheme.bodyText1!.color),
                      controller: controller,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Theme.of(context).cardColor,
                        hintText: S.of(context).PacingView_Name,
                        border: const OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        context.read<PacingCubit>().editName(controller.text);
                      },
                    );
                  },
                ),
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(kBottomHeight),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: BlocBuilder<PacingCubit, PacingModel>(
                          builder: (context, state) => Text(
                            S.of(context).PacingView_TotalImprovisations(state.improvisations.length),
                            style: TextStyle(color: foregroundColor),
                          ),
                        ),
                      ),
                      Expanded(
                        child: BlocBuilder<PacingCubit, PacingModel>(
                          builder: (pacingContext, pacingState) => BlocBuilder<SettingsCubit, SettingsModel>(
                            builder: (settingsContext, settingsState) {
                              var totalDuration = pacingState.improvisations.fold(
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
                                totalDuration = totalDuration + (settingsState.paddingDuration * (pacingState.improvisations.length));
                              }

                              return Text(
                                S.of(context).PacingView_TotalDuration(getDurationString(totalDuration)),
                                style: TextStyle(color: foregroundColor),
                                textAlign: TextAlign.end,
                              );
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            BlocBuilder<PacingCubit, PacingModel>(
              builder: (context, state) => SliverReorderableList(
                onReorder: (oldIndex, newIndex) {
                  context.read<PacingCubit>().moveImprovisation(oldIndex, newIndex);
                },
                itemBuilder: (context, index) {
                  var item = state.improvisations[index];
                  var title = S.of(context).PacingView_ImprovisationTitle(item.order + 1);
                  var subTitle = S.of(context).PacingView_ImprovisationSubtitle(
                        item.type == ImprovisationType.mixed ? 'M' : 'C',
                        item.category.isNotEmpty ? item.category : '-',
                        item.theme.isNotEmpty ? item.theme : '-',
                        item.performers ?? '-',
                        getDurationString(item.duration),
                      );

                  var controllers = context.read<PacingCubit>().controllers[index];
                  return ExpansionTileCard(
                    key: ValueKey("$index of ${state.improvisations.length}"),
                    leading: ReorderableDragStartListener(index: index, child: const Icon(Icons.drag_handle)),
                    title: Text(title),
                    subtitle: Text(subTitle),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButtonFormField<ImprovisationType>(
                          decoration: InputDecoration(
                            hintText: S.of(context).PacingView_ImprovisationType,
                            border: const OutlineInputBorder(),
                          ),
                          value: item.type,
                          icon: const Icon(Icons.arrow_downward),
                          onChanged: (value) {
                            context.read<PacingCubit>().editImprovisation(item.copyWith(type: value!));
                          },
                          items: ImprovisationType.values.map(
                            (e) {
                              var display =
                                  e == ImprovisationType.mixed ? S.of(context).ImprovisationType_mixed : S.of(context).ImprovisationType_compared;
                              return DropdownMenuItem<ImprovisationType>(
                                value: e,
                                child: Text(display),
                              );
                            },
                          ).toList(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: controllers[0],
                          decoration: InputDecoration(
                            hintText: S.of(context).PacingView_ImprovisationCategory,
                            border: const OutlineInputBorder(),
                          ),
                          onChanged: (value) {
                            if (controllers[0].text != item.category) {
                              context.read<PacingCubit>().editImprovisation(item.copyWith(category: controllers[0].text));
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: controllers[1],
                          decoration: InputDecoration(
                            hintText: S.of(context).PacingView_ImprovisationTheme,
                            border: const OutlineInputBorder(),
                          ),
                          onChanged: (value) {
                            if (controllers[1].text != item.theme) {
                              context.read<PacingCubit>().editImprovisation(item.copyWith(theme: controllers[1].text));
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: controllers[2],
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: S.of(context).PacingView_ImprovisationParticipants,
                            border: const OutlineInputBorder(),
                          ),
                          onChanged: (value) {
                            var performers = controllers[2].text.isEmpty ? null : int.parse(controllers[2].text);
                            if (performers != item.performers) {
                              context.read<PacingCubit>().editImprovisation(item.copyWith(performers: performers));
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          readOnly: true,
                          controller: TextEditingController(text: getDurationString(item.duration)),
                          onTap: () async {
                            Picker(
                              adapter: NumberPickerAdapter(data: <NumberPickerColumn>[
                                NumberPickerColumn(
                                  begin: 0,
                                  end: 20,
                                  suffix: Text(S.of(context).PacingView_ImprovisationDurationMinutes),
                                  initValue: item.duration.inMinutes,
                                ),
                                NumberPickerColumn(
                                  begin: 0,
                                  end: 60,
                                  suffix: Text(S.of(context).PacingView_ImprovisationDurationSeconds),
                                  initValue: (item.duration.inSeconds % 60),
                                  jump: 15,
                                ),
                              ]),
                              delimiter: <PickerDelimiter>[
                                PickerDelimiter(
                                  child: Container(
                                    width: 10.0,
                                    alignment: Alignment.center,
                                  ),
                                )
                              ],
                              hideHeader: true,
                              confirmText: S.of(context).Dialog_Ok,
                              title: Text(S.of(context).PacingView_ImprovisationDurationTitle),
                              onConfirm: (Picker picker, List<int> value) {
                                var duration = Duration(
                                  minutes: picker.getSelectedValues()[0],
                                  seconds: picker.getSelectedValues()[1],
                                );
                                context.read<PacingCubit>().editImprovisation(item.copyWith(duration: duration));
                              },
                            ).showDialog(context);
                          },
                          decoration: InputDecoration(
                            hintText: S.of(context).PacingView_ImprovisationDurationHint,
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ),
                      ButtonBar(
                        alignment: MainAxisAlignment.spaceAround,
                        buttonHeight: 52.0,
                        buttonMinWidth: 90.0,
                        children: <Widget>[
                          TextButton(
                            onPressed: () {
                              DeleteDialog.showDeleteDialog(context, title, () {
                                context.read<PacingCubit>().removeImprovisation(index);
                              });
                            },
                            child: Column(
                              children: [
                                const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 2.0),
                                ),
                                Text(
                                  S.of(context).DeleteDialog_Title,
                                  style: const TextStyle(color: Colors.red),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
                itemCount: state.improvisations.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
