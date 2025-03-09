import 'package:isar/isar.dart';

import '../extensions/iterable_extensions.dart';
import 'entities/pacing_entity.dart';
import 'entities/team_entity.dart';
import 'legacy_database_repository.dart';

class TeamsRepository {
  final LegacyDatabaseRepository databaseRepository;

  const TeamsRepository({required this.databaseRepository});

  Future<TeamEntity> add(TeamEntity entity) async {
    final db = await databaseRepository.database;
    final id = db.pacingModels.autoIncrement();
    final now = DateTime.now();
    final model = entity.copyWith(id: id, createdDate: now, modifiedDate: now);
    await db.writeAsync((isar) => isar.teamModels.put(model));
    return model;
  }

  Future<void> delete(int id) async {
    final db = await databaseRepository.database;
    await db.writeAsync((isar) => isar.teamModels.delete(id));
  }

  Future<void> edit(TeamEntity entity) async {
    final model = entity.copyWith(modifiedDate: DateTime.now());
    final db = await databaseRepository.database;
    await db.writeAsync((isar) => isar.teamModels.put(model));
  }

  Future<TeamEntity?> get(int id) async {
    final db = await databaseRepository.database;
    return await db.teamModels.getAsync(id);
  }

  Future<List<TeamEntity>> getList(int skip, int take) async {
    final db = await databaseRepository.database;
    return await db.teamModels.where().sortByCreatedDateDesc().findAllAsync(offset: skip, limit: take);
  }

  Future<List<TeamEntity>> search(String search, List<String> selectedTags) async {
    final db = await databaseRepository.database;

    return await db.teamModels
        .where()
        .optional(selectedTags.isNotEmpty, (q) => q.anyOf(selectedTags, (sq, t) => sq.tagsElementEqualTo(t)))
        .and()
        .optional(
          search.isNotEmpty,
          (q) => q.group(
            (g) => g
                .nameContains(search, caseSensitive: false)
                .or()
                .performerNamesElementContains(search, caseSensitive: false),
          ),
        )
        .sortByCreatedDateDesc()
        .findAllAsync();
  }

  Future<List<String>> getAllTags({String query = ''}) async {
    final db = await databaseRepository.database;
    final tags =
        await db.teamModels
            .where()
            .optional(query.isNotEmpty, (q) => q.tagsElementContains(query))
            .tagsProperty()
            .findAllAsync();
    return tags.selectMany((t) => t).toSet().toList();
  }
}
