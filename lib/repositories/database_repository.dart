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
            final newPacing = PacingEntity(
              id: 0,
              name: pacing.name,
              createdDate: pacing.createdDate,
              modifiedDate: pacing.modifiedDate,
              tags: pacing.tags,
              defaultNumberOfTeams: pacing.defaultNumberOfTeams,
              integrationId: pacing.integrationId,
              integrationEntityId: pacing.integrationEntityId,
              integrationAdditionalData: pacing.integrationAdditionalData,
            );

            newPacing.improvisations.addAll(
              pacing.improvisations.map((e) {
                final newImprovisation = ImprovisationEntity(
                  id: 0,
                  type: e.type.index,
                  theme: e.theme,
                  category: e.category,
                  performers: e.performers,
                  durationsInSeconds: e.durationsInSeconds,
                  notes: e.notes,
                  huddleTimerInSeconds: e.huddleTimerInSeconds,
                  timeBufferInSeconds: e.timeBufferInSeconds,
                  integrationEntityId: e.integrationEntityId,
                  integrationAdditionalData: e.integrationAdditionalData,
                );

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
        var newMatch = MatchEntity(
          id: 0,
          name: match.name,
          createdDate: match.createdDate,
          modifiedDate: match.modifiedDate,
          tags: match.tags,
          enableMatchExpulsion: match.enableMatchExpulsion,
          enablePenaltiesImpactPoints: match.enablePenaltiesImpactPoints,
          enableStatistics: match.enableStatistics,
          penaltiesImpactType: match.penaltiesImpactType.index,
          penaltiesRequiredToExpel: match.penaltiesRequiredToExpel,
          penaltiesRequiredToImpactPoints: match.penaltiesRequiredToImpactPoints,
          integrationId: match.integrationId,
          integrationEntityId: match.integrationEntityId,
          integrationAdditionalData: match.integrationAdditionalData,
          integrationPenaltyTypes: match.integrationPenaltyTypes,
          integrationRestrictMaximumPointPerImprovisation: match.integrationRestrictMaximumPointPerImprovisation,
          integrationMinNumberOfImprovisations: match.integrationMinNumberOfImprovisations,
          integrationMaxNumberOfImprovisations: match.integrationMaxNumberOfImprovisations,
        );

        newMatch.improvisations.addAll(
          match.improvisations.map((e) {
            final newImprovisation = ImprovisationEntity(
              id: 0,
              type: e.type.index,
              theme: e.theme,
              category: e.category,
              performers: e.performers,
              durationsInSeconds: e.durationsInSeconds,
              notes: e.notes,
              huddleTimerInSeconds: e.huddleTimerInSeconds,
              timeBufferInSeconds: e.timeBufferInSeconds,
              integrationEntityId: e.integrationEntityId,
              integrationAdditionalData: e.integrationAdditionalData,
            );

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
