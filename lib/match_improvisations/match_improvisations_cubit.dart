import 'package:flutter_bloc/flutter_bloc.dart';

class MatchImprovisationsCubit extends Cubit<int> {
  MatchImprovisationsCubit() : super(0);

  void setPage(int value) => emit(value);
}
