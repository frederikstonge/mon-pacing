import 'package:dart_mappable/dart_mappable.dart';

part 'pacing_status.mapper.dart';

@MappableEnum()
enum PacingStatus {
  initial,
  loading,
  error,
  success,
}
