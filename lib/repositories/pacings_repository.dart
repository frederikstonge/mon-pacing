import 'database_repository.dart';
import 'entities/improvisation_entity.dart';
import 'entities/pacing_entity.dart';
import 'entities/tag_entity.dart';
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
    final tagBox = db.box<TagEntity>();

    db.runInTransaction(TxMode.write, () {
      improvisationBox.removeMany(entity.improvisations.map((e) => e.id).toList());
      tagBox.removeMany(entity.tags.map((e) => e.id).toList());

      box.remove(entity.id);
    });
  }

  Future<void> edit(PacingEntity entity) async {
    final db = await databaseRepository.database;
    final box = db.box<PacingEntity>();
    final improvisationBox = db.box<ImprovisationEntity>();
    final tagBox = db.box<TagEntity>();

    final previousEntity = await box.getAsync(entity.id);

    final removedImprovisations =
        previousEntity!.improvisations.where((e) => !entity.improvisations.any((i) => i.id == e.id)).toList();
    final editedImprovisations = entity.improvisations.where((e) => e.id != 0).toList();

    final removedTags = previousEntity.tags.where((e) => !entity.tags.any((i) => i.id == e.id)).toList();
    final editedTags = entity.tags.where((e) => e.id != 0).toList();

    db.runInTransaction(TxMode.write, () {
      improvisationBox.putMany(editedImprovisations);
      improvisationBox.removeMany(removedImprovisations.map((e) => e.id).toList());

      tagBox.putMany(editedTags);
      tagBox.removeMany(removedTags.map((e) => e.id).toList());

      entity.modifiedDate = DateTime.now();
      return box.put(entity);
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

    if (selectedTags.isNotEmpty) {
      builder.linkMany(PacingEntity_.tags, TagEntity_.name.oneOf(selectedTags, caseSensitive: false));
    }

    final query = builder.order(PacingEntity_.createdDate, flags: Order.descending).build();
    final returnValue = await query.findAsync();
    query.close();
    return returnValue;
  }

  Future<List<TagEntity>> getAllTags({String search = ''}) async {
    final db = await databaseRepository.database;
    final box = db.box<TagEntity>();
    final builder = search.isNotEmpty ? box.query(TagEntity_.name.contains(search, caseSensitive: false)) : box.query();
    final query = builder.build();
    final returnValue = await query.findAsync();
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
