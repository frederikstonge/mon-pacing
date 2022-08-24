import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monpacing/models/pacing_model.dart';

class PacingCubit extends Cubit<PacingModel> {
  PacingCubit(PacingModel model) : super(model);
}
