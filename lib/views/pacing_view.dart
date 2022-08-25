import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:monpacing/models/improvisation_type.dart';

import '../cubits/pacing_cubit.dart';
import '../models/pacing_model.dart';

class PacingView extends StatelessWidget {
  static const double kExpandedHeight = 150.0;
  static const double kBottomHeight = 36.0;

  const PacingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PacingCubit, PacingModel>(
      builder: (context, state) {
        var nameController = TextEditingController(text: state.name);
        nameController.selection = TextSelection.collapsed(offset: state.name?.length ?? 0);
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
                title: Text(state.name ?? "New pacing"),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.save),
                    tooltip: 'Save',
                  )
                ],
                flexibleSpace: FlexibleSpaceBar(
                  expandedTitleScale: 1,
                  titlePadding: const EdgeInsets.fromLTRB(10, 10, 10, kBottomHeight),
                  title: TextField(
                    key: ValueKey(state.id),
                    controller: nameController,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Name',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      context.read<PacingCubit>().editName(nameController.text);
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
                                  const Text(
                                    "Improvisations: ",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    (state.improvisations?.length ?? 0).toString(),
                                    style: const TextStyle(color: Colors.white),
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
                                  const Text(
                                    "Time: ",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    ((state.improvisations?.fold(Duration.zero, (Duration p, v) => p + v.duration) ?? Duration.zero).inSeconds / 60.0)
                                        .toString(),
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  const Text(
                                    " min",
                                    style: TextStyle(color: Colors.white),
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
              SliverReorderableList(
                onReorder: (oldIndex, newIndex) {
                  context.read<PacingCubit>().moveImprovisation(oldIndex, newIndex);
                },
                itemBuilder: (context, index) {
                  var item = state.improvisations![index];
                  var categoryController = TextEditingController(text: item.category);
                  categoryController.selection = TextSelection.collapsed(offset: item.category?.length ?? 0);
                  var themeController = TextEditingController(text: item.theme);
                  themeController.selection = TextSelection.collapsed(offset: item.theme?.length ?? 0);
                  var performersController = TextEditingController(text: item.performers?.toString() ?? '');
                  performersController.selection = TextSelection.collapsed(offset: item.performers?.toString().length ?? 0);
                  return ExpansionTileCard(
                    key: Key("${item.order}"),
                    leading: ReorderableDelayedDragStartListener(index: index, child: const Icon(Icons.drag_handle)),
                    title: Text("Improvisation #${item.order + 1}"),
                    subtitle: Text(
                        "${item.type == ImprovisationType.mixed ? 'M' : 'C'} | ${item.category ?? '-'} | ${item.theme ?? '-'} | ${item.performers ?? '-'} | ${item.duration.inMinutes} min ${item.duration.inSeconds % 60} sec"),
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
                          controller: categoryController,
                          decoration: const InputDecoration(
                            hintText: 'Category',
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (value) {
                            item.category = categoryController.text;
                            context.read<PacingCubit>().editImprovisation(item);
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: themeController,
                          decoration: const InputDecoration(
                            hintText: 'Theme',
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (value) {
                            item.theme = themeController.text;
                            context.read<PacingCubit>().editImprovisation(item);
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: performersController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            hintText: '# of participant',
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (value) {
                            var performers = performersController.text.isEmpty ? null : int.parse(performersController.text);
                            item.performers = performers;
                            context.read<PacingCubit>().editImprovisation(item);
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
                        alignment: MainAxisAlignment.end,
                        buttonHeight: 52.0,
                        buttonMinWidth: 90.0,
                        children: <Widget>[
                          TextButton(
                            onPressed: () {
                              context.read<PacingCubit>().removeImprovisation(index);
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
            ],
          ),
        );
      },
    );
  }
}
