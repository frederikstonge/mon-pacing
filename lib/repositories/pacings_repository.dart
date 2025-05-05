import 'database_repository.dart';
import 'entities/improvisation_entity.dart';
import 'entities/pacing_entity.dart';
import 'objectbox.g.dart';

class PacingsRepository {
  final DatabaseRepository databaseRepository;

  const PacingsRepository({required this.databaseRepository});

  Future<PacingEntity> add(PacingEntity entity) async {
    final db = await databaseRepository.database;
    final box = db.box<PacingEntity>();
    final now = DateTime.now();
    entity.createdDate = now;
    entity.modifiedDate = now;
    return await box.putAndGetAsync(entity);
  }

  Future<void> delete(PacingEntity entity) async {
    final db = await databaseRepository.database;
    final box = db.box<PacingEntity>();

    final improvisationBox = db.box<ImprovisationEntity>();
    await improvisationBox.removeManyAsync(entity.improvisations.map((e) => e.id).toList());

    await box.removeAsync(entity.id);
  }

  Future<PacingEntity> edit(PacingEntity entity) async {
    final db = await databaseRepository.database;
    final box = db.box<PacingEntity>();
    final improvisationBox = db.box<ImprovisationEntity>();

    final previousEntity = await box.getAsync(entity.id);

    final removedImprovisations =
        previousEntity!.improvisations.where((e) => !entity.improvisations.any((i) => i.id == e.id)).toList();
    final editedImprovisations = entity.improvisations.where((e) => e.id != 0).toList();

    return db.runInTransaction(TxMode.write, () {
      improvisationBox.putMany(editedImprovisations);
      improvisationBox.removeMany(removedImprovisations.map((e) => e.id).toList());

      entity.modifiedDate = DateTime.now();
      return box.putAndGetAsync(entity);
    });
  }

  Future<PacingEntity?> get(int id) async {
    final db = await databaseRepository.database;
    final box = db.box<PacingEntity>();
    return await box.getAsync(id);
  }

  Future<List<PacingEntity>> getList(int skip, int take) async {
    final db = await databaseRepository.database;
    final box = db.box<PacingEntity>();
    final query = box.query().order(PacingEntity_.createdDate, flags: Order.descending).build();
    query.limit = take;
    query.offset = skip;
    final returnValue = await query.findAsync();
    query.close();
    return returnValue;
  }

  Future<List<PacingEntity>> search(String search, List<String> selectedTags) async {
    final db = await databaseRepository.database;
    final box = db.box<PacingEntity>();
    final builder =
        search.isNotEmpty ? box.query(PacingEntity_.name.contains(search, caseSensitive: false)) : box.query();
    if (search.isNotEmpty) {
      builder.linkMany(
        PacingEntity_.improvisations,
        ImprovisationEntity_.category
            .contains(search, caseSensitive: false)
            .or(ImprovisationEntity_.theme.contains(search, caseSensitive: false)),
      );
    }

    final query = builder.order(PacingEntity_.createdDate, flags: Order.descending).build();
    final returnValue = query.findAsync();
    query.close();
    return returnValue;
  }

  Future<List<String>> getAllTags({String query = ''}) async {
    final db = await databaseRepository.database;
    final box = db.box<PacingEntity>();
    final query = box.query().build();
    final returnValue = query.property(PacingEntity_.tags).find();
    query.close();
    return returnValue;
  }

  Future<List<String>> getAllCategories({String search = ''}) async {
    final db = await databaseRepository.database;
    final box = db.box<ImprovisationEntity>();
    final builder =
        search.isNotEmpty
            ? box.query(ImprovisationEntity_.category.contains(search, caseSensitive: false))
            : box.query();
    final query = builder.build();
    final returnValue = query.property(ImprovisationEntity_.category).find();
    query.close();
    return returnValue;
  }
}
