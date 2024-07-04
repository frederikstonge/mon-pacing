import 'package:isar/isar.dart';

import '../extensions/iterable_extensions.dart';
import '../models/pacing_model.dart';
import '../models/team_model.dart';
import 'database_repository.dart';

class TeamsRepository {
  final DatabaseRepository databaseRepository;

  const TeamsRepository({
    required this.databaseRepository,
  });

  Future<TeamModel> add(TeamModel entity) async {
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

  Future<void> edit(TeamModel entity) async {
    final model = entity.copyWith(modifiedDate: DateTime.now());
    final db = await databaseRepository.database;
    await db.writeAsync((isar) => isar.teamModels.put(model));
  }

  Future<TeamModel?> get(int id) async {
    final db = await databaseRepository.database;
    return await db.teamModels.getAsync(id);
  }

  Future<List<TeamModel>> getList(int skip, int take) async {
    final db = await databaseRepository.database;
    return await db.teamModels.where().sortByCreatedDateDesc().findAllAsync(offset: skip, limit: take);
  }

  Future<List<TeamModel>> search(String search, List<String> selectedTags) async {
    if (search.isEmpty && selectedTags.isEmpty) {
      return [];
    }

    final db = await databaseRepository.database;

    return await db.teamModels
        .where()
        .optional(selectedTags.isNotEmpty, (q) => q.anyOf(selectedTags, (sq, t) => sq.tagsElementEqualTo(t)))
        .and()
        .optional(
          search.isNotEmpty,
          (q) => q.group((g) => g.nameContains(search, caseSensitive: false).or().performerNamesElementContains(search, caseSensitive: false)),
        )
        .sortByCreatedDateDesc()
        .findAllAsync();
  }

  Future<List<String>> getAllTags({String query = ''}) async {
    final db = await databaseRepository.database;
    final tags = await db.teamModels.where().optional(query.isNotEmpty, (q) => q.tagsElementContains(query)).tagsProperty().findAllAsync();
    return tags.selectMany((t) => t).toSet().toList();
  }
}
