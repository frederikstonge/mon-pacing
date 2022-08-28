import 'package:monpacing/models/pacing_model.dart';

abstract class PacingState {
  const PacingState();
}

class PacingInitialState extends PacingState {
  const PacingInitialState();
}

class PacingLoadingState extends PacingState {
  const PacingLoadingState();
}

class PacingSuccessState extends PacingState {
  final List<PacingModel> pacings;

  const PacingSuccessState({
    required this.pacings,
  });
}

class PacingErrorState extends PacingState {
  final String error;

  const PacingErrorState({
    required this.error,
  });
}
