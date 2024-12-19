import 'package:drift/drift.dart';
import 'package:isar/isar.dart';

import '../extensions/iterable_extensions.dart';
import '../models/performer_model.dart';
import '../models/team_model.dart';
import 'app_database.dart';
import 'entities/performer_entity.dart';
import 'entities/tag_entity.dart';
import 'entities/team_entity.dart';
import 'entities/team_tag_entity.dart';

part 'teams_repository.g.dart';

@DriftAccessor(
  tables: [
    TeamEntity,
    PerformerEntity,
    TeamTagEntity,
    TagEntity,
  ],
)
class TeamsRepository extends DatabaseAccessor<AppDatabase> with _$TeamsRepositoryMixin {
  TeamsRepository(
    super.attachedDatabase,
  );

  Future<TeamModel> add(TeamModel entity) async {
    final db = await databaseRepository.database;
    final id = db.pacingModels.autoIncrement();
    final now = DateTime.now();
    final model = entity.copyWith(id: id, createdDate: now, modifiedDate: now);
    await db.writeAsync((isar) => isar.teamModels.put(model));
    return model;
  }

  Future<void> remove(int id) async {
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
    final List<TeamModel> teams = [];
    var teamsQuery = attachedDatabase.managers.teamEntity.withReferences((p) => p(performerEntityRefs: true));
    if (selectedTags.isNotEmpty) {
      teamsQuery = teamsQuery.filter((t) => t.teamTagEntityRefs((f) => f.tag.name.isIn(selectedTags)));
    }

    if (search.isNotEmpty) {
      teamsQuery = teamsQuery.filter(
        (t) =>
            t.name.contains(search, caseInsensitive: true) |
            t.performerEntityRefs(
              (p) => p.name.contains(search, caseInsensitive: true),
            ),
      );
    }

    final response = await teamsQuery.orderBy((p) => p.createdDate.desc()).get();
    for (final teamResponse in response) {
      teams.add(await _getTeamModel(teamResponse));
    }

    return teams;
  }

  Future<List<String>> getAllTags({String query = ''}) async {
    var teamTagsQuery = attachedDatabase.managers.teamTagEntity.withReferences((p) => p(tag: true));
    if (query.isNotEmpty) {
      teamTagsQuery = teamTagsQuery.filter((t) => t.tag.name.contains(query, caseInsensitive: true));
    }

    final tags = await teamTagsQuery.get();
    return tags.selectMany((t) => t.$2.tag.prefetchedData!).map((t) => t.name).toSet().toList();
  }

  Future<TeamModel> _getTeamModel((TeamEntityData, $$TeamEntityTableReferences) teamResponse) async {
    final team = teamResponse.$1;
    final performers = teamResponse.$2.performerEntityRefs.prefetchedData ?? [];

    final pacingTags = await teamResponse.$2.teamTagEntityRefs.withReferences((p) => p(tag: true)).get();
    final tags = pacingTags.selectMany((t) => t.$2.tag.prefetchedData!);

    final performerModels = performers.map((p) => PerformerModel.fromEntity(p)).toList();
    final tagModels = tags.map((t) => t.name).toList();

    return TeamModel.fromEntity(
      team,
      performerModels,
      tagModels,
    );
  }
}
