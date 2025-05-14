import 'package:dart_mappable/dart_mappable.dart';

part 'migration_state.mapper.dart';

@MappableClass()
class MigrationState with MigrationStateMappable {
  final MigrationStatus status;
  final int? count;
  final int? total;
  final String? title;
  final String? errorMessage;

  const MigrationState({required this.status, this.count, this.total, this.title, this.errorMessage});
}

@MappableEnum()
enum MigrationStatus { initial, running, error, success }
