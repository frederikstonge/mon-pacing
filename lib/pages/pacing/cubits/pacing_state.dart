import 'package:dart_mappable/dart_mappable.dart';

import '../../../models/pacing_model.dart';
import 'pacing_status.dart';

part 'pacing_state.mapper.dart';

@MappableClass()
class PacingState with PacingStateMappable {
  final PacingStatus status;
  final String? error;
  final PacingModel? pacing;

  const PacingState({required this.status, this.error, this.pacing});
}
