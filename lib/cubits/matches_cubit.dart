import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/match_model.dart';
import '../models/pacing_model.dart';
import '../repositories/matches_repository.dart';
import '../states/matches_state.dart';

class MatchesCubit extends Cubit<MatchesState> {
  static const int _pageSize = 20;
  final MatchesRepository repository;
  bool _isFetching = false;

  MatchesCubit({required this.repository}) : super(const MatchesState.initial());

  bool get isFetching => _isFetching;

  Future<MatchModel> add(PacingModel model, String name) async {
    try {
      var matchModel = MatchModel(
        createdDate: null,
        modifiedDate: null,
        id: null,
        name: name,
        improvisations: model.copyWith().improvisations,
        penalties: [],
        teams: [],
        points: [],
      );
      return await repository.add(matchModel);
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
    try {
      state.when(
        initial: () async {
          final response = await repository.getList(0, _pageSize);
          emit(MatchesState.success(response, response.length < _pageSize));
        },
        error: (error) async {
          final response = await repository.getList(0, _pageSize);
          emit(MatchesState.success(response, response.length < _pageSize));
        },
        success: (matches, hasReachedMax) async {
          final response = await repository.getList(matches.length, _pageSize);
          emit(MatchesState.success(matches + response, response.length < _pageSize));
        },
      );
    } catch (exception) {
      emit(MatchesState.error(exception.toString()));
    } finally {
      _isFetching = false;
    }
  }

  Future refresh() async {
    emit(const MatchesState.initial());
    await fetch();
  }
}
