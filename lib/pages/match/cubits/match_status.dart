import 'package:dart_mappable/dart_mappable.dart';

part 'match_status.mapper.dart';

@MappableEnum()
enum MatchStatus { initial, loading, error, success }
