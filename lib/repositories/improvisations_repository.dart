import 'database_repository.dart';
import 'entities/improvisation_entity.dart';
import 'objectbox.g.dart';

class ImprovisationsRepository {
  final DatabaseRepository databaseRepository;

  const ImprovisationsRepository({required this.databaseRepository});

  Future<ImprovisationEntity> add(ImprovisationEntity entity) async {
    final db = await databaseRepository.database;
    final box = db.box<ImprovisationEntity>();
    final now = DateTime.now();
    entity.createdDate = now;
    entity.modifiedDate = now;
    return await box.putAndGetAsync(entity);
  }

  Future<void> delete(ImprovisationEntity entity) async {
    final db = await databaseRepository.database;
    final box = db.box<ImprovisationEntity>();
    box.remove(entity.id);
  }

  Future<ImprovisationEntity> edit(ImprovisationEntity entity) async {
    final db = await databaseRepository.database;
    final box = db.box<ImprovisationEntity>();
    entity.modifiedDate = DateTime.now();
    return box.putAndGetAsync(entity);
  }

  Future<ImprovisationEntity?> get(int id) async {
    final db = await databaseRepository.database;
    final box = db.box<ImprovisationEntity>();
    return await box.getAsync(id);
  }

  Future<List<ImprovisationEntity>> getList(int skip, int take) async {
    final db = await databaseRepository.database;
    final box = db.box<ImprovisationEntity>();
    final builder = box
        .query(ImprovisationEntity_.hasParent.equals(false))
        .order(ImprovisationEntity_.createdDate, flags: Order.descending);

    final query = builder.build();
    query.limit = take;
    query.offset = skip;
    final returnValue = await query.findAsync();
    query.close();
    return returnValue;
  }

  Future<List<ImprovisationEntity>> search(String search) async {
    final db = await databaseRepository.database;
    final box = db.box<ImprovisationEntity>();
    final builder = box.query(
      ImprovisationEntity_.hasParent
          .equals(false)
          .and(ImprovisationEntity_.category.contains(search, caseSensitive: false)),
    );

    final query = builder.order(ImprovisationEntity_.createdDate, flags: Order.descending).build();
    final returnValue = await query.findAsync();
    query.close();
    return returnValue;
  }
}
