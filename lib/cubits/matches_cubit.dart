import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/match_model.dart';
import '../repositories/matches_repository.dart';
import '../states/matches_state.dart';

class MatchesCubit extends Cubit<MatchesState?> {
  final MatchesRepository repository;
  int _page = 1;
  bool _isFetching = false;

  MatchesCubit({required this.repository}) : super(null);

  bool get isFetching => _isFetching;

  Future<MatchModel> add(MatchModel model) async {
    try {
      return await repository.add(model);
    } finally {
      await refresh();
    }
  }

  Future edit(MatchModel model) async {
    try {
      await repository.edit(model);
    } finally {
      await refresh();
    }
  }

  Future delete(MatchModel model) async {
    try {
      await repository.delete(model.id!);
    } finally {
      await refresh();
    }
  }

  Future fetch() async {
    _isFetching = true;
    emit(const MatchesLoadingState());
    try {
      final response = await repository.getList(_page);
      emit(MatchesSuccessState(matches: response));
      _page++;
    } catch (exception) {
      emit(MatchesErrorState(error: exception.toString()));
    }
    _isFetching = false;
  }

  Future refresh() async {
    emit(const MatchesInitialState());
    _isFetching = true;
    emit(const MatchesLoadingState());
    try {
      _page = 1;
      final response = await repository.getList(_page);
      emit(MatchesSuccessState(matches: response));
      _page++;
    } catch (exception) {
      emit(MatchesErrorState(error: exception.toString()));
    }
    _isFetching = false;
  }
}
