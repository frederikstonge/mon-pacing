import 'package:dart_mappable/dart_mappable.dart';

part 'teams_status.mapper.dart';

@MappableEnum()
enum TeamsStatus { initial, loading, error, success }
