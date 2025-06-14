import 'dart:async';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:isar/isar.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../cubits/migration/migration_cubit.dart';
import '../cubits/migration/migration_state.dart';
import '../l10n/localizer.dart';
import '../mutex/mutex.dart';
import 'entities/improvisation_entity.dart';
import 'entities/match_entity.dart';
import 'entities/pacing_entity.dart';
import 'entities/penalty_entity.dart';
import 'entities/performer_entity.dart';
import 'entities/point_entity.dart';
import 'entities/star_entity.dart';
import 'entities/tag_entity.dart';
import 'entities/team_entity.dart';
import 'legacy_database_repository.dart';
import 'legacy_entities/match_entity.dart' as legacy_match;
import 'legacy_entities/pacing_entity.dart' as legacy_pacing;
import 'legacy_entities/team_entity.dart' as legacy_team;
import 'objectbox.g.dart';

class DatabaseRepository {
  static const pageSize = 20;
  final LegacyDatabaseRepository legacyDatabaseRepository;
  final MigrationCubit migrationCubit;
  Store? _database;

  DatabaseRepository({required this.legacyDatabaseRepository, required this.migrationCubit});

  Future<Store> get database async {
    if (_database != null) {
      return _database!;
    }

    return await Mutex.protect(() async {
      if (_database != null) {
        return _database!;
      }

      _database = await _getDatabase();
      return _database!;
    });
  }

  Future<Store> _getDatabase() async {
    final dir = await getApplicationDocumentsDirectory();
    final path = p.join(dir.path, 'mon-pacing');

    if (Store.isOpen(path)) {
      if (_database == null) {
        throw Exception('Store is already open');
      }

      return _database!;
    }

    final store = await openStore(directory: path, queriesCaseSensitiveDefault: false);
    await _initialize(store);
    return store;
  }

  Future<void> _initialize(Store store) async {
    // Add any additional setup code, e.g. build queries.
    if (migrationCubit.state.status != MigrationStatus.success) {
      try {
        await _clearDatabase(store);
        await _migrateDatabase(store);
        await _clearLegacyDatabase();
      } catch (e) {
        await FirebaseCrashlytics.instance.recordError(e, null);
      }
    }
  }

  Future<void> _clearDatabase(Store store) async {
    await store.box<PointEntity>().removeAllAsync();
    await store.box<PenaltyEntity>().removeAllAsync();
    await store.box<StarEntity>().removeAllAsync();
    await store.box<PerformerEntity>().removeAllAsync();
    await store.box<TeamEntity>().removeAllAsync();
    await store.box<ImprovisationEntity>().removeAllAsync();
    await store.box<TagEntity>().removeAllAsync();
    await store.box<MatchEntity>().removeAllAsync();
    await store.box<PacingEntity>().removeAllAsync();
    await store.box<ImprovisationEntity>().removeAllAsync();
  }

  Future<void> _clearLegacyDatabase() async {
    final legacyDatabase = await legacyDatabaseRepository.database;
    legacyDatabase.write((db) {
      db.pacingModels.clear();
      db.teamModels.clear();
      db.matchModels.clear();
    });

    legacyDatabase.close(deleteFromDisk: true);
  }

