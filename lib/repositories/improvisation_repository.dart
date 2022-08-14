import 'package:monpacing/models/improvisation_model.dart';
import 'package:monpacing/repositories/base_repository.dart';

import 'database.dart';

class ImprovisationRepository extends BaseRepository<ImprovisationModel> {
  @override
  Future<ImprovisationModel> add(ImprovisationModel entity) {
    throw UnimplementedError();
  }

  @override
  Future<void> delete(int id) {
    throw UnimplementedError();
  }

  @override
  Future<void> edit(ImprovisationModel entity) {
    throw UnimplementedError();
  }

  @override
  Future<ImprovisationModel?> get(int id) async {
    var db = await database;
    var items = await db.query(
      improvisationsTable,
      where: "$idField = ?",
      whereArgs: [id],
      limit: 1,
    );

    if (items.isEmpty) {
      return null;
    }

    return ImprovisationModel.fromJson(items.first);
  }

  @override
  Future<List<ImprovisationModel>> getList(int page) {
    throw UnimplementedError();
  }

  @override
  Future<List<ImprovisationModel>> getListByParentId(int parentId) async {
    var db = await database;
    var items = await db.query(
      improvisationsTable,
      where: "$pacingIdField = ?",
      whereArgs: [parentId],
    );

    return items.map(((e) => ImprovisationModel.fromJson(e))).toList();
  }
}
