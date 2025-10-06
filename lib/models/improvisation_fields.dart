import 'package:dart_mappable/dart_mappable.dart';

part 'improvisation_fields.mapper.dart';

@MappableEnum()
enum ImprovisationFields { type, category, theme, durations, performers, notes }
