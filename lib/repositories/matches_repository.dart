import '../extensions/iterable_extensions.dart';
import 'database_repository.dart';
import 'entities/improvisation_entity.dart';
import 'entities/match_entity.dart';
import 'entities/penalty_entity.dart';
import 'entities/performer_entity.dart';
import 'entities/point_entity.dart';
import 'entities/star_entity.dart';
import 'entities/tag_entity.dart';
import 'entities/team_entity.dart';
import 'objectbox.g.dart';

class MatchesRepository {
  final DatabaseRepository databaseRepository;

  const MatchesRepository({required this.databaseRepository});

  Future<MatchEntity> add(MatchEntity entity) async {
    final db = await databaseRepository.database;
    final box = db.box<MatchEntity>();
    final now = DateTime.now();
    entity.createdDate = now;
    entity.modifiedDate = now;
    return await box.putAndGetAsync(entity);
  }

  Future<void> delete(MatchEntity entity) async {
    final db = await databaseRepository.database;
    final box = db.box<MatchEntity>();
    final improvisationBox = db.box<ImprovisationEntity>();
    final performerBox = db.box<PerformerEntity>();
    final teamBox = db.box<TeamEntity>();
    final pointBox = db.box<PointEntity>();
    final penaltyBox = db.box<PenaltyEntity>();
    final starBox = db.box<StarEntity>();
    final tagBox = db.box<TagEntity>();

    db.runInTransaction(TxMode.write, () {
      improvisationBox.removeMany(entity.improvisations.map((e) => e.id).toList());
      performerBox.removeMany(entity.teams.selectMany((t) => t.performers).map((e) => e.id).toList());
      teamBox.removeMany(entity.teams.map((e) => e.id).toList());
      pointBox.removeMany(entity.points.map((e) => e.id).toList());
      penaltyBox.removeMany(entity.penalties.map((e) => e.id).toList());
      starBox.removeMany(entity.stars.map((e) => e.id).toList());
      tagBox.removeMany(entity.tags.map((e) => e.id).toList());

      box.remove(entity.id);
    });
  }

  Future<MatchEntity> edit(MatchEntity entity) async {
    final db = await databaseRepository.database;
    final box = db.box<MatchEntity>();
    final improvisationBox = db.box<ImprovisationEntity>();
    final performerBox = db.box<PerformerEntity>();
    final teamBox = db.box<TeamEntity>();
    final pointBox = db.box<PointEntity>();
    final penaltyBox = db.box<PenaltyEntity>();
    final starBox = db.box<StarEntity>();
    final tagBox = db.box<TagEntity>();

    final previousEntity = await box.getAsync(entity.id);

    final removedImprovisations =
        previousEntity!.improvisations.where((e) => !entity.improvisations.any((i) => i.id == e.id)).toList();
    final editedImprovisations = entity.improvisations.where((e) => e.id != 0).toList();

    final removedPerformers =
        previousEntity.teams
            .selectMany((t) => t.performers)
            .where((e) => !entity.teams.any((i) => i.id == e.id))
            .toList();
    final editedPerformers = entity.teams.selectMany((t) => t.performers).where((e) => e.id != 0).toList();

    final removedTeams = previousEntity.teams.where((e) => !entity.teams.any((i) => i.id == e.id)).toList();
    final editedTeams = entity.teams.where((e) => e.id != 0).toList();

    final removedPoints = previousEntity.points.where((e) => !entity.points.any((i) => i.id == e.id)).toList();
    final editedPoints = entity.points.where((e) => e.id != 0).toList();

    final removedPenalties = previousEntity.penalties.where((e) => !entity.penalties.any((i) => i.id == e.id)).toList();
    final editedPenalties = entity.penalties.where((e) => e.id != 0).toList();

    final removedStars = previousEntity.stars.where((e) => !entity.stars.any((i) => i.id == e.id)).toList();
    final editedStars = entity.stars.where((e) => e.id != 0).toList();

    final removedTags = previousEntity.tags.where((e) => !entity.tags.any((i) => i.id == e.id)).toList();
    final editedTags = entity.tags.where((e) => e.id != 0).toList();

    db.runInTransaction(TxMode.write, () {
      improvisationBox.putMany(editedImprovisations);
      improvisationBox.removeMany(removedImprovisations.map((e) => e.id).toList());

      performerBox.putMany(editedPerformers);
      performerBox.removeMany(removedPerformers.map((e) => e.id).toList());

      teamBox.putMany(editedTeams);
      teamBox.removeMany(removedTeams.map((e) => e.id).toList());

      pointBox.putMany(editedPoints);
      pointBox.removeMany(removedPoints.map((e) => e.id).toList());

      penaltyBox.putMany(editedPenalties);
      penaltyBox.removeMany(removedPenalties.map((e) => e.id).toList());

      starBox.putMany(editedStars);
      starBox.removeMany(removedStars.map((e) => e.id).toList());

      tagBox.putMany(editedTags);
      tagBox.removeMany(removedTags.map((e) => e.id).toList());
    });

    entity.modifiedDate = DateTime.now();
    return box.putAndGetAsync(entity);
  }

  Future<MatchEntity?> get(int id) async {
    final db = await databaseRepository.database;
    final box = db.box<MatchEntity>();
    return await box.getAsync(id);
  }

  Future<List<MatchEntity>> getList(int skip, int take) async {
    final db = await databaseRepository.database;
    final box = db.box<MatchEntity>();
    final query = box.query().order(MatchEntity_.createdDate, flags: Order.descending).build();
    query.limit = take;
    query.offset = skip;
    final returnValue = await query.findAsync();
    query.close();
    return returnValue;
  }

  Future<List<MatchEntity>> search(String search, List<String> selectedTags) async {
    final db = await databaseRepository.database;
    final box = db.box<MatchEntity>();
    final builder = box.query(MatchEntity_.name.contains(search, caseSensitive: false));

    if (selectedTags.isNotEmpty) {
      builder.linkMany(MatchEntity_.tags, TagEntity_.name.oneOf(selectedTags, caseSensitive: false));
    }

    final query = builder.order(MatchEntity_.createdDate, flags: Order.descending).build();
    final returnValue = await query.findAsync();
    query.close();
    return returnValue;
  }
}
