import 'package:monpacing/repositories/base_repository.dart';

import '../models/pacing_model.dart';
import 'database.dart';

class PacingRepository extends BaseRepository<PacingModel> {
  static const int _pageSize = 20;

  @override
  Future<PacingModel> add(PacingModel entity) async {
    if (entity.id != null) {
      throw Exception("id must be null");
    }

    var now = DateTime.now();
    entity.createdDate = now;
    entity.modifiedDate = now;

    var db = await database;
    var serializedEntity = entity.toDatabase();
    var id = await db.insert(pacingsTable, serializedEntity);

    entity.id = id;
    return entity;
  }

  @override
  Future<void> delete(int id) async {
    var db = await database;
    await db.delete(
      pacingsTable,
      where: '$idField = ?',
      whereArgs: [id],
    );
  }

  @override
  Future<void> edit(PacingModel entity) async {
    if (entity.id == null) {
      throw Exception("id must not be null");
    }

    entity.modifiedDate = DateTime.now();

    var db = await database;
    await db.update(
      pacingsTable,
      entity.toDatabase(),
      where: '$idField = ?',
      whereArgs: [entity.id!],
    );
  }

  @override
  Future<PacingModel?> get(int id) async {
    var db = await database;
    var items = await db.query(
      pacingsTable,
      where: "$idField = ?",
      whereArgs: [id],
      limit: 1,
    );

    if (items.isEmpty) {
      return null;
    }

    return PacingModel.fromDatabase(items.first);
  }

  @override
  Future<List<PacingModel>> getList(int page) async {
    var db = await database;
    var items = await db.query(
      pacingsTable,
      offset: (page - 1) * _pageSize,
      limit: _pageSize,
      orderBy: "$modifiedDateField DESC",
    );

    return items.map(((e) => PacingModel.fromDatabase(e))).toList();
  }
}
