import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/pacing_model.dart';
import '../repositories/pacings_repository.dart';
import '../states/pacings_state.dart';

class PacingsCubit extends Cubit<PacingsState> {
  static const int _pageSize = 20;
  final PacingsRepository repository;
  bool _isFetching = false;

  PacingsCubit({required this.repository}) : super(const PacingsState.initial());

  bool get isFetching => _isFetching;

  Future<PacingModel> add(PacingModel model) async {
    try {
      return await repository.add(model);
    } finally {
      await refresh();
    }
  }

  Future<void> edit(PacingModel model) async {
    try {
      await repository.edit(model);
    } finally {
      await refresh();
    }
  }

  Future<void> delete(PacingModel model) async {
    try {
      await repository.delete(model.id!);
    } finally {
      await refresh();
    }
  }

  Future<void> fetch() async {
    _isFetching = true;
    try {
      await state.when(
        initial: () async {
          final response = await repository.getList(0, _pageSize);
          emit(PacingsState.success(response, response.length < _pageSize));
        },
        error: (error) async {
          final response = await repository.getList(0, _pageSize);
          emit(PacingsState.success(response, response.length < _pageSize));
        },
        success: (pacings, hasReachedMax) async {
          final response = await repository.getList(pacings.length, _pageSize);
          emit(PacingsState.success(pacings + response, response.length < _pageSize));
        },
      );
    } catch (exception) {
      emit(PacingsState.error(exception.toString()));
    } finally {
      _isFetching = false;
    }
  }

  Future<void> refresh() async {
    emit(const PacingsState.initial());
    await fetch();
  }
}
