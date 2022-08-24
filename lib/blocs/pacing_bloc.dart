import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monpacing/repositories/pacing_repository.dart';

import '../events/pacing_event.dart';
import '../states/pacing_state.dart';

class PacingBloc extends Bloc<PacingEvent, PacingState> {
  final PacingRepository repository;
  int page = 1;
  bool isFetching = false;

  PacingBloc({required this.repository}) : super(const PacingInitialState()) {
    on<PacingFetchEvent>(_onPacingFetchEvent);
    on<PacingRefreshEvent>(_onPacingRefreshEvent);
  }

  _onPacingFetchEvent(PacingFetchEvent event, Emitter<PacingState> emit) async {
    emit(const PacingLoadingState(message: 'Loading Pacings'));
    try {
      final response = await repository.getList(page);
      emit(PacingSuccessState(pacings: response));
      page++;
    } catch (exception) {
      emit(PacingErrorState(error: exception.toString()));
    }
  }

  _onPacingRefreshEvent(PacingRefreshEvent event, Emitter<PacingState> emit) async {
    emit(const PacingInitialState());
    emit(const PacingLoadingState(message: 'Loading Pacings'));
    try {
      page = 1;
      final response = await repository.getList(page);
      emit(PacingSuccessState(pacings: response));
      page++;
    } catch (exception) {
      emit(PacingErrorState(error: exception.toString()));
    }
  }
}
