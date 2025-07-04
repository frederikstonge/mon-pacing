import 'database_repository.dart';
import 'entities/performer_entity.dart';
import 'entities/tag_entity.dart';
import 'entities/team_entity.dart';
import 'objectbox.g.dart';

class TeamsRepository {
  final DatabaseRepository databaseRepository;

  const TeamsRepository({required this.databaseRepository});

  Future<TeamEntity> add(TeamEntity entity) async {
    final db = await databaseRepository.database;
    final box = db.box<TeamEntity>();
    final now = DateTime.now();
    entity.createdDate = now;
    entity.modifiedDate = now;
    return await box.putAndGetAsync(entity);
  }

  Future<void> delete(TeamEntity entity) async {
    final db = await databaseRepository.database;
    final box = db.box<TeamEntity>();
    final performerBox = db.box<PerformerEntity>();
    final tagBox = db.box<TagEntity>();

    db.runInTransaction(TxMode.write, () {
      performerBox.removeMany(entity.performers.map((e) => e.id).toList());
      tagBox.removeMany(entity.tags.map((e) => e.id).toList());

      box.remove(entity.id);
    });
  }

  Future<TeamEntity> edit(TeamEntity entity) async {
    final db = await databaseRepository.database;
    final box = db.box<TeamEntity>();
    final performerBox = db.box<PerformerEntity>();
    final tagBox = db.box<TagEntity>();

    final previousEntity = await box.getAsync(entity.id);

    final removedPerformers = previousEntity!.performers
        .where((e) => !entity.performers.any((i) => i.id == e.id))
        .toList();

    final editedPerformers = entity.performers.where((e) => e.id == 0).toList();

    final removedTags = previousEntity.tags.where((e) => !entity.tags.any((i) => i.id == e.id)).toList();
    final editedTags = entity.tags.where((e) => e.id == 0).toList();

    db.runInTransaction(TxMode.write, () {
      performerBox.putMany(editedPerformers);
      performerBox.removeMany(removedPerformers.map((e) => e.id).toList());

      tagBox.putMany(editedTags);
      tagBox.removeMany(removedTags.map((e) => e.id).toList());
    });

    entity.modifiedDate = DateTime.now();
    return box.putAndGetAsync(entity);
  }

  Future<TeamEntity?> get(int id) async {
    final db = await databaseRepository.database;
    final box = db.box<TeamEntity>();
    return await box.getAsync(id);
  }

  Future<List<TeamEntity>> getList(int skip, int take) async {
    final db = await databaseRepository.database;
    final box = db.box<TeamEntity>();
    final query = box
        .query(TeamEntity_.hasMatch.equals(false))
        .order(TeamEntity_.createdDate, flags: Order.descending)
        .build();
    query.limit = take;
    query.offset = skip;
    final returnValue = await query.findAsync();
    query.close();
    return returnValue;
  }

  Future<List<TeamEntity>> search(String search, List<String> selectedTags) async {
    final db = await databaseRepository.database;
    final box = db.box<TeamEntity>();
    final builder = box.query(
      TeamEntity_.hasMatch.equals(false).and(TeamEntity_.name.contains(search, caseSensitive: false)),
    );

    if (selectedTags.isNotEmpty) {
      builder.linkMany(TeamEntity_.tags, TagEntity_.name.oneOf(selectedTags, caseSensitive: false));
    }

    final query = builder.order(TeamEntity_.createdDate, flags: Order.descending).build();
    final returnValue = await query.findAsync();
    query.close();
    return returnValue;
  }
}
