import 'package:collection/collection.dart';
import 'package:isar/isar.dart' as isar;

import '../extensions/improvisation_extensions.dart';
import '../extensions/pacing_extensions.dart';
import '../models/entities/improvisation_entity_model.dart';
import '../models/entities/pacing_entity_model.dart';
import '../models/improvisation_model.dart';
import '../models/pacing_model.dart';
import '../objectbox.g.dart';
import 'database_repository.dart';
import 'legacy_database_repository.dart';

class PacingsRepository {
  final LegacyDatabaseRepository legacyDatabaseRepository;
  final DatabaseRepository databaseRepository;

  const PacingsRepository({
    required this.legacyDatabaseRepository,
    required this.databaseRepository,
  });

  Future<PacingModel> add(PacingModel pacing) async {
    final db = await databaseRepository.database;
    final box = db.box<PacingEntityModel>();
    final entity = pacing.toEntity();
    final now = DateTime.now();
    entity.createdDate = now;
    entity.modifiedDate = now;
    final newEntity = await box.putAndGetAsync(entity);
    return PacingModel.fromEntity(newEntity);
  }

  Future<void> delete(int id) async {
    final db = await databaseRepository.database;
    final box = db.box<PacingEntityModel>();
    await box.removeAsync(id);
  }

  Future<void> edit(PacingModel pacing) async {
    final db = await databaseRepository.database;
    final box = db.box<PacingEntityModel>();
    final oldEntity = await box.getAsync(pacing.id);
    final oldPacing = PacingModel.fromEntity(oldEntity!);

    final improvBox = db.box<ImprovisationEntityModel>();

    await improvBox.putManyAsync(pacing.improvisations.asMap().entries.map((e) => e.value.toEntity(e.key)).toList());

    final removedImprovisations =
        oldPacing.improvisations.where((element) => pacing.improvisations.none((e) => e.id == element.id)).map((e) => e.id).toList();

    if (removedImprovisations.isNotEmpty) {
      await improvBox.removeManyAsync(removedImprovisations);
    }

    final entity = pacing.toEntity();

    final now = DateTime.now();
    entity.modifiedDate = now;
    await box.putAsync(entity);
  }

  Future<PacingModel?> get(int id) async {
    final db = await databaseRepository.database;
    final box = db.box<PacingEntityModel>();
    final entity = await box.getAsync(id);
    if (entity == null) {
      return null;
    }

    return PacingModel.fromEntity(entity);
  }

  Future<List<PacingModel>> getList(int skip, int take) async {
    await _migrateToObjectBox();

    final db = await databaseRepository.database;
    final box = db.box<PacingEntityModel>();
    final query = box.query().order(PacingEntityModel_.createdDate, flags: Order.descending).build();
    query.offset = skip;
    query.limit = take;
    final entities = await query.findAsync();
    return entities.map((e) => PacingModel.fromEntity(e)).toList();
  }

  Future<void> _migrateToObjectBox() async {
    final legacyDb = await legacyDatabaseRepository.database;
    final pacings = await legacyDb.pacingModels.where().sortByCreatedDate().findAllAsync();

    if (pacings.isNotEmpty) {
      final newPacings = pacings.map(
        (e) => e.copyWith(
          id: 0,
          improvisations: List<ImprovisationModel>.from(e.improvisations).map((e) => e.copyWith(id: 0)).toList(),
        ),
      );

      final db = await databaseRepository.database;
      final box = db.box<PacingEntityModel>();
      final entities = newPacings.map((e) => e.toEntity()).toList();
      await box.putManyAsync(entities);

      await legacyDb.writeAsync((isar) => isar.pacingModels.deleteAll(pacings.map((e) => e.id).toList()));
    }
  }
}
