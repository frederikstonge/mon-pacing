import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:isar/isar.dart';

import '../services/toaster_service.dart';
import 'converters/int_list_converter.dart';
import 'converters/string_list_converter.dart';
import 'entities/improvisation_entity.dart';
import 'entities/match_entity.dart';
import 'entities/match_tag_entity.dart';
import 'entities/pacing_entity.dart';
import 'entities/pacing_tag_entity.dart';
import 'entities/penalty_entity.dart';
import 'entities/performer_entity.dart';
import 'entities/point_entity.dart';
import 'entities/star_entity.dart';
import 'entities/tag_entity.dart';
import 'entities/team_entity.dart';
import 'entities/team_tag_entity.dart';
import 'legacy_database_repository.dart';
import 'legacy_entities/match_model.dart';
import 'legacy_entities/pacing_model.dart';
import 'legacy_entities/team_model.dart';
import 'matches_repository.dart';
import 'pacings_repository.dart';
import 'teams_repository.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [
  PacingEntity,
  MatchEntity,
  TeamEntity,
  PerformerEntity,
  ImprovisationEntity,
  PenaltyEntity,
  PointEntity,
  StarEntity,
  TagEntity,
  PacingTagEntity,
  MatchTagEntity,
  TeamTagEntity,
], daos: [
  PacingsRepository,
  MatchesRepository,
  TeamsRepository,
])
class AppDatabase extends _$AppDatabase {
  final LegacyDatabaseRepository legacyDatabaseRepository;
  final ToasterService toasterService;

