import 'package:dart_mappable/dart_mappable.dart';

part 'matches_status.mapper.dart';

@MappableEnum()
enum MatchesStatus { initial, loading, error, success }
