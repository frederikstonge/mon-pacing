import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'tutorials_state.dart';

class TutorialsCubit extends HydratedCubit<TutorialsState> {
  TutorialsCubit() : super(const TutorialsState());

  void setAddPacingFinished() {
    emit(state.copyWith(addPacingFinished: true));
  }

  void setStartMatchFinished() {
    emit(state.copyWith(startMatchFinished: true));
  }

  void setAddImprovisationFinished() {
    emit(state.copyWith(addImprovisationFinished: true));
  }

  void setImprovisationFinished() {
    emit(state.copyWith(improvisationFinished: true));
  }

  @override
  TutorialsState? fromJson(Map<String, dynamic> json) {
    // if (kDebugMode) {
    //   return null;
    // }

    return TutorialsStateMapper.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TutorialsState state) {
    // if (kDebugMode) {
    //   return null;
    // }

    return state.toMap();
  }
}
