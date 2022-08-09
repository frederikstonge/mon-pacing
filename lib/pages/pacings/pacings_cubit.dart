import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monpacing/repositories/pacings_repository.dart';

class PacingsCubit extends Cubit<int> {
  PacingsCubit({required this.repository}) : super(0);
  final PacingsRepository repository;
}
