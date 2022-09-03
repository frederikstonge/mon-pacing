import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_picker/flutter_picker.dart';

import '../cubits/pacings_cubit.dart';
import '../models/improvisation_type.dart';
import '../cubits/pacing_cubit.dart';
import '../models/pacing_model.dart';
import '../dialogs/delete_dialog.dart';
import '../widgets/expansion_tile_card.dart';
import '../widgets/leading_dirty_iconbutton.dart';

class PacingView extends StatelessWidget {
  static const double kExpandedHeight = 150.0;
  static const double kBottomHeight = 36.0;

  const PacingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var foregroundColor =
        Theme.of(context).brightness == Brightness.light ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onSurface;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<PacingCubit>().addImprovisation();
        },
        tooltip: "Add improvisation",
        child: const Icon(Icons.add),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: kExpandedHeight,
            pinned: true,
            snap: true,
            floating: true,
            leading: const LeadingDirtyIconButton(dirty: true),
            title: BlocBuilder<PacingCubit, PacingModel>(
              builder: (context, state) => Text(state.name ?? "New pacing"),
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
                  tooltip: 'Save',
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
                      hintText: 'Name',
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
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Improvisations: ",
                                style: TextStyle(color: foregroundColor),
                              ),
                              BlocBuilder<PacingCubit, PacingModel>(
                                builder: (context, state) => Text(
                                  (state.improvisations?.length ?? 0).toString(),
                                  style: TextStyle(color: foregroundColor),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Time: ",
                                style: TextStyle(color: foregroundColor),
                              ),
                              BlocBuilder<PacingCubit, PacingModel>(
                                builder: (context, state) => Text(
                                  ((state.improvisations?.fold(Duration.zero, (Duration p, v) => p + v.duration) ?? Duration.zero).inSeconds / 60.0)
                                      .toString(),
                                  style: TextStyle(color: foregroundColor),
                                ),
                              ),
                              Text(
                                " min",
                                style: TextStyle(color: foregroundColor),
                              ),
                            ],
                          ),
                        ],
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
                var item = state.improvisations![index];
                var title = "Improvisation #${item.order + 1}";
                var subTitle =
                    "${item.type == ImprovisationType.mixed ? 'M' : 'C'} | ${item.category ?? '-'} | ${item.theme ?? '-'} | ${item.performers ?? '-'} | ${item.duration.inMinutes} min ${item.duration.inSeconds % 60} sec";

                var controllers = context.read<PacingCubit>().controllers[index];
                return ExpansionTileCard(
                  key: ValueKey("$index of ${state.improvisations!.length}"),
                  leading: ReorderableDelayedDragStartListener(index: index, child: const Icon(Icons.drag_handle)),
                  title: Text(title),
                  subtitle: Text(subTitle),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButtonFormField<ImprovisationType>(
                        decoration: const InputDecoration(
                          hintText: 'Type',
                          border: OutlineInputBorder(),
                        ),
                        value: item.type,
                        icon: const Icon(Icons.arrow_downward),
                        onChanged: (value) {
                          item.type = value!;
                          context.read<PacingCubit>().editImprovisation(item);
                        },
                        items: ImprovisationType.values
                            .map(
                              (e) => DropdownMenuItem<ImprovisationType>(
                                value: e,
                                child: Text(e.name),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: controllers[0],
                        decoration: const InputDecoration(
                          hintText: 'Category',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          if (controllers[0].text != item.category) {
                            item.category = controllers[0].text;
                            context.read<PacingCubit>().editImprovisation(item);
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: controllers[1],
                        decoration: const InputDecoration(
                          hintText: 'Theme',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          if (controllers[1].text != item.theme) {
                            item.theme = controllers[1].text;
                            context.read<PacingCubit>().editImprovisation(item);
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: controllers[2],
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: '# of participant',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          var performers = controllers[2].text.isEmpty ? null : int.parse(controllers[2].text);
                          if (performers != item.performers) {
                            item.performers = performers;
                            context.read<PacingCubit>().editImprovisation(item);
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        readOnly: true,
                        controller: TextEditingController(text: "${item.duration.inMinutes} min ${item.duration.inSeconds % 60} sec"),
                        onTap: () async {
                          Picker(
                            adapter: NumberPickerAdapter(data: <NumberPickerColumn>[
                              NumberPickerColumn(
                                begin: 0,
                                end: 20,
                                suffix: const Text(' minutes'),
                                initValue: item.duration.inMinutes,
                              ),
                              NumberPickerColumn(
                                begin: 0,
                                end: 60,
                                suffix: const Text(' seconds'),
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
                            confirmText: 'OK',
                            title: const Text('Select duration'),
                            onConfirm: (Picker picker, List<int> value) {
                              var duration = Duration(
                                minutes: picker.getSelectedValues()[0],
                                seconds: picker.getSelectedValues()[1],
                              );
                              item.duration = duration;
                              context.read<PacingCubit>().editImprovisation(item);
                            },
                          ).showDialog(context);
                        },
                        decoration: const InputDecoration(
                          hintText: 'Duration',
                          border: OutlineInputBorder(),
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
                            children: const [
                              Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 2.0),
                              ),
                              Text(
                                'Delete',
                                style: TextStyle(color: Colors.red),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
              itemCount: state.improvisations?.length ?? 0,
            ),
          ),
        ],
      ),
    );
    //   },
    // );
  }
}
