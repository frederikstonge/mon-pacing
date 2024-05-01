import 'package:isar/isar.dart';
import '../extensions/match_extensions.dart';
import '../models/entities/match_entity_model.dart';
import '../models/improvisation_model.dart';
import '../models/match_model.dart';
import '../models/penalty_model.dart';
import '../models/point_model.dart';
import '../models/team_model.dart';
import '../objectbox.g.dart';
import 'database_repository.dart';
import 'legacy_database_repository.dart';

class MatchesRepository {
  final LegacyDatabaseRepository legacyDatabaseRepository;
  final DatabaseRepository databaseRepository;

  const MatchesRepository({
    required this.legacyDatabaseRepository,
    required this.databaseRepository,
  });

  Future<MatchModel> add(MatchModel match) async {
    final db = await databaseRepository.database;
    final box = db.box<MatchEntityModel>();
    final entity = match.toEntity();
    final now = DateTime.now();
    entity.createdDate = now;
    entity.modifiedDate = now;
    final newEntity = await box.putAndGetAsync(entity, mode: PutMode.put);
    return MatchModel.fromEntity(newEntity);
  }

  Future<void> delete(int id) async {
    final db = await databaseRepository.database;
    final box = db.box<MatchEntityModel>();
    await box.removeAsync(id);
  }

  Future<void> edit(MatchModel match) async {
    final db = await databaseRepository.database;
    final box = db.box<MatchEntityModel>();
    final entity = match.toEntity();
    final now = DateTime.now();
    entity.modifiedDate = now;
    await box.putAsync(entity, mode: PutMode.put);
  }

  Future<MatchModel?> get(int id) async {
    final db = await databaseRepository.database;
    final box = db.box<MatchEntityModel>();
    final entity = await box.getAsync(id);
    if (entity == null) {
      return null;
    }

    return MatchModel.fromEntity(entity);
  }

  Future<List<MatchModel>> getList(int skip, int take) async {
    await _migrateToObjectBox();

    final db = await databaseRepository.database;
    final box = db.box<MatchEntityModel>();
    final query = box.query().order(MatchEntityModel_.createdDate, flags: Order.descending).build();
    query.offset = skip;
    query.limit = take;
    final entities = await query.findAsync();
    return entities.map((e) => MatchModel.fromEntity(e)).toList();
  }

  Future<void> _migrateToObjectBox() async {
    final legacyDb = await legacyDatabaseRepository.database;
    final matches = await legacyDb.matchModels.where().sortByCreatedDate().findAllAsync();

    if (matches.isNotEmpty) {
      final newMatches = matches.map(
        (e) => e.copyWith(
          id: 0,
          teams: List<TeamModel>.from(e.teams).map((e) => e.copyWith(id: 0)).toList(),
          improvisations: List<ImprovisationModel>.from(e.improvisations).map((e) => e.copyWith(id: 0)).toList(),
          points: List<PointModel>.from(e.points).map((e) => e.copyWith(id: 0)).toList(),
          penalties: List<PenaltyModel>.from(e.penalties).map((e) => e.copyWith(id: 0)).toList(),
        ),
      );

      final db = await databaseRepository.database;
      final box = db.box<MatchEntityModel>();
      final entities = newMatches.map((e) => e.toEntity()).toList();
      await box.putManyAsync(entities);

      await legacyDb.writeAsync((isar) => isar.matchModels.deleteAll(matches.map((e) => e.id).toList()));
    }
  }
}
