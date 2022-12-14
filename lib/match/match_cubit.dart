import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/match_model.dart';

class MatchCubit extends Cubit<MatchModel> {
  MatchCubit({required MatchModel model}) : super(model);
}
