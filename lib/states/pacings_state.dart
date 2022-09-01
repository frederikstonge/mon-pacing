import '../models/pacing_model.dart';

abstract class PacingsState {
  const PacingsState();
}

class PacingsInitialState extends PacingsState {
  const PacingsInitialState();
}

class PacingsLoadingState extends PacingsState {
  const PacingsLoadingState();
}

class PacingsSuccessState extends PacingsState {
  final List<PacingModel> pacings;

  const PacingsSuccessState({
    required this.pacings,
  });
}

class PacingsErrorState extends PacingsState {
  final String error;

  const PacingsErrorState({
    required this.error,
  });
}
