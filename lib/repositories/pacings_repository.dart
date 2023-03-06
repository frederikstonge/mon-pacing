import 'dart:convert';

import '../models/pacing_model.dart';
import 'database_repository.dart';

class PacingsRepository {
  final DatabaseRepository databaseRepository;

  const PacingsRepository({
    required this.databaseRepository,
  });

  Future<PacingModel> add(PacingModel entity) async {
    if (entity.id != null) {
      throw Exception("id must be null");
    }

    var now = DateTime.now();
    var model = entity.copyWith(createdDate: now, modifiedDate: now);

    var db = await databaseRepository.database;
    var serializedEntity = _toDatabase(model);
    var id = await db.insert(DatabaseRepository.pacingsTable, serializedEntity);

    return model.copyWith(id: id);
  }

  Future<void> delete(int id) async {
    var db = await databaseRepository.database;
    await db.delete(
      DatabaseRepository.pacingsTable,
      where: '${DatabaseRepository.idField} = ?',
      whereArgs: [id],
    );
  }

  Future<void> edit(PacingModel entity) async {
    if (entity.id == null) {
      throw Exception("id must not be null");
    }

    var model = entity.copyWith(modifiedDate: DateTime.now());

    var db = await databaseRepository.database;
    await db.update(
      DatabaseRepository.pacingsTable,
      _toDatabase(model),
      where: '${DatabaseRepository.idField} = ?',
      whereArgs: [entity.id!],
    );
  }

  Future<PacingModel?> get(int id) async {
    var db = await databaseRepository.database;
    var items = await db.query(
      DatabaseRepository.pacingsTable,
      where: "${DatabaseRepository.idField} = ?",
      whereArgs: [id],
      limit: 1,
    );

    if (items.isEmpty) {
      return null;
    }

    return _fromDatabase(items.first);
  }

  Future<List<PacingModel>> getList(int skip, int take) async {
    var db = await databaseRepository.database;
    var items = await db.query(
      DatabaseRepository.pacingsTable,
      offset: skip,
      limit: take,
      orderBy: "${DatabaseRepository.modifiedDateField} DESC",
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
