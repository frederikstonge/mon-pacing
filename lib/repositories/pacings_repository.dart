import 'package:isar/isar.dart';

import '../models/pacing_model.dart';
import 'database_repository.dart';

class PacingsRepository {
  final DatabaseRepository databaseRepository;

  const PacingsRepository({
    required this.databaseRepository,
  });

  Future<PacingModel> add(PacingModel entity) async {
    final db = await databaseRepository.database;
    final id = db.pacingModels.autoIncrement();
    final now = DateTime.now();
    final model = entity.copyWith(id: id, createdDate: now, modifiedDate: now);
    await db.writeAsync((isar) => isar.pacingModels.put(model));
    return model;
  }

  Future<void> delete(int id) async {
    final db = await databaseRepository.database;
    await db.writeAsync((isar) => isar.pacingModels.delete(id));
  }

  Future<void> edit(PacingModel entity) async {
    final model = entity.copyWith(modifiedDate: DateTime.now());
    final db = await databaseRepository.database;
    await db.writeAsync((isar) => isar.pacingModels.put(model));
  }

  Future<PacingModel?> get(int id) async {
    final db = await databaseRepository.database;
    return await db.pacingModels.getAsync(id);
  }

  Future<List<PacingModel>> getList(int skip, int take) async {
    final db = await databaseRepository.database;
    return await db.pacingModels.where().sortByCreatedDateDesc().findAllAsync(offset: skip, limit: take);
  }

  Future<List<PacingModel>> search(String search, int skip, int take) async {
    final db = await databaseRepository.database;

    return await db.pacingModels
        .where()
        .nameContains(search)
        .or()
        .categoriesElementContains(search)
        .or()
        .themesElementContains(search)
        .sortByCreatedDateDesc()
        .findAllAsync(offset: skip, limit: take);
  }
}
