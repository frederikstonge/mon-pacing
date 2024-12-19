import 'package:collection/collection.dart';
import 'package:drift/drift.dart';
import 'package:isar/isar.dart';
import '../extensions/iterable_extensions.dart';
import '../models/improvisation_model.dart';
import '../models/match_model.dart';
import '../models/penalty_model.dart';
import '../models/performer_model.dart';
import '../models/point_model.dart';
import '../models/star_model.dart';
import '../models/team_model.dart';
import 'app_database.dart';
import 'entities/improvisation_entity.dart';
import 'entities/match_entity.dart';
import 'entities/match_tag_entity.dart';
import 'entities/penalty_entity.dart';
import 'entities/performer_entity.dart';
import 'entities/point_entity.dart';
import 'entities/star_entity.dart';
import 'entities/tag_entity.dart';
import 'entities/team_entity.dart';

part 'matches_repository.g.dart';

@DriftAccessor(
  tables: [
    MatchEntity,
    ImprovisationEntity,
    TeamEntity,
    PerformerEntity,
    PenaltyEntity,
    PointEntity,
    StarEntity,
    MatchTagEntity,
    TagEntity,
  ],
)
class MatchesRepository extends DatabaseAccessor<AppDatabase> with _$MatchesRepositoryMixin {
  MatchesRepository(
    super.attachedDatabase,
  );

  Future<MatchModel> add(MatchModel model) async {
    final db = await databaseRepository.database;
    final id = db.matchModels.autoIncrement();
    final now = DateTime.now();
    final entity = model.copyWith(id: id, createdDate: now, modifiedDate: now);
    await db.writeAsync((isar) => isar.matchModels.put(entity));
    return entity;
  }

  Future<void> remove(int id) async {
    final db = await databaseRepository.database;
    await db.writeAsync((isar) => isar.matchModels.delete(id));
  }

  Future<void> edit(MatchModel model) async {
    final entity = model.copyWith(modifiedDate: DateTime.now());
    final db = await databaseRepository.database;
    return db.writeAsync((isar) => isar.matchModels.put(entity));
  }

  Future<MatchModel?> get(int id) async {
    final db = await databaseRepository.database;
    return await db.matchModels.getAsync(id);
  }

  Future<List<MatchModel>> getList(int skip, int take) async {
    final db = await databaseRepository.database;
    return await db.matchModels.where().sortByCreatedDateDesc().findAllAsync(offset: skip, limit: take);
  }

  Future<List<MatchModel>> search(String search, List<String> selectedTags) async {
    final List<MatchModel> matches = [];
    var matchesQuery = attachedDatabase.managers.matchEntity.withReferences((p) => p(
          improvisationEntityRefs: true,
          penaltyEntityRefs: true,
          pointEntityRefs: true,
          starEntityRefs: true,
        ));

    if (selectedTags.isNotEmpty) {
      matchesQuery = matchesQuery.filter((p) => p.matchTagEntityRefs((f) => f.tag.name.isIn(selectedTags)));
    }

    if (search.isNotEmpty) {
      matchesQuery = matchesQuery.filter(
        (p) =>
            p.name.contains(search, caseInsensitive: true) |
            p.teamEntityRefs(
              (i) =>
                  i.name.contains(search, caseInsensitive: true) |
                  i.performerEntityRefs(
                    (e) => e.name.contains(search, caseInsensitive: true),
                  ),
            ) |
            p.improvisationEntityRefs(
              (i) => i.category.contains(search, caseInsensitive: true) | i.theme.contains(search, caseInsensitive: true),
            ),
      );
    }

    final response = await matchesQuery.orderBy((p) => p.createdDate.desc()).get();
    for (final matchResponse in response) {
      matches.add(await _getMatchModel(matchResponse));
    }

    return matches;
  }

  Future<List<String>> getAllTags({String query = ''}) async {
    var matchTagsQuery = attachedDatabase.managers.matchTagEntity.withReferences((p) => p(tag: true));
    if (query.isNotEmpty) {
      matchTagsQuery = matchTagsQuery.filter((t) => t.tag.name.contains(query, caseInsensitive: true));
    }

    final tags = await matchTagsQuery.get();
    return tags.selectMany((t) => t.$2.tag.prefetchedData!).map((t) => t.name).toSet().toList();
  }

  Future<MatchModel> _getMatchModel((MatchEntityData, $$MatchEntityTableReferences) matchResponse) async {
    final match = matchResponse.$1;
    final improvisations = matchResponse.$2.improvisationEntityRefs.prefetchedData ?? [];
    final penalties = matchResponse.$2.penaltyEntityRefs.prefetchedData ?? [];
    final points = matchResponse.$2.pointEntityRefs.prefetchedData ?? [];
    final stars = matchResponse.$2.starEntityRefs.prefetchedData ?? [];

    final matchTeams = await matchResponse.$2.teamEntityRefs.withReferences((p) => p(performerEntityRefs: true)).get();
    final teams = matchTeams.map((t) => t.$1);
    final performers = matchTeams.selectMany((t) => t.$2.performerEntityRefs.prefetchedData!);

    final matchTags = await matchResponse.$2.matchTagEntityRefs.withReferences((p) => p(tag: true)).get();
    final tags = matchTags.selectMany((t) => t.$2.tag.prefetchedData!);

    final performerModels = performers.map((p) => PerformerModel.fromEntity(p)).toList();
    final teamsModel = teams.map((t) => TeamModel.fromEntity(t, performerModels, null)).toList();
    final improvisationModels = improvisations.map((i) => ImprovisationModel.fromEntity(i)).toList();
    final penaltyModels = penalties.map((p) => PenaltyModel.fromEntity(p)).toList();
    final pointModels = points.map((p) => PointModel.fromEntity(p)).toList();
    final starModels = stars.map((s) => StarModel.fromEntity(s)).toList();
    final tagModels = tags.map((t) => t.name).toList();

    return MatchModel.fromEntity(
      match,
      teamsModel,
      improvisationModels,
      penaltyModels,
      pointModels,
      starModels,
      tagModels,
    );
  }
}
