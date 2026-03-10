import 'package:dart_mappable/dart_mappable.dart';

part 'improvisations_status.mapper.dart';

@MappableEnum()
enum ImprovisationsStatus { initial, loading, error, success }
