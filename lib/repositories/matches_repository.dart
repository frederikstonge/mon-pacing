import 'dart:convert';

import '../models/match_model.dart';
import 'database.dart';

class MatchesRepository {
  Future<MatchModel> add(MatchModel entity) async {
    if (entity.id != null) {
      throw Exception("id must be null");
    }

    var now = DateTime.now();
    var model = entity.copyWith(createdDate: now, modifiedDate: now);

    var db = await database;
    var serializedEntity = _toDatabase(model);
    var id = await db.insert(matchesTable, serializedEntity);

    return model.copyWith(id: id);
  }

  Future<void> delete(int id) async {
    var db = await database;
    await db.delete(
      matchesTable,
      where: '$idField = ?',
      whereArgs: [id],
    );
  }

  Future<void> edit(MatchModel entity) async {
    if (entity.id == null) {
      throw Exception("id must not be null");
    }

    var model = entity.copyWith(modifiedDate: DateTime.now());

    var db = await database;
    await db.update(
      matchesTable,
      _toDatabase(model),
      where: '$idField = ?',
      whereArgs: [entity.id!],
    );
  }

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

    return _fromDatabase(items.first);
  }

  Future<List<MatchModel>> getList(int skip, int take) async {
    var db = await database;
    var items = await db.query(
      matchesTable,
      offset: skip,
      limit: take,
      orderBy: "$modifiedDateField DESC",
    );

    return items.map(((e) => _fromDatabase(e))).toList();
  }

  MatchModel _fromDatabase(Map<String, dynamic> json) {
    var newValues = Map<String, dynamic>.from(json);
    newValues.update("improvisations", (value) => jsonDecode(value));
    newValues.update("teams", (value) => jsonDecode(value));
    newValues.update("penalties", (value) => jsonDecode(value));
    newValues.update("points", (value) => jsonDecode(value));
    return MatchModel.fromJson(newValues);
  }

  Map<String, dynamic> _toDatabase(MatchModel model) {
    var items = model.toJson();
    items["improvisations"] = jsonEncode(items["improvisations"]);
    items["teams"] = jsonEncode(items["teams"]);
    items["penalties"] = jsonEncode(items["penalties"]);
    items["points"] = jsonEncode(items["points"]);
    return items;
  }
}
