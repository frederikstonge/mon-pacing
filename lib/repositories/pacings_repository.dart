import 'package:collection/collection.dart';
import 'package:isar/isar.dart';

import '../extensions/iterable_extensions.dart';
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

  Future<List<PacingModel>> search(String search, int skip, int take, List<String> selectedTags) async {
    final db = await databaseRepository.database;

    return await db.pacingModels
        .where()
        .nameContains(search, caseSensitive: false)
        .or()
        .categoriesElementContains(search, caseSensitive: false)
        .or()
        .themesElementContains(search, caseSensitive: false)
        .or()
        .anyOf(selectedTags, (q, t) => q.tagsElementContains(t))
        .sortByCreatedDateDesc()
        .findAllAsync(offset: skip, limit: take);
  }

  Future<Map<String, int>> getAllTags() async {
    final db = await databaseRepository.database;
    final tags = await db.pacingModels.where().tagsProperty().findAllAsync();
    return tags.selectMany((t) => t).groupListsBy((g) => g).map((k, v) => MapEntry(k, v.length));
  }
}
