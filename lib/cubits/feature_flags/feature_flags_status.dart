import 'package:dart_mappable/dart_mappable.dart';

part 'feature_flags_status.mapper.dart';

@MappableEnum()
enum FeatureFlagsStatus {
  initial,
  loading,
  success,
  failure,
}
