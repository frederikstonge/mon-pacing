import 'package:dart_mappable/dart_mappable.dart';

part 'pacings_status.mapper.dart';

@MappableEnum()
enum PacingsStatus { initial, loading, error, success }
