import 'package:isar/isar.dart';

import '../extensions/iterable_extensions.dart';
import 'legacy_database_repository.dart';
import 'legacy_entities/match_entity.dart';

class MatchesRepository {
  final LegacyDatabaseRepository databaseRepository;

  const MatchesRepository({required this.databaseRepository});

  Future<MatchEntity> add(MatchEntity entity) async {
    final db = await databaseRepository.database;
    final id = db.matchModels.autoIncrement();
    final now = DateTime.now();
    final model = entity.copyWith(id: id, createdDate: now, modifiedDate: now);
    await db.writeAsync((isar) => isar.matchModels.put(model));
    return model;
  }

  Future<void> delete(int id) async {
    final db = await databaseRepository.database;
    await db.writeAsync((isar) => isar.matchModels.delete(id));
  }

  Future<void> edit(MatchEntity entity) async {
    final model = entity.copyWith(modifiedDate: DateTime.now());
    final db = await databaseRepository.database;
    return db.writeAsync((isar) => isar.matchModels.put(model));
  }

  Future<MatchEntity?> get(int id) async {
    final db = await databaseRepository.database;
    return await db.matchModels.getAsync(id);
  }

  Future<List<MatchEntity>> getList(int skip, int take) async {
    final db = await databaseRepository.database;
    return await db.matchModels.where().sortByCreatedDateDesc().findAllAsync(offset: skip, limit: take);
  }

  Future<List<MatchEntity>> search(String search, List<String> selectedTags) async {
    final db = await databaseRepository.database;

    return await db.matchModels
        .where()
        .optional(selectedTags.isNotEmpty, (q) => q.anyOf(selectedTags, (sq, t) => sq.tagsElementEqualTo(t)))
        .and()
        .optional(
          search.isNotEmpty,
          (q) => q.group(
            (g) => g
                .nameContains(search, caseSensitive: false)
                .or()
                .teamNamesElementContains(search, caseSensitive: false),
          ),
        )
        .sortByCreatedDateDesc()
        .findAllAsync();
  }

  Future<List<String>> getAllTags({String query = ''}) async {
    final db = await databaseRepository.database;
    final tags =
        await db.matchModels
            .where()
            .optional(query.isNotEmpty, (q) => q.tagsElementContains(query))
            .tagsProperty()
            .findAllAsync();
    return tags.selectMany((t) => t).toSet().toList();
  }
}
