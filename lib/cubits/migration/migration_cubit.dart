import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'migration_state.dart';

class MigrationCubit extends HydratedCubit<MigrationState> {
  MigrationCubit() : super(const MigrationState(status: MigrationStatus.initial));

  void startMigration({required int total, required String title}) {
    emit(state.copyWith(status: MigrationStatus.running, count: 0, total: total, title: title));
  }

  void updateProgress({int? count, String? title}) {
    emit(state.copyWith(count: count, title: title));
  }

  void completeMigration({required String title}) {
    emit(state.copyWith(status: MigrationStatus.success, count: null, total: null, title: title));
  }

  @override
  MigrationState? fromJson(Map<String, dynamic> json) => MigrationStateMapper.fromMap(json);

  @override
  Map<String, dynamic>? toJson(MigrationState state) => state.toMap();
}