  AppDatabase({
    required this.legacyDatabaseRepository,
    required this.toasterService,
  }) : super(
          _openConnection(),
        );

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        beforeOpen: (details) async {
          // Enable foreign keys
          await customStatement('PRAGMA foreign_keys = ON');

          // Run migrations from the legacy database
          await _migratePacings();
          await _migrateMatches();
          await _migrateTeams();
        },
        onCreate: (m) async {
          await m.createAll();
        },
      );

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'mon_pacing');
  }

  Future<void> _migratePacings() async {
    final db = await legacyDatabaseRepository.database;
    for (final pacing in await db.pacingModels.where().findAllAsync()) {
      final pacingId = await managers.pacingEntity.create(
        (p) => p(
          name: pacing.name,
          createdDate: Value(pacing.createdDate ?? DateTime.now()),
          modifiedDate: Value(pacing.modifiedDate ?? DateTime.now()),
          defaultNumberOfTeams: Value(pacing.defaultNumberOfTeams),
          integrationId: Value(pacing.integrationId),
          integrationEntityId: Value(pacing.integrationEntityId),
          integrationAdditionalData: Value(pacing.integrationAdditionalData),
        ),
      );

      for (final improvisation in pacing.improvisations) {
        await managers.improvisationEntity.create(
          (i) => i(
            pacing: Value(pacingId),
            order: pacing.improvisations.indexOf(improvisation),
            category: improvisation.category,
            durationsInSeconds: improvisation.durationsInSeconds,
            huddleTimerInSeconds: improvisation.huddleTimerInSeconds,
            notes: improvisation.notes,
            performers: improvisation.performers,
            theme: improvisation.theme,
            timeBufferInSeconds: improvisation.timeBufferInSeconds,
            type: improvisation.type,
            createdDate: Value(DateTime.now()),
            modifiedDate: Value(DateTime.now()),
            integrationEntityId: Value(improvisation.integrationEntityId),
            integrationAdditionalData: Value(improvisation.integrationAdditionalData),
          ),
        );
      }

      for (final tag in pacing.tags) {
        final tagEntity = await managers.tagEntity.filter((t) => t.name.equals(tag)).getSingleOrNull() ??
            await managers.tagEntity.createReturning(
              (t) => t(
                name: tag,
                createdDate: Value(DateTime.now()),
                modifiedDate: Value(DateTime.now()),
              ),
            );

        await managers.pacingTagEntity.create(
          (t) => t(
            pacing: pacingId,
            tag: tagEntity.id,
            createdDate: Value(DateTime.now()),
            modifiedDate: Value(DateTime.now()),
          ),
        );
      }

      //db.pacingModels.clear();
    }
  }

  Future<void> _migrateMatches() async {
    final db = await legacyDatabaseRepository.database;
    for (final match in await db.matchModels.where().findAllAsync()) {
      final matchId = await managers.matchEntity.create(
        (m) => m(
          name: match.name,
          createdDate: Value(match.createdDate ?? DateTime.now()),
          modifiedDate: Value(match.modifiedDate ?? DateTime.now()),
          enableStatistics: Value(match.enableStatistics),
          enablePenaltiesImpactPoints: Value(match.enablePenaltiesImpactPoints),
          penaltiesImpactType: Value(match.penaltiesImpactType),
          penaltiesRequiredToImpactPoints: Value(match.penaltiesRequiredToImpactPoints),
          enableMatchExpulsion: Value(match.enableMatchExpulsion),
          penaltiesRequiredToExpel: Value(match.penaltiesRequiredToExpel),
          integrationId: Value(match.integrationId),
          integrationEntityId: Value(match.integrationEntityId),
          integrationAdditionalData: Value(match.integrationAdditionalData),
          integrationRestrictMaximumPointPerImprovisation: Value(match.integrationRestrictMaximumPointPerImprovisation),
          integrationMinNumberOfImprovisations: Value(match.integrationMinNumberOfImprovisations),
          integrationMaxNumberOfImprovisations: Value(match.integrationMaxNumberOfImprovisations),
          integrationPenaltyTypes: Value(match.integrationPenaltyTypes),
        ),
      );

      final Map<int, int> improvisationIds = {};
      final Map<int, int> teamIds = {};
      final Map<int, int> performerIds = {};

      for (final improvisation in match.improvisations) {
        final improvisationId = await managers.improvisationEntity.create(
          (i) => i(
            match: Value(matchId),
            order: match.improvisations.indexOf(improvisation),
            category: improvisation.category,
            durationsInSeconds: improvisation.durationsInSeconds,
            huddleTimerInSeconds: improvisation.huddleTimerInSeconds,
            notes: improvisation.notes,
            performers: improvisation.performers,
            theme: improvisation.theme,
            timeBufferInSeconds: improvisation.timeBufferInSeconds,
            type: improvisation.type,
            createdDate: Value(DateTime.now()),
            modifiedDate: Value(DateTime.now()),
            integrationEntityId: Value(improvisation.integrationEntityId),
            integrationAdditionalData: Value(improvisation.integrationAdditionalData),
          ),
        );

        improvisationIds[improvisation.id] = improvisationId;
      }

      for (final team in match.teams) {
        final teamId = await managers.teamEntity.create(
          (t) => t(
            name: team.name,
            createdDate: Value(DateTime.now()),
            modifiedDate: Value(DateTime.now()),
            color: team.color,
          ),
        );

        teamIds[team.id] = teamId;

        for (final performer in team.performers) {
          final performerId = await managers.performerEntity.create(
            (p) => p(
              team: teamId,
              name: performer.name,
              createdDate: Value(DateTime.now()),
              modifiedDate: Value(DateTime.now()),
              integrationEntityId: Value(performer.integrationEntityId),
              integrationAdditionalData: Value(performer.integrationAdditionalData),
            ),
          );

          performerIds[performer.id] = performerId;
        }
      }

      for (final point in match.points) {
        await managers.pointEntity.create(
          (p) => p(
            improvisation: improvisationIds[point.improvisationId]!,
            team: teamIds[point.teamId]!,
            value: point.value,
            createdDate: Value(DateTime.now()),
            modifiedDate: Value(DateTime.now()),
            match: match.id,
          ),
        );
      }

      for (final penalty in match.penalties) {
        await managers.penaltyEntity.create(
          (p) => p(
            improvisation: improvisationIds[penalty.improvisationId]!,
            team: teamIds[penalty.teamId]!,
            major: penalty.major,
            type: penalty.type,
            performer: Value(penalty.performerId != null ? performerIds[penalty.performerId!] : null),
            createdDate: Value(DateTime.now()),
            modifiedDate: Value(DateTime.now()),
            match: match.id,
          ),
        );
      }

      for (final star in match.stars) {
        await managers.starEntity.create(
          (p) => p(
            team: teamIds[star.teamId]!,
            performer: performerIds[star.performerId]!,
            createdDate: Value(DateTime.now()),
            modifiedDate: Value(DateTime.now()),
            match: match.id,
          ),
        );
      }

      for (final tag in match.tags) {
        final tagEntity = await managers.tagEntity.filter((t) => t.name.equals(tag)).getSingleOrNull() ??
            await managers.tagEntity.createReturning(
              (t) => t(
                name: tag,
                createdDate: Value(DateTime.now()),
                modifiedDate: Value(DateTime.now()),
              ),
            );

        await managers.matchTagEntity.create(
          (t) => t(
            match: matchId,
            tag: tagEntity.id,
            createdDate: Value(DateTime.now()),
            modifiedDate: Value(DateTime.now()),
          ),
        );
      }
    }

    //db.matchModels.clear();
  }

  Future<void> _migrateTeams() async {
    final db = await legacyDatabaseRepository.database;
    for (final team in await db.teamModels.where().findAllAsync()) {
      final teamId = await managers.teamEntity.create(
        (t) => t(
          name: team.name,
          createdDate: Value(team.createdDate ?? DateTime.now()),
          modifiedDate: Value(team.modifiedDate ?? DateTime.now()),
          color: team.color,
        ),
      );

      for (final performer in team.performers) {
        await managers.performerEntity.create(
          (p) => p(
            team: teamId,
            name: performer.name,
            createdDate: Value(DateTime.now()),
            modifiedDate: Value(DateTime.now()),
            integrationEntityId: Value(performer.integrationEntityId),
            integrationAdditionalData: Value(performer.integrationAdditionalData),
          ),
        );
      }

      for (final tag in team.tags) {
        final tagEntity = await managers.tagEntity.filter((t) => t.name.equals(tag)).getSingleOrNull() ??
            await managers.tagEntity.createReturning(
              (t) => t(
                name: tag,
                createdDate: Value(DateTime.now()),
                modifiedDate: Value(DateTime.now()),
              ),
            );

        await managers.teamTagEntity.create(
          (t) => t(
            team: teamId,
            tag: tagEntity.id,
            createdDate: Value(DateTime.now()),
            modifiedDate: Value(DateTime.now()),
          ),
        );
      }
    }

    //db.teamModels.clear();
  }
}
