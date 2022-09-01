import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monpacing/models/pacing_model.dart';
import 'package:monpacing/repositories/pacings_repository.dart';

import '../states/pacings_state.dart';

class PacingsCubit extends Cubit<PacingsState?> {
  final PacingsRepository repository;
  int _page = 1;
  bool _isFetching = false;

  PacingsCubit({required this.repository}) : super(null);

  bool get isFetching => _isFetching;

  Future add(PacingModel model) async {
    try {
      await repository.add(model);
    } finally {
      await refresh();
    }
  }

  Future edit(PacingModel model) async {
    try {
      await repository.edit(model);
    } finally {
      await refresh();
    }
  }

  Future delete(PacingModel model) async {
    try {
      await repository.delete(model.id!);
    } finally {
      await refresh();
    }
  }

  Future fetch() async {
    _isFetching = true;
    emit(const PacingsLoadingState());
    try {
      final response = await repository.getList(_page);
      emit(PacingsSuccessState(pacings: response));
      _page++;
    } catch (exception) {
      emit(PacingsErrorState(error: exception.toString()));
    }
    _isFetching = false;
  }

  Future refresh() async {
    emit(const PacingsInitialState());
    _isFetching = true;
    emit(const PacingsLoadingState());
    try {
      _page = 1;
      final response = await repository.getList(_page);
      emit(PacingsSuccessState(pacings: response));
      _page++;
    } catch (exception) {
      emit(PacingsErrorState(error: exception.toString()));
    }
    _isFetching = false;
  }
}
