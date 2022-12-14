import 'dart:convert';

import 'base_repository.dart';
import '../models/pacing_model.dart';
import 'database.dart';

class PacingsRepository extends BaseRepository<PacingModel> {
  static const int _pageSize = 20;

  @override
  Future<PacingModel> add(PacingModel entity) async {
    if (entity.id != null) {
      throw Exception("id must be null");
    }

    var now = DateTime.now();
    var model = entity.copyWith(createdDate: now, modifiedDate: now);

    var db = await database;
    var serializedEntity = _toDatabase(model);
    var id = await db.insert(pacingsTable, serializedEntity);

    return model.copyWith(id: id);
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

    var model = entity.copyWith(modifiedDate: DateTime.now());

    var db = await database;
    await db.update(
      pacingsTable,
      _toDatabase(model),
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

    return _fromDatabase(items.first);
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

    return items.map(((e) => _fromDatabase(e))).toList();
  }

  PacingModel _fromDatabase(Map<String, dynamic> json) {
    var newValues = Map<String, dynamic>.from(json);
    newValues.update("improvisations", (value) => jsonDecode(value));
    return PacingModel.fromJson(newValues);
  }

  Map<String, dynamic> _toDatabase(PacingModel model) {
    var items = model.toJson();
    items["improvisations"] = jsonEncode(items["improvisations"]);
    return items;
  }
}
