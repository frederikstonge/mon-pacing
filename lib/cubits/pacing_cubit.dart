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
    var entity = PacingModel.fromCopy(state);
    nameController.text = entity.name ?? "";
    controllers = entity.improvisations
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
    var entity = PacingModel.fromCopy(state);
    entity.name = name;
    emit(entity);
  }

  void addImprovisation() {
    var entity = PacingModel.fromCopy(state);
    var improvisations = entity.improvisations ?? [];
    var nextOrder = improvisations.isNotEmpty ? improvisations.map((e) => e.order).reduce(max) + 1 : 0;
    var nextType = ImprovisationType.values[improvisations.length % 2];

    var newImprovisation = ImprovisationModel(
      order: nextOrder,
      type: nextType,
      duration: const Duration(minutes: 2, seconds: 30),
    );

    improvisations.add(newImprovisation);

    entity.improvisations = improvisations;
    controllers.add(
      [
        TextEditingController(text: newImprovisation.category ?? ""),
        TextEditingController(text: newImprovisation.theme ?? ""),
        TextEditingController(text: newImprovisation.performers?.toString() ?? ""),
      ],
    );

    emit(entity);
  }

  void moveImprovisation(int oldOrder, int newOrder) {
    var entity = PacingModel.fromCopy(state);
    var improvisation = entity.improvisations!.removeAt(oldOrder);
    var controller = controllers.removeAt(oldOrder);

    if (oldOrder < newOrder) {
      newOrder--;
    }

    entity.improvisations!.insert(newOrder, improvisation);
    controllers.insert(newOrder, controller);
    for (var i = 0; i < entity.improvisations!.length; i++) {
      entity.improvisations![i].order = i;
    }

    emit(entity);
  }

  void removeImprovisation(int order) {
    var entity = PacingModel.fromCopy(state);
    entity.improvisations!.removeAt(order);
    controllers.removeAt(order);

    for (var i = 0; i < entity.improvisations!.length; i++) {
      entity.improvisations![i].order = i;
    }

    emit(entity);
  }

  void editImprovisation(ImprovisationModel model) {
    var entity = PacingModel.fromCopy(state);
    var improvisation = entity.improvisations!.firstWhere((element) => element.order == model.order);
    improvisation.category = model.category;
    improvisation.duration = model.duration;
    improvisation.performers = model.performers;
    improvisation.theme = model.theme;
    improvisation.type = model.type;

    emit(entity);
  }
}
