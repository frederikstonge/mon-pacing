import '../models/match_model.dart';

abstract class MatchesState {
  const MatchesState();
}

class MatchesInitialState extends MatchesState {
  const MatchesInitialState();
}

class MatchesLoadingState extends MatchesState {
  const MatchesLoadingState();
}

class MatchesSuccessState extends MatchesState {
  final List<MatchModel> matches;

  const MatchesSuccessState({
    required this.matches,
  });
}

class MatchesErrorState extends MatchesState {
  final String error;

  const MatchesErrorState({
    required this.error,
  });
}
