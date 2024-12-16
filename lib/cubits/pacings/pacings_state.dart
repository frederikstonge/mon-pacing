import 'package:dart_mappable/dart_mappable.dart';

import '../../../models/pacing_model.dart';
import 'pacings_status.dart';

part 'pacings_state.mapper.dart';

@MappableClass()
class PacingsState with PacingsStateMappable {
  final PacingsStatus status;
  final String? error;
  final List<PacingModel> pacings;
  final bool hasMore;

  const PacingsState({
    required this.status,
    this.error,
    this.pacings = const [],
    this.hasMore = false,
  });
}
