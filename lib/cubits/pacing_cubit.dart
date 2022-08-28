import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monpacing/models/improvisation_model.dart';
import 'package:monpacing/models/pacing_model.dart';
import 'dart:math';

import '../models/improvisation_type.dart';

class PacingCubit extends Cubit<PacingModel> {
  TextEditingController nameController = TextEditingController();
  List<List<TextEditingController>> controllers = [];

  PacingCubit({required PacingModel model}) : super(model) {
    nameController.text = state.name ?? "";
    controllers = state.improvisations
            ?.map(
              (e) => [
                TextEditingController(text: e.category ?? ""),
                TextEditingController(text: e.theme ?? ""),
                TextEditingController(text: e.performers?.toString() ?? ""),
              ],
            )
            .toList() ??
        [];
  }

  void editName(String name) {
    state.name = name;
    emit(_clone(state));
  }

  void addImprovisation() {
    var improvisations = state.improvisations ?? [];
    var nextOrder = improvisations.isNotEmpty ? improvisations.map((e) => e.order).reduce(max) + 1 : 0;
    var nextType = ImprovisationType.values[improvisations.length % 2];

    var newImprovisation = ImprovisationModel(
      order: nextOrder,
      type: nextType,
      duration: const Duration(minutes: 2, seconds: 30),
    );

    improvisations.add(newImprovisation);

    state.improvisations = improvisations;
    controllers.add(
      [
        TextEditingController(text: newImprovisation.category ?? ""),
        TextEditingController(text: newImprovisation.theme ?? ""),
        TextEditingController(text: newImprovisation.performers?.toString() ?? ""),
      ],
    );

    emit(_clone(state));
  }

  void moveImprovisation(int oldOrder, int newOrder) {
    var improvisation = state.improvisations!.removeAt(oldOrder);
    var controller = controllers.removeAt(oldOrder);

    if (oldOrder < newOrder) {
      newOrder--;
    }

    state.improvisations!.insert(newOrder, improvisation);
    controllers.insert(newOrder, controller);
    for (var i = 0; i < state.improvisations!.length; i++) {
      state.improvisations![i].order = i;
    }

    emit(_clone(state));
  }

  void removeImprovisation(int order) {
    state.improvisations!.removeAt(order);
    controllers.removeAt(order);

    for (var i = 0; i < state.improvisations!.length; i++) {
      state.improvisations![i].order = i;
    }

    emit(_clone(state));
  }

  void editImprovisation(ImprovisationModel model) {
    var improvisation = state.improvisations!.firstWhere((element) => element.order == model.order);
    improvisation.category = model.category;
    improvisation.duration = model.duration;
    improvisation.performers = model.performers;
    improvisation.theme = model.theme;
    improvisation.type = model.type;

    emit(_clone(state));
  }

  PacingModel _clone(PacingModel model) {
    return PacingModel(
      id: model.id,
      name: model.name,
      createdDate: model.createdDate,
      modifiedDate: model.modifiedDate,
      improvisations: model.improvisations,
    );
  }
}
