import 'package:monpacing/repositories/base_repository.dart';

import '../models/match_model.dart';
import 'database.dart';

class MatchesRepository extends BaseRepository<MatchModel> {
  static const int _pageSize = 20;

  @override
  Future<MatchModel> add(MatchModel entity) async {
    if (entity.id != null) {
      throw Exception("id must be null");
    }

    var now = DateTime.now();
    entity.createdDate = now;
    entity.modifiedDate = now;

    var db = await database;
    var serializedEntity = entity.toDatabase();
    var id = await db.insert(matchesTable, serializedEntity);

    entity.id = id;
    return entity;
  }

  @override
  Future<void> delete(int id) async {
    var db = await database;
    await db.delete(
      matchesTable,
      where: '$idField = ?',
      whereArgs: [id],
    );
  }

  @override
  Future<void> edit(MatchModel entity) async {
    if (entity.id == null) {
      throw Exception("id must not be null");
    }

    entity.modifiedDate = DateTime.now();

    var db = await database;
    await db.update(
      matchesTable,
      entity.toDatabase(),
      where: '$idField = ?',
      whereArgs: [entity.id!],
    );
  }

  @override
  Future<MatchModel?> get(int id) async {
    var db = await database;
    var items = await db.query(
      matchesTable,
      where: "$idField = ?",
      whereArgs: [id],
      limit: 1,
    );

    if (items.isEmpty) {
      return null;
    }

    return MatchModel.fromDatabase(items.first);
  }

  @override
  Future<List<MatchModel>> getList(int page) async {
    var db = await database;
    var items = await db.query(
      matchesTable,
      offset: (page - 1) * _pageSize,
      limit: _pageSize,
      orderBy: "$modifiedDateField DESC",
    );

    return items.map(((e) => MatchModel.fromDatabase(e))).toList();
  }
}
