import 'package:isar/isar.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'entities/match_entity.dart' as legacy_match;
import 'entities/pacing_entity.dart' as legacy_pacing;
import 'entities/team_entity.dart' as legacy_team;
import 'legacy_database_repository.dart';
import 'objectbox.g.dart';
import 'objects/improvisation_entity.dart';
import 'objects/match_entity.dart';
import 'objects/pacing_entity.dart';

class DatabaseRepository {
  final LegacyDatabaseRepository legacyDatabaseRepository;
  Store? _database;

  DatabaseRepository({required this.legacyDatabaseRepository});

  Future<Store> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _getDatabase();
    return _database!;
  }

  Future<Store> _getDatabase() async {
    final dir = await getApplicationDocumentsDirectory();
    final store = await openStore(directory: p.join(dir.path, 'mon-pacing'), queriesCaseSensitiveDefault: false);
    await _initialize(store);
    return store;
  }

  Future<void> _initialize(Store store) async {
    // Add any additional setup code, e.g. build queries.
    final legacyDatabase = await legacyDatabaseRepository.database;

    final pageSize = 20;

    final pacingCount = legacyDatabase.pacingModels.count();

    for (var page = 0; page <= (pacingCount / pageSize).floor(); page++) {
      final pacings = await legacyDatabase.pacingModels.where().findAllAsync(
        offset: page * pacingCount,
        limit: pageSize,
      );

      final newPacings =
          pacings.map((pacing) {
            final newPacing = PacingEntity();
            newPacing.id = 0;
            newPacing.name = pacing.name;
            newPacing.createdDate = pacing.createdDate;
            newPacing.modifiedDate = pacing.modifiedDate;
            newPacing.tags = pacing.tags;
            newPacing.defaultNumberOfTeams = pacing.defaultNumberOfTeams;
            newPacing.integrationId = pacing.integrationId;
            newPacing.integrationEntityId = pacing.integrationEntityId;
            newPacing.integrationAdditionalData = pacing.integrationAdditionalData;

            newPacing.improvisations.addAll(
              pacing.improvisations.map((e) {
                final newImprovisation = ImprovisationEntity();
                newImprovisation.id = 0;
                newImprovisation.type = e.type.index;
                newImprovisation.theme = e.theme;
                newImprovisation.category = e.category;
                newImprovisation.performers = e.performers;
                newImprovisation.durationsInSeconds = e.durationsInSeconds;
                newImprovisation.notes = e.notes;
                newImprovisation.huddleTimerInSeconds = e.huddleTimerInSeconds;
                newImprovisation.timeBufferInSeconds = e.timeBufferInSeconds;
                newImprovisation.integrationEntityId = e.integrationEntityId;
                newImprovisation.integrationAdditionalData = e.integrationAdditionalData;
                return newImprovisation;
              }),
            );

            return newPacing;
          }).toList();

      await store.box<PacingEntity>().putManyAsync(newPacings);
    }

    final matchCount = legacyDatabase.matchModels.count();

    for (var page = 0; page <= (matchCount / pageSize).floor(); page++) {
      final matches = await legacyDatabase.matchModels.where().findAllAsync(offset: page * matchCount, limit: pageSize);

      for (final match in matches) {
        var newMatch = MatchEntity();
        newMatch.id = 0;
        newMatch.name = match.name;
        newMatch.createdDate = match.createdDate;
        newMatch.modifiedDate = match.modifiedDate;
        newMatch.tags = match.tags;
        newMatch.enableMatchExpulsion = match.enableMatchExpulsion;
        newMatch.enablePenaltiesImpactPoints = match.enablePenaltiesImpactPoints;
        newMatch.enableStatistics = match.enableStatistics;
        newMatch.penaltiesImpactType = match.penaltiesImpactType.index;
        newMatch.penaltiesRequiredToExpel = match.penaltiesRequiredToExpel;
        newMatch.penaltiesRequiredToImpactPoints = match.penaltiesRequiredToImpactPoints;
        newMatch.integrationId = match.integrationId;
        newMatch.integrationEntityId = match.integrationEntityId;
        newMatch.integrationAdditionalData = match.integrationAdditionalData;
        newMatch.integrationPenaltyTypes = match.integrationPenaltyTypes;
        newMatch.integrationRestrictMaximumPointPerImprovisation =
            match.integrationRestrictMaximumPointPerImprovisation;
        newMatch.integrationMinNumberOfImprovisations = match.integrationMinNumberOfImprovisations;
        newMatch.integrationMaxNumberOfImprovisations = match.integrationMaxNumberOfImprovisations;

        newMatch.improvisations.addAll(
          match.improvisations.map((e) {
            final newImprovisation = ImprovisationEntity();
            newImprovisation.id = 0;
            newImprovisation.type = e.type.index;
            newImprovisation.theme = e.theme;
            newImprovisation.category = e.category;
            newImprovisation.performers = e.performers;
            newImprovisation.durationsInSeconds = e.durationsInSeconds;
            newImprovisation.notes = e.notes;
            newImprovisation.huddleTimerInSeconds = e.huddleTimerInSeconds;
            newImprovisation.timeBufferInSeconds = e.timeBufferInSeconds;
            newImprovisation.integrationEntityId = e.integrationEntityId;
            newImprovisation.integrationAdditionalData = e.integrationAdditionalData;
            return newImprovisation;
          }),
        );

        newMatch.teams.addAll();

        newMatch = await store.box<MatchEntity>().putAndGetAsync(newMatch);

        newMatch.stars.addAll();

        newMatch.points.addAll();

        newMatch.penalties.addAll();
      }
    }

    final teams = await legacyDatabase.teamModels.where().findAllAsync();
  }
}
