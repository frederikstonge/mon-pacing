import 'package:isar/isar.dart';

import '../extensions/iterable_extensions.dart';
import 'database_repository.dart';
import 'entities/pacing_entity.dart';

class PacingsRepository {
  final DatabaseRepository databaseRepository;

  const PacingsRepository({required this.databaseRepository});

  Future<PacingEntity> add(PacingEntity entity) async {
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

  Future<void> edit(PacingEntity entity) async {
    final model = entity.copyWith(modifiedDate: DateTime.now());
    final db = await databaseRepository.database;
    await db.writeAsync((isar) => isar.pacingModels.put(model));
  }

  Future<PacingEntity?> get(int id) async {
    final db = await databaseRepository.database;
    return await db.pacingModels.getAsync(id);
  }

  Future<List<PacingEntity>> getList(int skip, int take) async {
    final db = await databaseRepository.database;
    return await db.pacingModels.where().sortByCreatedDateDesc().findAllAsync(offset: skip, limit: take);
  }

  Future<List<PacingEntity>> search(String search, List<String> selectedTags) async {
    final db = await databaseRepository.database;

    return await db.pacingModels
        .where()
        .optional(selectedTags.isNotEmpty, (q) => q.anyOf(selectedTags, (sq, t) => sq.tagsElementEqualTo(t)))
        .and()
        .optional(
          search.isNotEmpty,
          (q) => q.group(
            (g) => g
                .nameContains(search, caseSensitive: false)
                .or()
                .categoriesElementContains(search, caseSensitive: false)
                .or()
                .themesElementContains(search, caseSensitive: false),
          ),
        )
        .sortByCreatedDateDesc()
        .findAllAsync();
  }

  Future<List<String>> getAllTags({String query = ''}) async {
    final db = await databaseRepository.database;
    final tags =
        await db.pacingModels
            .where()
            .optional(query.isNotEmpty, (q) => q.tagsElementContains(query))
            .tagsProperty()
            .findAllAsync();
    return tags.selectMany((t) => t).toSet().toList();
  }

  Future<List<String>> getAllCategories({String query = ''}) async {
    final db = await databaseRepository.database;
    final categories =
        await db.pacingModels
            .where()
            .optional(query.isNotEmpty, (q) => q.categoriesElementContains(query))
            .categoriesProperty()
            .findAllAsync();
    return categories.selectMany((t) => t).toSet().toList();
  }
}
