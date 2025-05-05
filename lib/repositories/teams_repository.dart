import 'database_repository.dart';
import 'entities/performer_entity.dart';
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
    await performerBox.removeManyAsync(entity.performers.map((e) => e.id).toList());

    await box.removeAsync(entity.id);
  }

  Future<void> edit(TeamEntity entity) async {
    final db = await databaseRepository.database;
    final box = db.box<TeamEntity>();
    final performerBox = db.box<PerformerEntity>();

    final previousEntity = await box.getAsync(entity.id);

    final removedImprovisations =
        previousEntity!.performers.where((e) => !entity.performers.any((i) => i.id == e.id)).toList();
    final editedImprovisations = entity.performers.where((e) => e.id != 0).toList();

    db.runInTransaction(TxMode.write, () {
      performerBox.putMany(editedImprovisations);
      performerBox.removeMany(removedImprovisations.map((e) => e.id).toList());

      entity.modifiedDate = DateTime.now();
      box.put(entity);
    });
  }

  Future<TeamEntity?> get(int id) async {
    final db = await databaseRepository.database;
    final box = db.box<TeamEntity>();
    return await box.getAsync(id);
  }

  Future<List<TeamEntity>> getList(int skip, int take) async {
    final db = await databaseRepository.database;
    final box = db.box<TeamEntity>();
    final query = box.query().order(TeamEntity_.createdDate, flags: Order.descending).build();
    query.limit = take;
    query.offset = skip;
    final returnValue = await query.findAsync();
    query.close();
    return returnValue;
  }

  Future<List<TeamEntity>> search(String search, List<String> selectedTags) async {
    final db = await databaseRepository.database;
    final box = db.box<TeamEntity>();
    final builder =
        search.isNotEmpty ? box.query(TeamEntity_.name.contains(search, caseSensitive: false)) : box.query();
    if (search.isNotEmpty) {
      builder.linkMany(TeamEntity_.performers, PerformerEntity_.name.contains(search, caseSensitive: false));
    }

    final query = builder.order(TeamEntity_.createdDate, flags: Order.descending).build();
    final returnValue = query.findAsync();
    query.close();
    return returnValue;
  }

  Future<List<String>> getAllTags({String query = ''}) async {
    final db = await databaseRepository.database;
    final box = db.box<TeamEntity>();
    final query = box.query().build();
    final returnValue = query.property(TeamEntity_.tags).find();
    query.close();
    return returnValue;
  }
}
