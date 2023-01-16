import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/improvisation_model.dart';
import '../models/pacing_model.dart';

import '../models/improvisation_type.dart';

class PacingCubit extends Cubit<PacingModel> {
  PacingCubit({required PacingModel model}) : super(model);

  void editName(String name) {
    emit(state.copyWith(name: name));
  }

  void addImprovisation() {
    var improvisations = List<ImprovisationModel>.from(state.copyWith().improvisations);
    var nextOrder = improvisations.isNotEmpty ? improvisations.map((e) => e.order).reduce(max) + 1 : 0;
    var nextId = improvisations.isNotEmpty ? improvisations.map((e) => e.id).reduce(max) + 1 : 0;
    var nextType = ImprovisationType.values[improvisations.length % 2];

    var newImprovisation = ImprovisationModel(
      id: nextId,
      order: nextOrder,
      type: nextType,
      duration: const Duration(minutes: 2, seconds: 30),
      category: "",
      performers: null,
      theme: "",
    );

    improvisations.add(newImprovisation);

    emit(state.copyWith(improvisations: improvisations));
  }

  void moveImprovisation(int oldOrder, int newOrder) {
    var improvisations = List<ImprovisationModel>.from(state.copyWith().improvisations);
    var improvisation = improvisations.removeAt(oldOrder);

    if (oldOrder < newOrder) {
      newOrder--;
    }

    improvisations.insert(newOrder, improvisation);
    _reOrderImprovisations(improvisations);

    emit(state.copyWith(improvisations: improvisations));
  }

  void removeImprovisation(int order) {
    var improvisations = List<ImprovisationModel>.from(state.copyWith().improvisations);
    improvisations.removeAt(order);
    _reOrderImprovisations(improvisations);

    emit(state.copyWith(improvisations: improvisations));
  }

  void editImprovisation(ImprovisationModel model) {
    var improvisations = List<ImprovisationModel>.from(state.copyWith().improvisations);
    improvisations[model.order] = model;

    emit(state.copyWith(improvisations: improvisations));
  }

  List<ImprovisationModel> _reOrderImprovisations(List<ImprovisationModel> improvisations) {
    for (var i = 0; i < improvisations.length; i++) {
      improvisations[i] = improvisations[i].copyWith(order: i);
    }

    return improvisations;
  }
}