  Future<void> _migrateDatabase(Store store) async {
    final legacyDatabase = await legacyDatabaseRepository.database;

    final pacingCount = legacyDatabase.pacingModels.count();
    final teamCount = legacyDatabase.teamModels.count();
    final matchCount = legacyDatabase.matchModels.count();

    final maximumPacingPage = (pacingCount / pageSize).floor();
    final maximumTeamPage = (teamCount / pageSize).floor();
    final maximumMatchPage = (matchCount / pageSize).floor();

    final total = pacingCount + teamCount + matchCount;
    var progress = 0;

    try {
      if (total > 0) {
        migrationCubit.startMigration(title: Localizer.current.migrationStarted, total: total);
      }

      // Pacings
      if (pacingCount > 0) {
        migrationCubit.updateProgress(title: Localizer.current.migrationPacings);
      }

      for (var page = 0; page <= maximumPacingPage; page++) {
        final pacings = await legacyDatabase.pacingModels.where().findAllAsync(
          offset: page * pageSize,
          limit: pageSize,
        );
        for (var pacing in pacings) {
          final newPacing = PacingEntity(
            id: 0,
            name: pacing.name,
            createdDate: pacing.createdDate,
            modifiedDate: DateTime.now(),
            defaultNumberOfTeams: pacing.defaultNumberOfTeams,
            integrationId: pacing.integrationId,
            integrationEntityId: pacing.integrationEntityId,
            integrationAdditionalData: pacing.integrationAdditionalData,
          );

          newPacing.tags.addAll(
            pacing.tags.map((e) {
              final newTag = TagEntity(id: 0, name: e);
              return newTag;
            }),
          );

          newPacing.improvisations.addAll(
            pacing.improvisations.asMap().entries.map((e) {
              final newImprovisation = ImprovisationEntity(
                id: 0,
                order: e.key,
                type: e.value.type.index,
                theme: e.value.theme,
                category: e.value.category,
                performers: e.value.performers,
                durationsInSeconds: e.value.durationsInSeconds,
                notes: e.value.notes,
                huddleTimerInSeconds: e.value.huddleTimerInSeconds,
                timeBufferInSeconds: e.value.timeBufferInSeconds,
                integrationEntityId: e.value.integrationEntityId,
                integrationAdditionalData: e.value.integrationAdditionalData,
              );

              return newImprovisation;
            }),
          );

          await store.box<PacingEntity>().putAsync(newPacing);
          migrationCubit.updateProgress(count: progress++);
        }
      }

      // Teams
      if (teamCount > 0) {
        migrationCubit.updateProgress(title: Localizer.current.migrationTeams);
      }

      for (var page = 0; page <= maximumTeamPage; page++) {
        final teams = await legacyDatabase.teamModels.where().findAllAsync(offset: page * pageSize, limit: pageSize);
        for (var team in teams) {
          final newTeam = TeamEntity(
            id: 0,
            name: team.name,
            color: team.color,
            createdDate: team.createdDate,
            modifiedDate: DateTime.now(),
            hasMatch: false,
          );

          newTeam.tags.addAll(
            team.tags.map((e) {
              final newTag = TagEntity(id: 0, name: e);
              return newTag;
            }),
          );

          newTeam.performers.addAll(
            team.performers.asMap().entries.map((e) {
              final newPerformer = PerformerEntity(
                id: 0,
                order: e.key,
                name: e.value.name,
                integrationEntityId: e.value.integrationEntityId,
                integrationAdditionalData: e.value.integrationAdditionalData,
              );

              return newPerformer;
            }),
          );

          await store.box<TeamEntity>().putAsync(newTeam);
          migrationCubit.updateProgress(count: progress++);
        }
      }

      // Matches
      if (matchCount > 0) {
        migrationCubit.updateProgress(title: Localizer.current.migrationMatches);
      }

      for (var page = 0; page <= maximumMatchPage; page++) {
        final matches = await legacyDatabase.matchModels.where().findAllAsync(offset: page * pageSize, limit: pageSize);

        for (var match in matches) {
          final teamMap = <int, TeamEntity>{};
          final performerMap = <int, PerformerEntity>{};
          final improvisationMap = <int, ImprovisationEntity>{};

          for (final team in match.teams) {
            final newPerformers = team.performers.asMap().entries.map((e) {
              final newPerformer = PerformerEntity(
                id: 0,
                order: e.key,
                name: e.value.name,
                integrationEntityId: e.value.integrationEntityId,
                integrationAdditionalData: e.value.integrationAdditionalData,
              );

              return newPerformer;
            }).toList();

            final performers = await store.box<PerformerEntity>().putAndGetManyAsync(newPerformers);
            for (var i = 0; i < team.performers.length; i++) {
              performerMap[team.performers[i].id] = performers[i];
            }
          }

          final newTeams = match.teams.map((team) {
            final newTeam = TeamEntity(
              id: 0,
              name: team.name,
              color: team.color,
              createdDate: DateTime.now(),
              modifiedDate: DateTime.now(),
              hasMatch: true,
            );

            newTeam.performers.addAll(
              performerMap.entries.where((e) => team.performers.any((p) => p.id == e.key)).map((e) => e.value).toList(),
            );

            return newTeam;
          }).toList();

          final teams = await store.box<TeamEntity>().putAndGetManyAsync(newTeams);
          for (var i = 0; i < match.teams.length; i++) {
            teamMap[match.teams[i].id] = teams[i];
          }

          final newImprovisations = match.improvisations.asMap().entries.map((e) {
            final newImprovisation = ImprovisationEntity(
              id: 0,
              order: e.key,
              type: e.value.type.index,
              theme: e.value.theme,
              category: e.value.category,
              performers: e.value.performers,
              durationsInSeconds: e.value.durationsInSeconds,
              notes: e.value.notes,
              huddleTimerInSeconds: e.value.huddleTimerInSeconds,
              timeBufferInSeconds: e.value.timeBufferInSeconds,
              integrationEntityId: e.value.integrationEntityId,
              integrationAdditionalData: e.value.integrationAdditionalData,
            );

            return newImprovisation;
          }).toList();

          final improvisations = await store.box<ImprovisationEntity>().putAndGetManyAsync(newImprovisations);
          for (var i = 0; i < match.improvisations.length; i++) {
            improvisationMap[match.improvisations[i].id] = improvisations[i];
          }

          final newMatch = MatchEntity(
            id: 0,
            name: match.name,
            createdDate: match.createdDate,
            modifiedDate: DateTime.now(),
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

          newMatch.teams.addAll(teams);

          newMatch.tags.addAll(
            match.tags.map((e) {
              final newTag = TagEntity(id: 0, name: e);
              return newTag;
            }),
          );

          newMatch.improvisations.addAll(improvisations);

          newMatch.stars.addAll(
            match.stars.asMap().entries.map(
              (e) => StarEntity(
                id: 0,
                order: e.key,
                performerId: performerMap[e.value.performerId]!.id,
                teamId: teamMap[e.value.teamId]!.id,
              ),
            ),
          );

          newMatch.points.addAll(
            match.points.map(
              (e) => PointEntity(
                id: 0,
                improvisationId: improvisationMap[e.improvisationId]!.id,
                teamId: teamMap[e.teamId]!.id,
                value: e.value,
              ),
            ),
          );

          newMatch.penalties.addAll(
            match.penalties.map(
              (e) => PenaltyEntity(
                id: 0,
                improvisationId: improvisationMap[e.improvisationId]!.id,
                teamId: teamMap[e.teamId]!.id,
                type: e.type,
                major: e.major,
                performerId: e.performerId != null ? performerMap[e.performerId]!.id : null,
              ),
            ),
          );

          await store.box<MatchEntity>().putAsync(newMatch);
          migrationCubit.updateProgress(count: progress++);
        }
      }

      migrationCubit.completeMigration(title: Localizer.current.migrationCompleted);
    } catch (_) {
      migrationCubit.migrationError(errorMessage: Localizer.current.migrationError);
    }
  }

  Future<void> close() async {
    if (_database != null) {
      _database!.close();
      _database = null;
    }
  }
}
